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

@WebServlet(value = "/addPost.do")
public class AddPostController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        HttpSession session = req.getSession();
        String postWriter = (String)session.getAttribute("postWriter");


        DAO dao = new DAO();
        List<PostsDTO> categories = dao.selectCategory();

        dao.dbClose();

        req.setAttribute("postWriter", postWriter);
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/write.jsp").forward(req, resp);


    }
}