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

@WebServlet(value = "/edit.do")
public class EditController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        int idx = Integer.parseInt(req.getParameter("postNum"));

        DAO dao = new DAO();

        List<PostsDTO> categories = dao.selectCategory();
        PostsDTO board = dao.selectBoardDetails(idx);
        dao.dbClose();

        req.setAttribute("board", board);
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/edit.jsp").forward(req, resp);

    }
}
