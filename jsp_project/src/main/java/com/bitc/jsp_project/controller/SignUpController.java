package com.bitc.jsp_project.controller;

import com.bitc.jsp_project.JSFunc.JSFunc;
import com.bitc.jsp_project.model.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value ="/signUp.do")
public class SignUpController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userId = req.getParameter("userId");
        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");
        String userPass = req.getParameter("userPw");

        DAO dao = new DAO();
        int confirm = dao.checkUserId(userId);

        if (confirm > 0) {
            JSFunc.alertBack("이미 존재하는 ID 입니다.", resp);

        } else {
            String result = dao.addMember(userId, userName, userEmail, userPass);
        }
        dao.dbClose();

        resp.sendRedirect("/main.do");
    }
}
