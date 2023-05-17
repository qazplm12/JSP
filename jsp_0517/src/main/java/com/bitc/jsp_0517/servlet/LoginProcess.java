package com.bitc.jsp_0517.servlet;

import com.bitc.jsp_0517.database.MemberDao;
import com.bitc.jsp_0517.database.MemberDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/servlet/LoginProcess.do")
public class LoginProcess extends HttpServlet {

    private MemberDao dao;


    // Login.jsp에서 post 방식으로 전달함
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 클라이언트가 전달한 데이터 가져오기
        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");

        try {
            // DAO 객체 생성 및 데이터베이스 연결
            dao = new MemberDao();
            dao.dbOpen();

            // 클라이언트에서 전달한 사용자가 데이터베이스에 있는지 확인
            if (dao.isMember(userId, userPw) == 1) {

                // 사용자 정보를 가져옴
                MemberDto member = dao.selectMember(userId, userPw);

                // 사용자 등급 확인, 정보를 request 객체에 저장
                if (member.getUserGrade() == 1) {
                    req.setAttribute("userGrade", "관리자");
                } else if (member.getUserGrade() == 2) {
                    req.setAttribute("userGrade", "회원");
                }
                // 사용자 정보를 request 객체에 저장
                req.setAttribute("userId", member.getUserId());
                req.setAttribute("userName", member.getUserName());

                // 지정한 페이지로 이동
                req.getRequestDispatcher("/servlet/LoginResult.jsp").forward(req, resp);
            } else {
                //  로그인 오류 메시지를 request 객체에 저장
                req.setAttribute("errMsg", "회원 정보가 없습니다.");

                req.getRequestDispatcher("/servlet/LoginFail.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("errMsg","로그인 시도 중 오류가 발생했습니다.");
            System.out.println("로그인 시도 중 오류가 발생했습니다.");

            e.printStackTrace();
            req.getRequestDispatcher("/servlet/LoginFail.jsp").forward(req, resp);
        } finally {
            dao.dbClose();
        }
    }

}
