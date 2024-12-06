<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>회원가입</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 포함 -->
</head>
<body>
<div>
    <h2>회원가입</h2>
</div>
<form name="newMember" action="addMember" method="post">
    <div class="mb-3 row">
        <label class="col-sm-2">아이디</label>
        <div class="col-sm-3">
            <input id="id" name="id" type="text" class="form-control" placeholder="아이디" required>
            <button id="check" type="button">아이디 조회</button>
        </div>
    </div>
    <div class="mb-3 row">
        <label class="col-sm-2">비밀번호</label>
        <div class="col-sm-3">
            <input name="pw" type="password" class="form-control" placeholder="비밀번호" required>
        </div>
    </div>
    <div class="mb-3 row">
        <label class="col-sm-2">성명</label>
        <div class="col-sm-3">
            <input name="name" type="text" class="form-control" placeholder="이름" required>
        </div>
    </div>
    <div class="mb-3 row">
        <label class="col-sm-2">이메일</label>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-4">
                    <input type="text" name="email" maxlength="50" class="form-control" placeholder="이메일" required>
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
        <label class="col-sm-2">성별</label>
        <div class="col-sm-2">
            <input name="gender" type="radio" value="남" required> 남 
            <input name="gender" type="radio" value="여"> 여
        </div>
    </div>
    <div class="mb-3 row">
        <label class="col-sm-2">생일</label>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-2">
                    <input type="text" name="birthyy" maxlength="4" class="form-control" placeholder="년(4자)" required>
                </div>
                <div class="col-sm-2">
                    <select name="birthmm" class="form-select" required>
                        <option value="">월</option>
                        <option value="01">1</option>
                        <option value="02">2</option>
                        <option value="03">3</option>
                        <option value="04">4</option>
                        <option value="05">5</option>
                        <option value="06">6</option>
                        <option value="07">7</option>
                        <option value="08">8</option>
                        <option value="09">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                </div>
                <div class="col-sm-2">
                    <input type="text" name="birthdd" maxlength="2" class="form-control" placeholder="일" required>
                </div>
            </div>
        </div>
    </div>
    <div class="mb-3 row">
        <label class="col-sm-2">전화번호</label>
        <div class="col-sm-3">
            <input name="phone" type="text" class="form-control" placeholder="전화번호" required>
        </div>
    </div>
    <div class="mb-3 row">
        <label class="col-sm-2">주소</label>
        <div class="col-sm-5">
            <input name="address" type="text" class="form-control" placeholder="주소" required>
        </div>
    </div>
    <div class="mb-3 row">
        <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" class="btn btn-primary" value="등록"> 
            <input type="reset" class="btn btn-primary" value="취소" onclick="reset()">
        </div>
    </div>
</form>
<script>
    var btn = document.querySelector("#check");
    console.log(btn);
    btn.addEventListener("click", idcheck);

    function idcheck() {
        console.log("아이디 체크 실행");
        var inputdata = document.querySelector("#id").value;
        console.log(inputdata);
        $.ajax({
            url: "/Solocare/idcheck", 
            type: "post",
            data: JSON.stringify({ id: inputdata }), 
            contentType: "application/json", 
            success: function(data) {
                if(data === "exists") {
                    alert("이미 존재하는 아이디입니다.");
                } else {
                    alert("사용 가능한 아이디입니다.");
                }
                console.log(data);
            },
            error: function(xhr, status, error) {
                alert("아이디 조회 실패: " + xhr.responseText);
                console.error("Error: " + error);
            }
        });
    }
</script>
</body>
</html>
