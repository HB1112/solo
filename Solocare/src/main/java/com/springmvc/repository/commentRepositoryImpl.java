package com.springmvc.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

import com.springmvc.domain.comment;

@Repository
public class commentRepositoryImpl implements commentRepository{
	
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	
	// 댓글 C
	@Override
	public void saveComment(comment comment) {
		System.out.println("CommentRepositoryImpl addComment()");
	    System.out.println("댓글 내용: " + comment.getCommentcontent());
	    try {
			conn=DBConnection.getConnection();
			String sql = "INSERT INTO comments (boardnum, commentcontent, authorid, createDate, likes) VALUES (?, ?, ?, ?, ?)";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, comment.getBoardnum());
	        pstmt.setString(2, comment.getCommentcontent());
	        pstmt.setString(3, comment.getAuthorid());
	        pstmt.setString(4, comment.getCreatedDate()); // String을 직접 설정
	        pstmt.setInt(5, comment.getLikes());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	   
	}

}
