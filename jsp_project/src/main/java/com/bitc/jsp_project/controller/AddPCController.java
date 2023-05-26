package com.bitc.jsp_project.controller;

import com.bitc.jsp_project.model.DAO;
import com.bitc.jsp_project.model.PostsDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/addPC.do")
public class AddPCController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        int idx = Integer.parseInt(req.getParameter("postNum"));
        String userId = (String)session.getAttribute("userId");
        String content = req.getParameter("PCContent");

        DAO dao = new DAO();

        dao.addPostComment(idx, userId, content);
        List<PostsDTO> categories = dao.selectCategory();

        dao.dbClose();

        req.setAttribute("categories", categories);
        resp.sendRedirect("/view.do"+ "?postNum=" + idx);

    }
}