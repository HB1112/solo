<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="com.springmvc.domain.member" %>
<html>
  <head>
    <title>정보 수정</title>
  </head>
  <body>
  <div>
  	<h2>정보 수정</h2>
  </div>
  <form name="newMember" action="updatemember" method="post">
    <div class="mb-3 row">
        <label class="col-sm-2">아이디</label>
        <div class="col-sm-3">
            <input name="id" type="text" class="form-control" value="${mem.id}" readonly>
        </div>
    </div>
    <div class="mb-3 row">
        <label class="col-sm-2">비밀번호</label>
        <div class="col-sm-3">
            <input name="pw" type="password" class="form-control" value="${mem.pw }" required>
        </div>
    </div>
    <div class="mb-3 row">
        <label class="col-sm-2">성명</label>
        <div class="col-sm-3">
            <input name="name" type="text" class="form-control" value="${mem.name }" required>
        </div>
    </div>
    <div class="mb-3 row">
        <label class="col-sm-2">이메일</label>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-4">
                <%
                	member mem = (member)session.getAttribute("mem"); // 세션에서 멤버 가져오기
                	String emailPrefix = ""; // 이메일 앞부분 초기화
					String fullEmail = mem.getEmail();
                // 이메일 주소가 null이 아니고 '@'가 포함되어 있는 경우
	                if (fullEmail != null && fullEmail.contains("@")) {
	                    emailPrefix = fullEmail.split("@")[0]; // '@' 앞부분 가져오기
	                }
                %>
                    <input type="text" name="email" maxlength="50" class="form-control" value="<%=emailPrefix %>" required>
                </div>
                @
                <div class="col-sm-3">
                    <select name="mailDomain" class="form-select">
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="nate.com">nate.com</option>
                    </select>
                </div>
            </div>
        </div>
    </div>

    <div class="mb-3 row">
        <label class="col-sm-2">전화번호</label>
        <div class="col-sm-3">
            <input name="phone" type="text" class="form-control" value="${mem.phone}" required>
        </div>
    </div>
    <div class="mb-3 row">
        <label class="col-sm-2">주소</label>
        <div class="col-sm-5">
            <input name="address" type="text" class="form-control" value="${mem.address }" required>
        </div>
    </div>
    <div class="mb-3 row">
        <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" class="btn btn-primary" value="등록"> 
            <input type="reset" class="btn btn-primary" value="취소" onclick="reset()">
        </div>
    </div>
</form>

  </body>
</html>