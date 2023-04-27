package com.bitc.jsp_0427;

import java.sql.*;
import java.util.*;

public class JDBCTest {
    public Connection conn;
    public Statement stmt;
    public PreparedStatement pstmt;
    public ResultSet rs;

    private String dbDriver;
    private String dbUrl;
    private String dbUserId;
    private String dbUserPw;

    private int postNum;
    private String postTitle;
    private String postId;
    private String postContent;
    private String postDate;
    private int postVisitCount;

    public JDBCTest() {

    }

    public JDBCTest(String dbDriver, String dbUrl, String dbUserId, String dbUserPw) {
        this.dbDriver = dbDriver;
        this.dbUrl = dbUrl;
        this.dbUserId = dbUserId;
        this.dbUserPw = dbUserPw;

        try {
            Class.forName(dbDriver);
            conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);


            System.out.println("데이터 베이스 연결에 성공했습니다.");
        } catch (Exception e) {
            System.out.println("데이터 베이스 연결에 실패했습니다..");
            System.out.println("SQLException : " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
            System.out.println("JDBC 자원 해제");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 게시판 글 등록 메소드
    public int postWrite(String postTitle, String postId, String postContent) {
        String sql = "INSERT INTO board (title, content, id, postdate)";
        sql += "VALUES(?, ?, ?, NOW())";

        int result = 0;

        try {
            // 생성된 SQL과 함께 PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);
            // sql의 ? 부분에 실제 데이터를 추가
            pstmt.setString(1, postTitle);
            pstmt.setString(2, postContent);
            pstmt.setString(3, postId);

            // insert 쿼리문 실행
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // 게시판 글 목록 확인 메소드
    public List<Map<String, String>> postList() {
        String sql = "SELECT num, title, id, postdate, visitcount FROM board ";
        List<Map<String, String>> dataList = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                // ResultSet에 저장된 내용 출력
                int postNum = rs.getInt("num");
                String postTitle = rs.getString("title");
                String postId = rs.getString("id");
                String postDate = rs.getString("postdate");
                String postVisit = rs.getString("visitcount");

                Map<String, String> data = new HashMap<>();
                // ArrayList에 게시물 1개에 대한 정보를 추가함
                data.put("postNum", "postNum");
                data.put("postTitle", "postTitle");
                data.put("postId", "postId");
                data.put("postDate", "postDate");
                data.put("postVisit", "postVisit");
                dataList.add(data);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dataList;
    }
}
