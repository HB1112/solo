<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springmvc.domain.member" %>
<%@ page import="com.springmvc.domain.board" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>
	<div>
		<h2>${board.subject}</h2>
	</div>

    <% 
        board board = (board) request.getAttribute("board"); // Model에서 board 객체 가져오기
        member mem = (member) request.getSession().getAttribute("mem");
        boolean isMatch = (mem != null) && mem.getId().equals(board.getId()); // 작성자 아이디 비교
    %>

	<p>작성자: ${board.id}</p>
    <p>제목: ${board.subject}</p>
    <p>내용: ${board.content}</p>
    <p>작성일자: ${board.regist_date}</p>
    <p>조회수: ${board.hit}</p>
    <p>카테고리: ${board.category}</p>

    <% if (isMatch) { %>
        <a href="updateboard?num=${board.num}">게시글 수정</a>
        <a href="deleteboard?num=${board.num}" onclick="return confirm('정말 삭제하시겠습니까?');">게시글 삭제</a>
    <% } %>
    
</body>
</html>