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
	<!-- 페이지네이션 -->
	<div style="padding-top: 20px;">
	    <c:if test="${currentPage > 1}">
	        <a href="tipboard?category=tip&page=${currentPage - 1}">이전</a> <!-- 카테고리 추가 -->
	    </c:if>
	    <c:forEach begin="1" end="${totalPages}" var="i">
	        <c:choose>
	            <c:when test="${i == currentPage}">
	                <strong>${i}</strong> <!-- 현재 페이지 강조 -->
	            </c:when>
	            <c:otherwise>
	                <a href="tipboard?category=tip&page=${i}">${i}</a> <!-- 카테고리 추가 -->
	            </c:otherwise>
	        </c:choose>
	    </c:forEach>
	    <c:if test="${currentPage < totalPages}">
	        <a href="tipboard?category=tip&page=${currentPage + 1}">다음</a> <!-- 카테고리 추가 -->
	    </c:if>
	</div>

	
	<div>
		<a href="writeboard?category=tip" onclick="return checkLogin();">게시글 작성</a>
	</div>
	<div align="left">				
	    <form action="search" method="get"> <!-- 검색 요청을 처리할 URL -->
	        <select name="items" class="txt">
	            <option value="subject">제목에서</option>
	            <option value="content">본문에서</option>
	        </select> 
	        <input name="text" type="text" placeholder="검색어를 입력하세요" required /> <!-- 필수 입력 -->
	        <input type="submit" id="btnAdd" class="btn btn-primary" value="검색" />				
	    </form>
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