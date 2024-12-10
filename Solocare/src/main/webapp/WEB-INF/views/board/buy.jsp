<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.springmvc.domain.board" %>

<%
    ArrayList<board> boardList = (ArrayList<board>) request.getAttribute("boardlist");
    int startNumber = (Integer) request.getAttribute("startNumber"); // 시작 번호
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 게시판</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f5f5f5;
    }

    h2 {
        text-align: center;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }

    th {
        background-color: #007bff;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .pagination a {
        padding: 8px 16px;
        margin: 0 4px;
        border: 1px solid #007bff;
        color: #007bff;
        text-decoration: none;
        border-radius: 4px;
    }

    .pagination a.active {
        background-color: #007bff;
        color: white;
    }

    .pagination a:hover {
        background-color: #ddd;
    }

    .search-form {
        margin-top: 20px;
        display: flex;
        justify-content: center;
    }

    .search-form input[type="text"] {
        padding: 8px;
        margin-right: 4px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .search-form button {
        padding: 8px;
        border: 1px solid #007bff;
        background-color: #007bff;
        color: white;
        border-radius: 4px;
        cursor: pointer;
    }

    .search-form button:hover {
        background-color: #0056b3;
    }

    .write-button-container {
        text-align: right; /* 오른쪽 정렬 */
        margin-top: 20px;
    }

    .write-button {
        padding: 10px 15px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .write-button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div>
        <h2>구매 게시판</h2>
    </div>
    
    <div style="padding-top: 20px">
        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회</th>
                <th>글쓴이</th>
            </tr>
            <c:forEach var="board" items="${boardlist}">
                <tr>
                    <td><%= startNumber-- %></td> <!-- 번호 -->
                    <td><a href="detail?num=${board.num}">${board.subject}</a></td> <!-- 제목 -->
                    <td>${board.regist_date.split(' ')[0]}</td> <!-- 작성일 -->
                    <td>${board.hit}</td> <!-- 조회 -->
                    <td>${board.id}</td> <!-- 글쓴이 -->
                </tr>
            </c:forEach>
        </table>
    </div>
    
    <!-- 페이지네이션 -->
    <div class="pagination">
       <c:if test="${currentPage > 1}">
           <c:choose>
               <c:when test="${not empty items and not empty text}">
                   <a href="search?category=buy&page=${currentPage - 1}&items=${items}&text=${text}">이전</a>
               </c:when>
               <c:otherwise>
                   <a href="board?category=buy&page=${currentPage - 1}">이전</a>
               </c:otherwise>
           </c:choose>
       </c:if>
       
       <c:forEach begin="1" end="${totalPages}" var="i">
           <c:choose>
               <c:when test="${i == currentPage}">
                   <strong>${i}</strong> <!-- 현재 페이지 강조 -->
               </c:when>
               <c:otherwise>
                   <c:choose>
                       <c:when test="${not empty items and not empty text}">
                           <a href="search?category=buy&page=${i}&items=${items}&text=${text}">${i}</a>
                       </c:when>
                       <c:otherwise>
                           <a href="board?category=buy&page=${i}">${i}</a>
                       </c:otherwise>
                   </c:choose>
               </c:otherwise>
           </c:choose>
       </c:forEach>
   
       <c:if test="${currentPage < totalPages}">
           <c:choose>
               <c:when test="${not empty items and not empty text}">
                   <a href="search?category=buy&page=${currentPage + 1}&items=${items}&text=${text}">다음</a>
               </c:when>
               <c:otherwise>
                   <a href="board?category=buy&page=${currentPage + 1}">다음</a>
               </c:otherwise>
           </c:choose>
       </c:if>
    </div>

    <div class="write-button-container">
        <a href="writeboard?category=buy" onclick="return checkLogin();" class="write-button">게시글 작성</a>
    </div>
    
    <div class="search-form">				
        <form action="search" method="get">
            <input type="hidden" name="category" value="buy">
        
            <select name="items">
                <option value="subject">제목</option>
                <option value="content">내용</option>
            </select>
            <input type="text" name="text" placeholder="검색어를 입력하세요" required>
            <button type="submit">검색</button>
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
