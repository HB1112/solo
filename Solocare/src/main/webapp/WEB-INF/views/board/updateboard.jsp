<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body>
	<form name="newWrite" action="updateboard"  method="post" onsubmit="return checkForm()">
		<input type="hidden" name="num" value="${board.num}"/> <!-- 게시글 번호 -->
		<input type="hidden" name="regist_date" value="${board.regist_date}"/> <!-- 등록 날짜 -->
		<input type="hidden" name="hit" value="${board.hit}"/> <!-- 조회수 -->
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >카테고리</label>
				<div class="col-sm-3">
					<select name="category">
						<option value="tip">생활팁/정보</option>
						<option value="sell">판매</option>
						<option value="buy">구매</option>
					</select>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" value="${board.id}" readonly>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">

					<input name="subject" type="text" class="form-control" value="${board.subject}">
				</div>
			</div>
		<div class="mb-3 row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="5" class="form-control" >${board.content}</textarea>
				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
				 <input type="submit" class="btn btn-primary " value="등록 ">				
				<input type="reset" class="btn btn-primary " value="취소 ">
				</div>
			</div>
		</form>
</body>
</html>