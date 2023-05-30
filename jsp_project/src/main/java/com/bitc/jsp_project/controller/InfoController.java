package com.bitc.jsp_project.controller;

import com.bitc.jsp_project.JSFunc.JSFunc;
import com.bitc.jsp_project.model.DAO;
import com.bitc.jsp_project.model.PostsDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/myPage.do")
public class InfoController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String userId = req.getParameter("userId");
        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");
        String userPw = req.getParameter("userPw");

        DAO dao = new DAO();

        dao.editMember(userId, userName, userEmail, userPw);
        dao.dbClose();

        JSFunc.alertBack("수정이 완료되었습니다.",resp);
        resp.sendRedirect("myPage.jsp?userId=" + userId );


    }
}
