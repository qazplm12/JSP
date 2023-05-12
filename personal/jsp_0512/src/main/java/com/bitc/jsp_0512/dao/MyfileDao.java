package com.bitc.jsp_0512.dao;

import com.bitc.jsp_0512.dto.MyfileDto;

import java.sql.*;
import java.util.*;

public class MyfileDao extends JDBConnect {

    public int insertFile(MyfileDto dto) {
        int applyResult = 0;
        try {
            String query = "INSERT INTO myfile (name, title, cate, ofile, sfile, postdate) ";
            query += "VALUES(?, ?, ?, ?, ?, NOW())";

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getCate());
            pstmt.setString(4, dto.getOfile());
            pstmt.setString(5, dto.getSfile());

            applyResult = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applyResult;
    }


    public List<MyfileDto> myFileList() {
        List<MyfileDto> fileList = new ArrayList<>();

        // 파일 목록을 불러올 SQL 문
        String query = "SELECT * FROM myfile ORDER BY idx DESC ";

        try {
            pstmt = conn.prepareStatement(query);
            // 데이터 베이스에 SQL 쿼리를 전달하여 실행하고 결과값 받아오기
            rs = pstmt.executeQuery();

            while (rs.next()) {
                // 각각의 데이터를 저장하기 위해 MyfileDto 타입의 객체 생성
                MyfileDto item = new MyfileDto();
                // ResultSet에 저장된 정보를 MyfileDto 타입의 객체에 저장
                item.setIdx(rs.getString("idx"));
                item.setName(rs.getString("name"));
                item.setTitle(rs.getString("title"));
                item.setCate(rs.getString("cate"));
                item.setOfile(rs.getString("ofile"));
                item.setSfile(rs.getString("sfile"));
                item.setPostdate(rs.getString("postdate"));

                // 저장된 정보를 List에 추가
                fileList.add(item);
            }

        } catch (SQLException e) {
            System.out.println("***** SELECT 시 오류 발생 *****");
            e.printStackTrace();
        }

        // 저장된 list를 반환
        return fileList;
    }
}
