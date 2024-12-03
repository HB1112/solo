<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2>팁 정보 공유 게시판</h2>
	</div>
	<p>작성자: ${board.id}</p>
    <p>제목: ${board.subject}</p>
    <p>내용: ${board.content}</p>
    <p>작성일자: ${board.regist_date}</p>
    <p>조회수: ${board.hit}</p>
    <p>카테고리: ${board.category}</p>
</body>
</html>