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

@WebServlet(value = "/main.do")
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        DAO dao = new DAO();
        String cate = "";

        if(req.getParameter("category") != null){
            cate = req.getParameter("category");
        }

        List<PostsDTO> boardList = dao.selectBoardList(cate);
        List<PostsDTO> categories = dao.selectCategory();
        dao.dbClose();

        req.setAttribute("boardList", boardList);
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/main.jsp").forward(req, resp);
    }
}
