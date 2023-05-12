package com.bitc.jsp_0512.dao;

import java.sql.*;

public class JDBConnect {

    protected Connection conn;
    protected Statement stmt;
    protected PreparedStatement pstmt;
    protected ResultSet rs;

    private String dbDriver;
    private String dbUrl;
    private String dbUserId;
    private String dbUserPw;

    public JDBConnect() {
        dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
        dbDriver = "com.mysql.cj.jdbc.Driver";
        dbUserId = "full505";
        dbUserPw = "full505";
    }

    public void open() {
        try {
            Class.forName(dbDriver);
            conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);

            System.out.println("*****데이터 베이스 연결에 성공했습니다.*****");
        } catch (SQLException e) {
            System.out.println("*****데이터 베이스 연결에 실패했습니다..*****");
            System.out.println("SQLException : " + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
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

            System.out.println("*****JDBC 자원 해제*****");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

