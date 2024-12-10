package com.springmvc.domain;

import java.time.LocalDateTime;

public class comment {
	private int commentnum; // DB에서 자동증가
	private int boardnum; // 댓글이 속한 게시물 번호
    private String commentcontent; // 댓글 내용
    private String authorid; // 작성자 ID (member의 ID)
    private String createdDate; // 작성일
    private int likes; // 좋아요 수
    
    public int getCommentnum() {
		return commentnum;
	}
	public void setCommentnum(int commentnum) {
		this.commentnum = commentnum;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getAuthorid() {
		return authorid;
	}
	public void setAuthorid(String authorid) {
		this.authorid = authorid;
	}
	
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getCommentcontent() {
		return commentcontent;
	}
	public void setCommentcontent(String commentcontent) {
		this.commentcontent = commentcontent;
	}
    
}
