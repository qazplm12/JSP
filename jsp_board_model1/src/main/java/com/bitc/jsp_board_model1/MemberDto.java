package com.bitc.jsp_board_model1;


// 회원 정보를 저장하기 위한 클래스
public class MemberDto {
    private String userId;
    private String userPass;
    private String userName;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public MemberDto() {

    }
}
