<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springmvc.domain.member" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tip board</title>
</head>
<body>
	<div>
		<h2>팁 정보 공유 게시판</h2>
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
		<a href="writeboard" onclick="return checkLogin();">게시글 작성</a>
	</div>
	<div align="left">				
		<select name="items" class="txt">
			<option value="subject">제목에서</option>
			<option value="content">본문에서</option>
		</select> <input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />				
	</div>
	
</body>
<script>
function checkLogin() {
    <% if (request.getSession().getAttribute("mem") == null) { %>
        alert('로그인 해주세요.');
        return false; // 로그인하지 않은 경우 링크 클릭 방지
    <% } else { %>
        return true; // 로그인한 경우 링크 클릭 허용
    <% } %>
}
</script>
</html>