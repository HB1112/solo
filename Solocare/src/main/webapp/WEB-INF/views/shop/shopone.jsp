<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>1인가구 추천 상품</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">1인가구를 위한 생활용품</h1>
        <div class="row">
            <div th:each="product : ${products}" class="col-md-4 mb-3">
                <div class="card">
                    <img th:src="${product.imageUrl}" class="card-img-top" alt="상품 이미지">
                    <div class="card-body">
                        <h5 class="card-title" th:text="${product.productName}">상품명</h5>
                        <p class="card-text" th:text="|₩ ${#numbers.formatInteger(product.price, 3, 'COMMA')}|">가격</p>
                        <a th:href="${product.productUrl}" class="btn btn-primary">구매하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>