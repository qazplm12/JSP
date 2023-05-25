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

                board.setPostIdx(rs.getInt("num"));
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
    public PostsDTO selectBoardDetails(int boardIdx) {
        PostsDTO board = new PostsDTO();

        String query = "SELECT post_idx, post_title, post_content, post_writer, post_date, post_ofile, post_sfile, post_visits, post_dn_count ";
        query += "FROM mvcboard ";
        query += "WHERE post_idx = ?;";

        try {
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, boardIdx);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                board.setPostIdx(rs.getInt("post_idx"));
                board.setPostTitle(rs.getString("post_title"));
                board.setPostContent(rs.getString("post_content"));
                board.setPostWriter(rs.getString("post_writer"));
                board.setPostDate(rs.getString("post_date"));
                board.setPostVisits(rs.getInt("post_visits"));
            }
        } catch (SQLException e) {
            System.out.println("***** 데이터베이스에서 SELECT 중 오류가 발생했습니다. *****");
            System.out.println("***** Error : " + e.getMessage() + "*****");
            e.printStackTrace();
        }


        return board;
    }

    public boolean equalsPassword(int postIdx, String postPass) {
        boolean result = false;
        String query = "SELECT count(*) AS cnt ";
        query += "FROM mvcboard ";
        query += "WHERE post_idx = ? AND post_pass = ? ";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, postIdx);
            pstmt.setString(2, postPass);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                if (rs.getInt("cnt") == 1) {
                    result = true;
                }
            }
        } catch (SQLException e) {
            System.out.println("***** 데이터 베이스에서 SELECT 중 오류 발생 *****");
            System.out.println("***** Error : " + e.getMessage() + "*****");
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
            pstmt.setInt(5, board.getPostIdx());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("***** 데이터 베이스에 UPDATE 중 오류 발생 *****");
            System.out.println("***** Error : " + e.getMessage() + "*****");
            e.printStackTrace();
        }

        return result;
    }

    public void updateBoardVisits(int postIdx) {
        String query = "UPDATE mvcboard SET post_visits = post_visits + 1 ";
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
