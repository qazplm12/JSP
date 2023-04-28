package com.bitc.jsp_0428;

import java.sql.*;

public class JDBConnect {

    private String dbDriver;
    public Connection conn;
    public Statement stmt;
    public PreparedStatement pstmt;
    public ResultSet rs;

    private String dbUrl;
    private String dbUserId;
    private String dbUserPw;

    public JDBConnect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
            String dbUserId = "full505";
            String dbUserPw = "full505";
            conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);

            System.out.println("데이터 베이스 연결에 성공했습니다.");
        } catch (Exception e) {
            System.out.println("데이터 베이스 연결에 실패했습니다..");
            System.out.println("SQLException : " + e.getMessage());
            e.printStackTrace();
        }
    }

    public JDBConnect(String dbDriver, String dbUrl, String dbUserId, String dbUserPw) {
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
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }

            System.out.println("JDBC 자원 해제");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

