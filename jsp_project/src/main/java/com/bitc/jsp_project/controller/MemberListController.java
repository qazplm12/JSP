package com.bitc.jsp_project.controller;

import com.bitc.jsp_project.model.DAO;
import com.bitc.jsp_project.model.MembersDTO;
import com.bitc.jsp_project.model.PostsDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/memberList.do")
public class MemberListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        DAO dao = new DAO();
        List<MembersDTO> memberList = dao.selectMemberList();
        List<PostsDTO> categories = dao.selectCategory();
        dao.dbClose();

        req.setAttribute("memberList", memberList);
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/adminPage.jsp").forward(req, resp);
    }
}
