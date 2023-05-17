package com.bitc.jsp_0517.servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/servlet/FormProcess.do")
public class FormProcess extends HttpServlet{

    // get 방식으로 요청 시 처리하는 메소드
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");

        req.setAttribute("userName", userName);
        req.setAttribute("userEmail", userEmail);
        req.setAttribute("type", "get");
        req.getRequestDispatcher("/servlet/FormResult.jsp").forward(req, resp);
    }

    // post 방식으로 요청 시 처리하는 메소드
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");

        req.setAttribute("userName", userName);
        req.setAttribute("userEmail", userEmail);
        req.setAttribute("type", "post");
        req.getRequestDispatcher("/servlet/FormResult.jsp").forward(req, resp);
    }
}
