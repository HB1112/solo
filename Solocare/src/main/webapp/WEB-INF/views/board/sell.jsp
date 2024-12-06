<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2>판매 게시판</h2>
	</div>
	
	<div style="padding-top: 20px">
		<table class="table table-hover text-center">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회</th>
				<th>글쓴이</th>
			</tr>
			<c:forEach var="board" items="${boardlist}">
		        <tr>
		            <td>${board.num}</td> <!-- 번호 -->
		            <td><a href="detail?num=${board.num}">${board.subject}</a></td> <!-- 제목 -->
		            <td>${board.regist_date}</td> <!-- 작성일 -->
		            <td>${board.hit}</td> <!-- 조회 -->
		            <td>${board.id}</td> <!-- 글쓴이 -->
		        </tr>
		    </c:forEach>
		</table>
	</div>
	<div>
		<a href="writeboard?category=sell" onclick="return checkLogin();">게시글 작성</a>
	</div>
</body>
</html>