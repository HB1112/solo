<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>솔로케어(SoloCare)</title>
</head>
<body>
    <!-- 상단 내비게이션 바 -->
    <div>
        <nav>
            <a href="#">SoloCare</a>
            <div>
                <a href="#" id="shoppingDropdown">쇼핑 ▼</a>
                <div style="display:none;" id="dropdownMenu">
                    <a href="shop/shopone">1인 가구 맞춤 가전 제품</a>
                    <a href="shop/shoptwo">1인 가구 맞춤 식자재</a>
                    <a href="shop/shopthree">보안 제품 추천</a>
                </div>
            </div>
            <div>
                <a href="#" id="communityDropdown">커뮤니티 ▼</a>
                <div style="display:none;" id="communityMenu">
                    <a href="board?category=tip&page=1">정보 공유 (집 꾸미기, 생활 팁)</a>
                    <a href="tradeboard">나눔</a>
                    <a href="#">동호회 관리 및 모집 / 필요시 대관 정보</a>
                </div>
            </div>
            <div>
                <a href="#" id="healthDropdown">건강 케어 ▼</a>
                <div style="display:none;" id="healthMenu">
                    <a href="#">간단한 홈트레이닝 영상 제공</a>
                    <a href="#">건강 데이터 통합 관리</a>
                    <a href="#">집 주변 약국 운영시간, 야간운영? 정보</a>
                </div>
            </div>
            <div>
                <a href="#" id="policyDropdown">정책 지원 ▼</a>
                <div style="display:none;" id="policyMenu">
                    <a href="#">사회성 증진 프로그램</a>
                    <a href="https://www.youthcenter.go.kr/opi/openApiPlcy.do">지원 혜택</a>
                    <a href="#">응급 대처 가이드</a>
                </div>
            </div>
            <div>
                <a href="#" id="serviceDropdown">편의 서비스 ▼</a>
                <div style="display:none;" id="serviceMenu">
                    <a href="#">정기 구독 식품, 청소, 심부름</a>
                    <a href="#">안심 귀가 루트 추천</a>
                </div>
            </div>
            <%
            	
            if (request.getSession().getAttribute("mem") != null){
            		
            %>
            		 <div>
             	  		 <p>${mem.name}님 환영합니다</p>
             	  		 <a href="infocheck">내 정보</a>
             	  		 <a href="logout">로그아웃</a>
           			 </div>
           	<% 
            	}else {
            %>
            	<div>
            		<a href="login">로그인</a>
            	</div>
            <%
            	}
            %>
           
            
        </nav>
    </div>

    <!-- 메인 콘텐츠 -->
    <div>
        <!-- <img src="./resources/images/sample.jpg" alt="배경 이미지"> --> <!-- 배경 이미지 주석 처리 -->
        <div>
            <h1>솔로 라이프의 모든 것</h1>
            <a href="${pageContext.request.contextPath}/login">솔로케어 시작하기</a> <!-- 로그인 폼으로 연결 -->
        </div>
    </div>

    <div>
        <div>
            <h5>쇼핑</h5>
            <p>1인가구 맞춤 제품(냉장고, 가전 등) 및 식자재 정보.</p>
        </div>
        <div>
            <h5>커뮤니티</h5>
            <p>정보 공유, 공동구매 및 동호회 관리.</p>
        </div>
        <div>
            <h5>건강 케어</h5>
            <p>홈트레이닝 영상 및 건강 데이터 관리.</p>
        </div>
        <div>
            <h5>정책 지원</h5>
            <p>사회성 증진 프로그램 및 지원 혜택 정보.</p>
        </div>
        <div>
            <h5>편의 서비스</h5>
            <p>정기 구독 서비스 및 루트 추천.</p>
        </div>
    </div>

    <!-- 푸터 -->
    <footer>
        <p>© 2024 솔로케어. 모든 권리 보유.</p>
    </footer>

    <script>
        // 드롭다운 메뉴 토글 기능
        document.getElementById('shoppingDropdown').onclick = function() {
            var dropdown = document.getElementById('dropdownMenu');
            dropdown.style.display = dropdown.style.display === 'none' || dropdown.style.display === '' ? 'block' : 'none';
        };

        document.getElementById('communityDropdown').onclick = function() {
            var communityDropdown = document.getElementById('communityMenu');
            communityDropdown.style.display = communityDropdown.style.display === 'none' || communityDropdown.style.display === '' ? 'block' : 'none';
        };

        document.getElementById('healthDropdown').onclick = function() {
            var healthDropdown = document.getElementById('healthMenu');
            healthDropdown.style.display = healthDropdown.style.display === 'none' || healthDropdown.style.display === '' ? 'block' : 'none';
        };

        document.getElementById('policyDropdown').onclick = function() {
            var policyDropdown = document.getElementById('policyMenu');
            policyDropdown.style.display = policyDropdown.style.display === 'none' || policyDropdown.style.display === '' ? 'block' : 'none';
        };

        document.getElementById('serviceDropdown').onclick = function() {
            var serviceDropdown = document.getElementById('serviceMenu');
            serviceDropdown.style.display = serviceDropdown.style.display === 'none' || serviceDropdown.style.display === '' ? 'block' : 'none';
        };
    </script>
</body>
</html>
