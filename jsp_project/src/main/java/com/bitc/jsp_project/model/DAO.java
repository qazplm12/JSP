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
            query = "SELECT num, title, id, category, DATE_FORMAT(postdate, '%m-%d (%H:%i)') AS postdate, visitcount FROM posts ORDER BY postdate DESC ";
        } else {
            query = "SELECT num, title, id, category, DATE_FORMAT(postdate, '%m-%d (%H:%i)') AS postdate, visitcount FROM posts WHERE category = ? ORDER BY postdate DESC ";
            useCate = true;
        }

        try {
            pstmt = conn.prepareStatement(query);
            // 카테고리 값 받을 수 있게 설정
            if (useCate) {
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


    public MembersDTO checkUser(String userId, String userPw) {
        MembersDTO member = new MembersDTO();

        String query = "SELECT count(*) AS cnt, name, email, grade ";
        query += "FROM members ";
        query += "WHERE id = ? AND pass = ? ";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPw);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                if (rs.getInt("cnt") == 1) {
                    member.setName(rs.getString("name"));
                    member.setEmail(rs.getString("email"));
                    member.setGrade(rs.getInt("grade"));

                }
            }
        } catch (SQLException e) {
            System.out.println("***** 데이터 베이스에서 SELECT 중 오류 발생 *****");
            System.out.println("***** Error : " + e.getMessage() + "*****");
        }

        return member;
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

    public String getEmail(String userId) {
        String myEmail = "";

        String query = "SELECT email FROM members WHERE id = ? ";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                myEmail = rs.getString("email");
            }

        } catch (SQLException e) {
            System.out.println("SELECT 사용 시 오류가 발생했습니다");
            e.printStackTrace();
        }


        return myEmail;
    }

    public void editMember(String userId, String userName, String userEmail, String userPass) {

        String query = "UPDATE members ";
        query += "SET name = ?, email = ?, pass = ? ";
        query += "WHERE id = ?";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userName);
            pstmt.setString(2, userEmail);
            pstmt.setString(3, userPass);
            pstmt.setString(4, userId);

            pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("***** 데이터 베이스에 UPDATE 중 오류 발생 *****");
            System.out.println("***** Error " + e.getMessage() + "*****");
        }

    }

    public void editPost(int idx, String category, String title, String content) {

        String query = "UPDATE posts SET category = ?, title = ?, content = ? ";
        query += "WHERE num = ?";

        PostsDTO board = new PostsDTO();

        board.setPostNum(idx);
        board.setCategory(category);
        board.setPostTitle(title);
        board.setPostContent(content);

        try {
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, board.getCategory());
            pstmt.setString(2, board.getPostTitle());
            pstmt.setString(3, board.getPostContent());
            pstmt.setInt(4, board.getPostNum());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("***** 데이터 베이스에 UPDATE 중 오류 발생 *****");
            System.out.println("***** Error : " + e.getMessage() + "*****");
            e.printStackTrace();
        }

    }

    public void deletePost(int idx) {

        String query = "DELETE FROM posts WHERE num = ? ";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, idx);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("***** 데이터 베이스에서 DELETE 중 오류 발생 *****");
            System.out.println("***** Error : " + e.getMessage() + " *****");
            e.printStackTrace();
        }
    }


    public void addPost(String category, String title, String content, String userId) {

        String query = "INSERT INTO posts ";
        query += "(category, title, content, id, postdate, visitcount) ";
        query += "VALUES(?, ?, ?, ?, NOW(), 0)";

        try {
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, category);
            pstmt.setString(2, title);
            pstmt.setString(3, content);
            pstmt.setString(4, userId);

            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("***** 데이터 베이스에 INSERT 중 오류 발생 *****");
            System.out.println("***** Error " + e.getMessage() + "*****");
        }

    }

    public List<PostCommentDTO> selectCommentList(int idx) {
        List<PostCommentDTO> commentList = new ArrayList<>();

        String query = "SELECT * FROM postcomment WHERE postnum = ? ORDER BY commentdate DESC ";

        try {
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, idx);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                PostCommentDTO comment = new PostCommentDTO();

                comment.setCommentId(rs.getString("id"));
                comment.setCommentContent(rs.getString("content"));
                comment.setCommentDate(rs.getString("commentdate"));

                commentList.add(comment);
            }

        } catch (SQLException e) {
            System.out.println("****** 데이터 베이스에서 SELECT 중 오류발생 ******");
            System.out.println("****** Error" + e.getMessage() + " ******");
            e.printStackTrace();
        }

        return commentList;
    }

    public void addPostComment(int idx, String userId, String content) {

        String query = "INSERT INTO postcomment (postnum, id, content, commentdate) ";
        query += "VALUES (?, ?, ?, now())";

        try {
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, idx);
            pstmt.setString(2, userId);
            pstmt.setString(3, content);

            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("***** 데이터 베이스에 INSERT 중 오류 발생 *****");
            System.out.println("***** Error " + e.getMessage() + "*****");
        }

    }

    public void deletePostComment(int postNum, String commentId, String commentDate) {

        String query = "DELETE FROM postcomment WHERE ";
        query += " postnum = ? AND ";
        query += "id = ? AND ";
        query += "commentdate = ?";

        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, postNum);
            pstmt.setString(2, commentId);
            pstmt.setString(3, commentDate);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("***** 데이터 베이스에서 DELETE 중 오류 발생 *****");
            System.out.println("***** Error : " + e.getMessage() + " *****");
            e.printStackTrace();
        }
    }


    public List<MembersDTO> selectMemberList() {
        List<MembersDTO> memberList = new ArrayList<>();

        String query = "SELECT id, name, email, grade FROM members ORDER BY grade DESC";

        try {
            pstmt = conn.prepareStatement(query);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                MembersDTO member = new MembersDTO();

                member.setId(rs.getString("id"));
                member.setName(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setGrade(rs.getInt("grade"));

                memberList.add(member);
            }

        } catch (SQLException e) {
            System.out.println("****** 데이터 베이스에서 SELECT 중 오류발생 ******");
            System.out.println("****** Error" + e.getMessage() + " ******");
            e.printStackTrace();
        }

        return memberList;
    }
}

