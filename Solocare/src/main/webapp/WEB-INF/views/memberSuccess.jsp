<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 가입이 성공적으로 완료되었습니다!</h1>
    <p>아이디: ${member.id}</p>
    <p>이름: ${member.name}</p>
    <p>이메일: ${member.email}</p>
    <a href="home">홈으로</a>
</body>
</html>