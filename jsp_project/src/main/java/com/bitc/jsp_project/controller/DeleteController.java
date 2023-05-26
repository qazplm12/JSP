package com.bitc.jsp_project.controller;

import com.bitc.jsp_project.JSFunc.JSFunc;
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

@WebServlet(value = "/delete.do")
public class DeleteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        String loginId = (String)session.getAttribute("userId");
        String postId = req.getParameter("postId");
        if (loginId.equals(postId)) {
            int idx = Integer.parseInt(req.getParameter("postNum"));

            DAO dao = new DAO();
            dao.deletePost(idx);
            dao.dbClose();

        } else {

//            JSFunc.alertBack();
        }
        DAO dao = new DAO();
        List<PostsDTO> categories = dao.selectCategory();
        dao.dbClose();


        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/list.do").forward(req, resp);
    }
}
