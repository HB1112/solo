package com.springmvc.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.springmvc.domain.member;

@Repository
public class memberRepositoryImpl implements memberRepository {
	
	// 전역변수
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 회원가입 C
	@Override
	public void addmember(member member) {
		System.out.println("memberRepositoryImpl addmember()");
		System.out.println(member.getName());
		try {
			conn = DBConnection.getConnection();
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getGender());
			pstmt.setString(7, member.getBirth());
			pstmt.setString(8, member.getAddress());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeResources();
		}
	}

	@Override
	public member getmemberById(String id) {
		System.out.println("memberRepositoryImpl getmemberById()");
		member memberInfo = null;
		// 데이터베이스에서 아이디로 회원 정보를 가져오는 로직 구현 필요
		return memberInfo;
	}

	@Override
	public member loginmember(String id, String pw) {
		System.out.println("memberRepositoryImpl loginmember()");
		System.out.println(id + pw);
		member mb = new member();
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mb.setId(rs.getString(1));
				mb.setPw(rs.getString(2));
				mb.setName(rs.getString(3));
				mb.setEmail(rs.getString(4));
				mb.setPhone(rs.getString(5));
				mb.setGender(rs.getString(6));
				mb.setBirth(rs.getString(7));
				mb.setAddress(rs.getString(8));
				return mb;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeResources();
		}
		return null;
	}

	@Override
	public void updatemember(member member) {
		System.out.println("memberRepositoryImpl updatemember()");
		try {
			conn = DBConnection.getConnection();
			String sql = "update member set pw=?, name=?, email=?, phone=?, address=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeResources();
		}
	}

	@Override
	public void deletemember(member mem) {
		System.out.println("memberRepositoryImpl deletemember()");
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeResources();
		}
	}

	@Override
	public boolean isIdExists(String id) {
		System.out.println("memberRepositoryImpl isIdExists()");
		try {
			conn = DBConnection.getConnection();
			String sql = "select count(*) from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println(rs.getInt(1));
				return rs.getInt(1) > 0; // 1 이상의 값을 반환하면 아이디가 존재
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeResources();
		}
		return false; // 예외 발생 시, 아이디가 존재하지 않는 것으로 간주
	}

	// 리소스 해제 메서드
	private void closeResources() {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
