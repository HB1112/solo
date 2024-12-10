package com.springmvc.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.springmvc.domain.board;


@Repository
public class boardRepositoryImpl implements boardRepository{

	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	
	// Create addboard
	@Override
	public void addboard(board board) {
		System.out.println("boardRepositoryImpl addboard()");
		System.out.println(board.getSubject());
		try {
			conn=DBConnection.getConnection();
			String sql = "insert into board values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getId());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setString(5, board.getRegist_date());
			pstmt.setInt(6, board.getHit());
			pstmt.setString(7, board.getCategory());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}
	
	// Read All
	@Override
	public ArrayList<board> readall(String category, int page, int pageSize) {
	    System.out.println("boardRepositoryImpl readall() with pagination");

	    ArrayList<board> listofboard = new ArrayList<board>();
	    try {
	        conn = DBConnection.getConnection();
	        String sql = "SELECT * FROM board WHERE category=? ORDER BY num DESC LIMIT ? OFFSET ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, category);
	        pstmt.setInt(2, pageSize); // 페이지당 게시글 수
	        pstmt.setInt(3, (page - 1) * pageSize); // OFFSET 계산
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            board board = new board();
	            board.setNum(rs.getInt(1));
	            board.setId(rs.getString(2));
	            board.setSubject(rs.getString(3));
	            board.setContent(rs.getString(4));
	            board.setRegist_date(rs.getString(5));
	            board.setHit(rs.getInt(6));
	            board.setCategory(rs.getString(7));
	            
	            listofboard.add(board);
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    System.out.println("board DTO의 갯수는 :" + listofboard.size());
	    return listofboard;
	}
	// 페이지네이션
	@Override
	public int getTotalBoardCount(String category) {
	    int count = 0;
	    try {
	        conn = DBConnection.getConnection();
	        String sql = "SELECT COUNT(*) FROM board WHERE category=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, category);
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}

	// Read one
	@Override
	public board readoneboard(int num) {
		board board = new board();
		try {
			conn=DBConnection.getConnection();
			String sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				board.setNum(rs.getInt(1));
				board.setId(rs.getString(2));
				board.setSubject(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setRegist_date(rs.getString(5));
				board.setHit(rs.getInt(6));
				board.setCategory(rs.getString(7));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	// Search 페이지 네이션
	@Override
	public int getsearchBoardCount(String items, String text, String category) {
		int count = 0;
	    try {
	        conn = DBConnection.getConnection();
	        String sql = "SELECT COUNT(*) FROM board WHERE " + items + " LIKE ? AND category=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, "%" + text + "%");
	        pstmt.setString(2, category);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	            System.out.println(count);
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 처리 추가
	    } finally {
	        // 자원 해제 (conn, pstmt, rs 등)
	    }
	    return count;
	}
	// Read search
	@Override
	public ArrayList<board> searchboards(String items, String text, String category, int page, int pageSize) {
	    ArrayList<board> boards = new ArrayList<>();
	    try {
	        conn = DBConnection.getConnection();
	        String sql = "SELECT * FROM board WHERE " + items + " LIKE ? AND category=? ORDER BY num DESC LIMIT ? OFFSET ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, "%" + text + "%");
	        pstmt.setString(2, category);
	        pstmt.setInt(3, pageSize); // 페이지당 게시글 수
	        pstmt.setInt(4, (page - 1) * pageSize); // OFFSET 계산
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            board b = new board();
	            b.setNum(rs.getInt(1));
	            b.setId(rs.getString(2));
	            b.setSubject(rs.getString(3));
	            b.setContent(rs.getString(4));
	            b.setRegist_date(rs.getString(5));
	            b.setHit(rs.getInt(6));
	            b.setCategory(rs.getString(7));
	            boards.add(b);
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 처리
	    }
	    return boards;
	}

	// Update board
	@Override
	public void updateboard(board board) {
		System.out.println("boardRepositoryImpl updateboard()");
		System.out.println(board.getSubject());
		try {
			conn=DBConnection.getConnection();
			String sql = "update board set subject=?, content=?, category=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getSubject());       // subject
			pstmt.setString(2, board.getContent());       // content
			pstmt.setString(3, board.getCategory());       // category
			pstmt.setInt(4, board.getNum()); 
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		
	}

	// Delete board
	@Override
	public void deleteboard(int num) {
		System.out.println("boardRepositoryImpl deleteboard()");
		try {
			conn=DBConnection.getConnection();
			String sql = "delete from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num); 
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void incrementhit(int num) {
		try {
			conn=DBConnection.getConnection();
			String sql = "update board set hit = hit+1 where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
