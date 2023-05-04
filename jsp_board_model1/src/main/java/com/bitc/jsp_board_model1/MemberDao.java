package com.bitc.jsp_board_model1;

import java.sql.*;

// 회원 정보에 대한 데이터를 데이터 베이스에 저장 및 가져오기위한 클래스
public class MemberDao extends JDBConnect {

    // 지정한 사용자가 존재하는지 여부만 확인
    public int isMember(String userId, String userPw) {
        int result = 0;

        String sql = "SELECT COUNT(id) as cnt FROM member ";
        sql += "WHERE id = ? ";
        sql += "AND pass = ? ";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userId);
            pstmt.setString(2, userPw);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                result = rs.getInt("cnt");
            }
        } catch (SQLException e) {
            System.out.println("SELECT 사용 시 오류가 발생했습니다");
            e.printStackTrace();
        }

        return result;
    }

    // 실제 사용자 정보를 가져오기
    public MemberDto selectMember(String userId, String userPw) {
        MemberDto member = new MemberDto();
        String sql = "SELECT id, pass, name FROM member ";
        sql += "WHERE id = ? ";
        sql += "AND pass = ? ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,  userId);
            pstmt.setString(2,  userPw);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                member.setUserId(rs.getString("id"));
                member.setUserPass(rs.getString("pass"));
                member.setUserName(rs.getString("name"));
            }
        } catch (SQLException e) {
            System.out.println("SELECT 명령 사용 중 오류가 발생헀습니다.");
            e.printStackTrace();
        }

        return member;
    }
}
