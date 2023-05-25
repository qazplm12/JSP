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

        int idx = Integer.parseInt(req.getParameter("postNum"));
        String category = req.getParameter("category");
        String title = req.getParameter("postTitle");
        String content = req.getParameter("postContent");

        if (idx > 0) {
            DAO dao = new DAO();
            dao.editPost(idx, category, title, content);
            dao.dbClose();
        }

        resp.sendRedirect("/view.do"+ "?postNum=" + idx);
//        req.setAttribute("board", board);
//        req.setAttribute("categories", categories);
//        req.getRequestDispatcher("/edit.jsp").forward(req, resp);

    }
}
