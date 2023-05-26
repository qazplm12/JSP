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

@WebServlet(value = "/deletePC.do")
public class DeletePCController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int postNum = Integer.parseInt(req.getParameter("postNum"));
        String commentDate = req.getParameter("commentDate");
        String commentId = req.getParameter("commentId");


//            JSFunc.alertBack();

        DAO dao = new DAO();

        dao.deletePostComment(postNum, commentId, commentDate);
        List<PostsDTO> categories = dao.selectCategory();
        dao.dbClose();


        req.setAttribute("categories", categories);
        resp.sendRedirect("/view.do"+ "?postNum=" + postNum);
//        req.getRequestDispatcher("/list.do").forward(req, resp);
    }
}
