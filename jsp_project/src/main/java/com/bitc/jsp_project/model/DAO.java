package com.bitc.jsp_project.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO extends JDBConnect {

    public DAO() {
        super();
    }

    // 전체 게시물 목록 가져오기
    public List<PostsDTO> selectBoardList(String cate) {
        List<PostsDTO> boardList = new ArrayList<>();

        String query = "";
        boolean useCate = false;

        if (cate.equals("")) {
            query = "SELECT num, title, id, category, DATE_FORMAT(postdate, '%m-%d (%h:%i)') AS postdate, visitcount FROM posts ORDER BY postdate DESC ";
        } else {
            query = "SELECT num, title, id, category, DATE_FORMAT(postdate, '%m-%d (%h:%i)') AS postdate, visitcount FROM posts WHERE category = ? ORDER BY postdate DESC ";
            useCate = true;
        }

        try {
            pstmt = conn.prepareStatement(query);
            // 카테고리 값 받을 수 있게 설정
            if(useCate){
                pstmt.setString(1, cate);
            }
            rs = pstmt.executeQuery();

            while (rs.next()) {
                PostsDTO board = new PostsDTO();

                board.setPostNum(rs.getInt("num"));
                board.setPostTitle(rs.getString("title"));
                board.setPostWriter(rs.getString("id"));
                board.setCategory(rs.getString("category"));
                board.setPostDate(rs.getString("postdate"));
                board.setPostVisits(rs.getInt("visitcount"));

                boardList.add(board);
            }

        } catch (SQLException e) {
            System.out.println("****** 데이터 베이스에서 SELECT 중 오류발생 ******");
            System.out.println("****** Error" + e.getMessage() + " ******");
            e.printStackTrace();
        }

        return boardList;
    }

    public List<PostsDTO> selectCategory() {
        List<PostsDTO> categories = new ArrayList<>();

        String query = "SELECT distinct category FROM posts ";

        try {
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                PostsDTO category = new PostsDTO();

                category.setCategory(rs.getString("category"));

                categories.add(category);
            }

        } catch (SQLException e) {
            System.out.println("****** 데이터 베이스에서 SELECT 중 오류발생 ******");
            System.out.println("****** Error" + e.getMessage() + " ******");
            e.printStackTrace();
        }

        return categories;
    }

    // 데이터 베이스에 글 등록하기
    public int insertBoard(PostsDTO board) {
        int result = 0;

        String query = "INSERT INTO mvcboard ";
        query += "(post_writer, post_title, post_content, post_pass, post_date, post_ofile, post_sfile ) ";
        query += "VALUES(?, ?, ?, ?, NOW(), ?, ?); ";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, board.getPostWriter());
            pstmt.setString(2, board.getPostTitle());
            pstmt.setString(3, board.getPostContent());

            result = pstmt.executeUpdate();


        } catch (Exception e) {
            System.out.println("***** 데이터 베이스에 INSERT 중 오류 발생 *****");
            System.out.println("***** Error " + e.getMessage() + "*****");
        }


        return result;

    }

    // 게시물 상세 정보 가져오기
    public PostsDTO selectBoardDetails(int postNum) {
        PostsDTO board = new PostsDTO();

        String query = "SELECT *";
        query += "FROM posts ";
        query += "WHERE num = ?;";

        try {
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, postNum);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                board.setPostNum(rs.getInt("num"));
                board.setCategory(rs.getString("category"));
                board.setPostTitle(rs.getString("title"));
                board.setPostContent(rs.getString("content"));
                board.setPostWriter(rs.getString("id"));
                board.setPostDate(rs.getString("postdate"));
                board.setPostVisits(rs.getInt("visitcount"));
            }
        } catch (SQLException e) {
            System.out.println("***** 데이터베이스에서 SELECT 중 오류가 발생했습니다. *****");
            System.out.println("***** Error : " + e.getMessage() + "*****");
            e.printStackTrace();
        }


        return board;
    }

    public void updatePostVisits(int postNum) {
        String query = "UPDATE posts SET visitcount = visitcount + 1 ";
        query += "WHERE num = ? ";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, postNum);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("***** 데이터 베이스에 UPDATE 중 오류 발생 *****");
            System.out.println("***** Error : " + e.getMessage() + " *****");
            e.printStackTrace();
        }
    }


    public String checkUser(String userId, String userPw) {
        String userName = "";

        String query = "SELECT count(*) AS cnt, name ";
        query += "FROM members ";
        query += "WHERE id = ? AND pass = ? ";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPw);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                if (rs.getInt("cnt") == 1)  {
                    userName = rs.getString("name");
                }
            }
        } catch (SQLException e) {
            System.out.println("***** 데이터 베이스에서 SELECT 중 오류 발생 *****");
            System.out.println("***** Error : " + e.getMessage() + "*****");
        }

        return userName;
    }

    public int checkUserId(String userId) {
        int result = 0;

        String query = "SELECT count(id) AS cnt FROM members ";
        query += "WHERE id = ? ";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);

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

    public String addMember(String userId, String userName, String userEmail, String userPass) {
        String result = "";

        MembersDTO member = new MembersDTO();

        member.setId(userId);
        member.setName(userName);
        member.setEmail(userEmail);
        member.setPass(userPass);

        String query = "INSERT INTO members ";
        query += "(id, pass, name, email, grade) ";
        query += "VALUES(?, ?, ?, ?, 0)";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPass());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getEmail());

            pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("***** 데이터 베이스에 INSERT 중 오류 발생 *****");
            System.out.println("***** Error " + e.getMessage() + "*****");
        }
        return result;
    }

    public int deleteBoard(int postIdx) {
        int result = 0;

        String query = "DELETE FROM mvcboard WHERE post_idx = ? ";
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, postIdx);

            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("***** 데이터 베이스에서 DELETE 중 오류 발생 *****");
            System.out.println("***** Error : " + e.getMessage() + " *****");
            e.printStackTrace();
        }
        return result;
    }

    public int updateBoard(PostsDTO board) {
        int result = 0;

        String query = "UPDATE mvcboard SET post_title = ?, post_writer = ?, post_pass = ?, ";
        query += "post_content = ?, post_date = NOW() ";
        query += "WHERE post_idx = ?";

        try {
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, board.getPostTitle());
            pstmt.setString(2, board.getPostWriter());
            pstmt.setString(4, board.getPostContent());
            pstmt.setInt(5, board.getPostNum());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("***** 데이터 베이스에 UPDATE 중 오류 발생 *****");
            System.out.println("***** Error : " + e.getMessage() + "*****");
            e.printStackTrace();
        }

        return result;
    }

    public void updateBoardDownCount(int postIdx) {
        String query = "UPDATE mvcboard SET post_dn_count = post_dn_count + 1 ";
        query += "WHERE post_idx = ? ";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, postIdx);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("***** 데이터 베이스에 UPDATE 중 오류 발생 *****");
            System.out.println("***** Error : " + e.getMessage() + " *****");
            e.printStackTrace();
        }
    }

}
