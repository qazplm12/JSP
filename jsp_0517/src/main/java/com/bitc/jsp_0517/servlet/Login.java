package com.bitc.jsp_0517.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/servlet/Login.two")
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uri = req.getRequestURI();
        int lastSlash = uri.lastIndexOf("/");
        String commandStr = uri.substring(lastSlash);

        req.setAttribute("uri", uri);
        req.setAttribute("commandStr", commandStr);
        req.setAttribute("resultValue", "<h4>로그인 (개별 서블릿 파일)</h4>");

        req.getRequestDispatcher("/servlet/FrontController.jsp").forward(req, resp);
    }
}
