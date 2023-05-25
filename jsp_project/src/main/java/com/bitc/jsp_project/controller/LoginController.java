package com.bitc.jsp_project.controller;

import com.bitc.jsp_project.model.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/login.do")
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");
        String from = req.getParameter("from");
        String queryStr = req.getParameter("queryStr");

        from = from.replace(".jsp", ".do");

        DAO dao = new DAO();

        String userName = dao.checkUser(userId, userPw);
        dao.dbClose();

        HttpSession session = req.getSession();
        // 로그인 실패 시 메시지 출력하기
        if (userName.equals("")) {
            session.setAttribute("failed", true);
        } else {
            session.setAttribute("userName", userName);
            session.setMaxInactiveInterval(60 * 30);
        }
        resp.sendRedirect(from + "?" + queryStr);
    }
}
