<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springmvc.domain.member" %>
<%@ page import="com.springmvc.domain.board" %>
<%@ page import="com.springmvc.domain.comment" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f5f5f5;
    }

    .post-container {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-bottom: 20px;
        width: 70%; /* 본문 영역 70% 차지 */
    }

    .title {
        font-size: 24px;
        color: #333;
        margin-bottom: 10px;
    }

    .meta-info {
        font-size: 14px;
        color: #999;
        margin-bottom: 15px;
    }

    .meta-info span {
        margin-right: 15px;
    }

    .content {
        font-size: 16px;
        color: #555;
        line-height: 1.6;
    }

    .actions {
        margin-top: 20px;
    }

    .actions a {
        display: inline-block;
        margin-right: 10px;
        padding: 10px 15px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .actions a:hover {
        background-color: #0056b3;
    }

    .delete-link {
        background-color: #dc3545; /* Red for delete */
    }

    .delete-link:hover {
        background-color: #c82333;
    }

    /* 댓글 스타일 */
    .comments-section {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: 70%; /* 댓글 영역 70% 차지 */
        margin-top: 20px; /* 본문과의 간격 */
        display: none; /* 기본적으로 댓글 영역 숨김 */
    }

    .comment {
        border-bottom: 1px solid #eee;
        padding: 10px 0;
    }

    .comment:last-child {
        border-bottom: none;
    }

    .comment-author {
        font-weight: bold;
    }

    .comment-date {
        font-size: 12px;
        color: #999;
    }

    .comment-form {
        margin-top: 20px;
        display: flex;
        flex-direction: column;
    }

    .comment-form textarea {
        width: 100%;
        height: 60px;
        margin-bottom: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: none; /* 텍스트 영역 크기 조절 비활성화 */
    }

    .comment-form button {
        align-self: flex-end;
        padding: 10px 15px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .comment-form button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="post-container">
        <% 
            board board = (board) request.getAttribute("board"); // Model에서 board 객체 가져오기
            member mem = (member) request.getSession().getAttribute("mem");
            boolean isMatch = (mem != null) && mem.getId().equals(board.getId()); // 작성자 아이디 비교
        %>

        <h2 class="title">${board.subject}</h2>
        <div class="meta-info">
            <span>작성자: ${board.id}</span>
            <span>작성일: ${board.regist_date}</span>
            <span>조회수: ${board.hit}</span>
        </div>
        <div class="content" id="content">
            <p>${board.content}</p>
        </div>

        <% if (isMatch) { %>
            <div class="actions">         
                <a href="updateboard?num=${board.num}">게시글 수정</a>
                <a href="deleteboard?num=${board.num}&category=${board.category}" 
                   class="delete-link" 
                   onclick="return confirm('정말 삭제하시겠습니까?');">게시글 삭제</a>
            </div>
        <% } %>
        <div>
            <button onclick="toggleComments()">댓글 ▼</button>
        </div>
    </div>
    
    <div class="comments-section" id="comments-section">
        <div id="comments">
		    <% 
		        List<comment> comments = (List<comment>) request.getAttribute("comments");
		        int commentCount = (comments != null) ? comments.size() : 0; // 댓글 수
		    %>
		    <% if (comments != null && !comments.isEmpty()) {
		        for (comment c : comments) { 
		    %>
		        <div class="comment">
		            <span class="comment-author">${c.authorId}</span>
		            <p>${c.content}</p>
		            <span class="comment-date">${c.createdDate}</span>
		        </div>
		    <% 
		        } 
		    } else { 
		    %>
		        <p>댓글이 없습니다.</p>
		    <% } %>
		</div>

        <div class="comment-form">
		    <% if (mem != null) { %> <!-- 로그인한 경우에만 댓글 추가 가능 -->
		        <form id="commentForm">
		            <input type="hidden" id="num" name="num" value="${board.num}">
		            <input type="hidden" id="authorid" name="authorid" value="${mem.id}">
		            <textarea id="commentcontent" name="commentcontent" required placeholder="댓글을 입력하세요"></textarea>
		            <button type="submit">댓글 추가</button>
		        </form>
		    <% } else { %>
		        <p>댓글을 추가하려면 <a href="login">로그인</a> 하세요.</p>
		    <% } %>
		</div>
    </div>
</body>
<script>
const contentElement = document.getElementById('content');
const content = contentElement.innerHTML.replace(/\n/g, '<br/>');
contentElement.innerHTML = content;

function toggleComments() {
    const commentsSection = document.getElementById('comments-section');
    if (commentsSection.style.display === "none" || commentsSection.style.display === "") {
        commentsSection.style.display = "block"; // 댓글 영역 보이기
    } else {
        commentsSection.style.display = "none"; // 댓글 영역 숨기기
    }
}

	document.getElementById('commentForm').addEventListener('submit', function(event) {
	    event.preventDefault();
	
	    const boardnum = document.getElementById('num').value;
	    const authorid = document.getElementById('authorid').value;
	    const commentcontent = document.getElementById('commentcontent').value;
	
	    fetch('addComment', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify({
	            boardnum: boardnum,
	            authorid: authorid,
	            commentcontent: commentcontent
	        })
	    })
	    .then(response => response.json())
	    .then(data => {
	        console.log(data); // 서버 응답 확인
	        
	        if (data.success) {
	        	// 댓글이 성공적으로 추가되면 댓글 섹션에 새 댓글 추가
	            const commentsDiv = document.getElementById('comments');

	            // 댓글 div 생성
	            const newComment = document.createElement('div');
	            newComment.className = 'comment';

	            // 작성자 span 생성
	            const authorSpan = document.createElement('span');
	            authorSpan.className = 'comment-author';
	            authorSpan.textContent = data.authorId; // 텍스트 설정

	            // 댓글 내용 p 생성
	            const contentParagraph = document.createElement('p');
	            contentParagraph.textContent = data.content; // 텍스트 설정

	            // 날짜 span 생성
	            const dateSpan = document.createElement('span');
	            dateSpan.className = 'comment-date';
	            dateSpan.textContent = data.createdDate; // 텍스트 설정

	            // 생성한 요소를 newComment div에 추가
	            newComment.appendChild(authorSpan);
	            newComment.appendChild(contentParagraph);
	            newComment.appendChild(dateSpan);

	            // commentsDiv에 newComment 추가
	            commentsDiv.appendChild(newComment);

	            // 텍스트 영역 초기화
	            document.getElementById('commentcontent').value = '';
	        } else {
	            alert('댓글 추가에 실패했습니다. 다시 시도해 주세요.');
	        }
	    })
	    .catch(err => {
	        console.error('Error:', err);
	        alert('댓글 추가 중 오류가 발생했습니다.');
	    });
	});

</script>
</html>
