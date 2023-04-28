package com.bitc.jsp_0428;

import java.sql.SQLException;


// DAO : 자바에서 데이터베이스에 접근하고 데이터를 CRUD하기 위해 사용하는 클래스
// View 부분과 데이터 처리 부분을 분리하여 관리하기 위함
public class MemberDAO extends JDBConnect{
    public MemberDAO(String drv, String url, String id, String pw) {
        super(drv, url, id, pw);
    }

    // 데이터 베이스에서 사용자 목록 가져오기
    public MemberDTO getMemberDTO(String uid, String upass) {

        MemberDTO dto = new MemberDTO();
        String sql = "SELECT * FROM member WHERE id=? AND pass=? ";

        try {
            // PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);
            // SQL 쿼리문에 있는 ?를 실제 데이터로 변환
            pstmt.setString(1, uid);
            pstmt.setString(2, upass);

            // 데이터 베이스로 쿼리문 실행
            rs = pstmt.executeQuery();

            if (rs.next()) {

                // ResultSet에 저장된 데이터 중 컬럼명을 통하여 데이터 가져오기
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                // ResultSet에 저장된 데이터 중 index 번호로 데이터 가져오기
                dto.setName(rs.getString(3));
                dto.setRegidate(rs.getString(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }
}
