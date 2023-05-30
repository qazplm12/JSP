package com.bitc.jsp_project.controller;

import com.bitc.jsp_project.model.DAO;
import com.bitc.jsp_project.model.PostsDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/write.do")
public class WriteController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int idx = 0;
        String userId = "";

        if (req.getParameter("postNum") != null) {
            idx = Integer.parseInt(req.getParameter("postNum"));
        } else {
            userId = req.getParameter("postWriter");
        }

        String category = req.getParameter("category");
        String title = req.getParameter("postTitle");
        String content = req.getParameter("postContent");

        DAO dao = new DAO();
        if (idx > 0) {
            dao.editPost(idx, category, title, content);
            dao.dbClose();
            resp.sendRedirect("/view.do" + "?postNum=" + idx);
        } else {
            dao.addPost(category, title, content, userId);
            dao.dbClose();
            resp.sendRedirect("/list.do");
        }

    }
}
