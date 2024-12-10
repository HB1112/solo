<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f5f5f5;
    }

    .form-container {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-bottom: 20px;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    .mb-3 {
        margin-bottom: 15px;
    }

    label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .textarea-large {
        height: 300px; /* 높이 조정 */
        resize: vertical; /* 사용자가 수동으로 크기를 조정할 수 있도록 설정 */
    }

    .btn {
        padding: 10px 15px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .btn:hover {
        background-color: #0056b3;
    }

    .btn-primary {
        margin-right: 10px;
    }
</style>
<script type="text/javascript">
    function checkForm() {
        if (!document.newWrite.id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if (!document.newWrite.subject.value) {
            alert("제목을 입력하세요.");
            return false;
        }
        if (!document.newWrite.content.value) {
            alert("내용을 입력하세요.");
            return false;
        }		
       
    }
    function goToDetail() {
        // 상세 페이지 URL로 이동
        window.location.href = 'detail?num=' + document.newWrite.num.value; // 게시글 번호에 맞게 URL 수정
    }
</script>
</head>
<body>
    <div class="form-container">
        <h2>게시글 수정하기</h2>
        <form name="newWrite" action="updateboard" method="post" onsubmit="return checkForm()">
            <input type="hidden" name="num" value="${board.num}"/> <!-- 게시글 번호 -->
            <input type="hidden" name="regist_date" value="${board.regist_date}"/> <!-- 등록 날짜 -->
            <input type="hidden" name="hit" value="${board.hit}"/> <!-- 조회수 -->

            <div class="mb-3">
                <label>카테고리</label>
                <select name="category" class="form-control">
                    <option value="tip" <c:if test="${board.category == 'tip'}">selected</c:if>>생활팁/정보</option>
                    <option value="sell" <c:if test="${board.category == 'sell'}">selected</c:if>>판매</option>
                    <option value="buy" <c:if test="${board.category == 'buy'}">selected</c:if>>구매</option>
                </select>
            </div>

            <div class="mb-3">
                <label>아이디</label>
                <input name="id" type="text" class="form-control" value="${board.id}" readonly>
            </div>

            <div class="mb-3">
                <label>제목</label>
                <input name="subject" type="text" class="form-control" value="${board.subject}">
            </div>

            <div class="mb-3">
                <label>내용</label>
    			<textarea name="content" class="form-control textarea-large">${board.content}</textarea>
            </div>

            <div class="mb-3">
                <input type="submit" class="btn btn-primary" value="수정">				
                <button type="button" class="btn btn-primary" onclick="goToDetail()">취소</button>
            </div>
        </form>
    </div>
</body>
</html>
