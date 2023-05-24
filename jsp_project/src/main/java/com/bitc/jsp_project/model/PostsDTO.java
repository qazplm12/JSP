package com.bitc.jsp_project.model;

public class PostsDTO {

    private int postNum;
    private String category;
    private String postTitle;
    private String postContent;
    private String postWriter;
    private String postDate;
    private int postVisits;

    public int getPostIdx() {
        return postNum;
    }

    public void setPostIdx(int postNum) {
        this.postNum = postNum;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostWriter() {
        return postWriter;
    }

    public void setPostWriter(String postWriter) {
        this.postWriter = postWriter;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public int getPostVisits() {
        return postVisits;
    }

    public void setPostVisits(int postVisits) {
        this.postVisits = postVisits;
    }




}
