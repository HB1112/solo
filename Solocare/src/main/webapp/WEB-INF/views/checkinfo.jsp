<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="checkpw" method="post">
		<p> 비밀번호를 입력하시오
		<input type="password" name="pw">
		<input type="submit" value="확인">
	</form>
	<%
		String error = (String)request.getAttribute("error");
		if(error != null){
	%>
		<div>
			<h2><%=error%></h2>
		</div>
	<%
		}
	%>
</body>
</html>