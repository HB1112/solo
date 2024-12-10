<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
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
</script>
</head>
<body>
    <div class="form-container">
        <h2>게시글 작성</h2>
        <form name="newWrite" action="writeboard" method="post" onsubmit="return checkForm()">
            <div class="mb-3">
                <label>카테고리</label>
                <select name="category" class="form-control">
                    <option value="tip" ${category == 'tip' ? 'selected' : ''}>생활팁/정보</option>
                    <option value="sell" ${category == 'sell' ? 'selected' : ''}>판매</option>
                    <option value="buy" ${category == 'buy' ? 'selected' : ''}>구매</option>
                </select>
            </div>

            <div class="mb-3">
                <label>아이디</label>
                <input name="id" type="text" class="form-control" value="${mem.id}" readonly>
            </div>

            <div class="mb-3">
                <label>제목</label>
                <input name="subject" type="text" class="form-control" placeholder="제목을 입력하세요">
            </div>

            <div class="mb-3">
                <label>내용</label>
                <textarea name="content" cols="50" rows="5" class="form-control" placeholder="내용을 입력하세요"></textarea>
            </div>

            <div class="mb-3">
                <input type="submit" class="btn btn-primary" value="등록">				
                <input type="reset" class="btn btn-primary" value="취소">
            </div>
        </form>
    </div>
</body>
</html>
