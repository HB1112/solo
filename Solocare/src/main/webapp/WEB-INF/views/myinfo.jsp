<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>내 정보</h2>
	<p>아이디: ${mem.id}</p>
    <p>비밀번호: ${mem.pw}</p>
    <p>이름: ${mem.name}</p>
    <p>이메일: ${mem.email}</p>
    <p>연락처: ${mem.phone}</p>
    <p>성별: ${mem.gender}</p>
    <p>생년월일: ${mem.birth}</p>
    <p>주소: ${mem.address}</p>
    <a href="updatemember">수정</a> | <a href="deletemember">회원탈퇴</a>
</body>
</html>