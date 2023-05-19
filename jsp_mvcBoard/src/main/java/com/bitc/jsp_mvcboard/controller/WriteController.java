package com.bitc.jsp_mvcboard.controller;

import com.bitc.jsp_mvcboard.model.MVCBoardDAO;
import com.bitc.jsp_mvcboard.model.MVCBoardDTO;
import com.bitc.jsp_mvcboard.util.FileUtils;
import com.bitc.jsp_mvcboard.util.JSFunc;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(value = "/mvcBoard/Write.do")
public class WriteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/View/write.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 클라이언트에서 전송된 내용 가져오기
//        String title = req.getParameter("title");
//        String writer = req.getParameter("writer");
//        String pass = req.getParameter("pass");
//        String contents = req.getParameter("contents");

        // 현재 파일 정보에 대한 내용이 없음

        // String saveDir = req.getServletContext().getRealPath("/upload");
        // 서버에 저장할 위치
        String saveDir = "C:\\upload";

        // 업로드 파일 최대 용량 제한
        int maxSize = 1024 * 1024 * 10;

        // MultipartRequest로 데이터 가져오기
        MultipartRequest mr = FileUtils.uploadFile(req, saveDir, maxSize);
        if (mr == null) {
            JSFunc.alertLocation(resp, "첨부 파일의 크기가 큽니다.", "mvcBoard/Write.do");
        }



        MVCBoardDTO board = new MVCBoardDTO();

        board.setPostTitle(mr.getParameter("title"));
        board.setPostWriter(mr.getParameter("writer"));
        board.setPostPass(mr.getParameter("pass"));
        board.setPostContent(mr.getParameter("contents"));

        String fileName = mr.getFilesystemName("file");

        if (fileName != null) {
            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
            String ext = fileName.substring(fileName.lastIndexOf("."));
            String newFileName = now + ext;

            File oldFile = new File(saveDir + File.separator + fileName);
            File newFile = new File(saveDir + File.separator + newFileName);
            oldFile.renameTo(newFile);

            board.setPostOfile(fileName);
            board.setPostSfile(newFileName);
        }



        // 2. 데이터 베이스 연결
        MVCBoardDAO dao = new MVCBoardDAO();

        // 3. 데이터 베이스에 전송된 내용 등록하기
        int result = dao.insertBoard(board);
        dao.dbClose();

        // 4. 리스트 페이지로 이동
        if (result == 1) {
            resp.sendRedirect("/mvcBoard/List.do");
        } else {
            resp.sendRedirect("/mvcBoard/Write.do");
        }

    }

}
