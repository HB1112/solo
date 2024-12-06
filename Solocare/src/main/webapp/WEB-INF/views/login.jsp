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
		<h2>로그인</h2>
	</div>
	<%
		String error = (String)request.getAttribute("error");
		System.out.println("로그인 에러 : "+error);
		if (error != null) {
			out.println("<div class='alert alert-danger'>");
			out.println("아이디와 비밀번호를 확인해 주세요");
			out.println("</div>");
		}
	%>
	<form action="login" method="post">
		<input type="text" name="id">
		<input type="password" name="pw">
		<input type="submit" value="로그인">
	</form>
	<a href="${pageContext.request.contextPath}/addmember">회원가입</a>
	
</body>
</html>