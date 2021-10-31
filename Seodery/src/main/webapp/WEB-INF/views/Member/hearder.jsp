<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
<!--   <div id="wrapper"></div> -->
        <header id="header">
			<div class="logo">
				<img src="resources/images/login/logo.png" alt="">
			</div> 
				<c:choose>
					<c:when test="${empty sMNo }">
						<div class="login">
							<input type="button" value="로그인" id="LoginBtn" onclick="linkGo('login')"/>
						</div>
					</c:when>
					<c:otherwise>
						<div class="logout">
							${sMNm }님 환영합니다.
							<div class="pencil"></div>
							<input type="button" value="로그아웃" id="LogoutBtn" onclick="linkGo('logout')"/>
						</div>
					</c:otherwise>
				</c:choose>
			
			<div class="navcon">
				<nav id="nav">
					<div class="gnb_subbox"></div>
					<div class="gnb">
						<ul class="navi">
							<!-- <div class="dvbox">
								<div class="dv"></div>
								<div class="dv"></div>
								<div class="dv"></div>
							</div> -->
							<li class="sub Park">공원</a>	
								<ul class="gnb_sub">
									<li><a href="parkList">공원 찾기</a></li>
									<li><a href="#">길 찾기</a></li>
								</ul>
							</li>
							<li class="sub WalkT">산책로</a>
								<ul class="gnb_sub">
									<li><a href="#">산책로 찾기</a></li>
								</ul>
							</li>
							<li class="sub Bike">자전거</a>
								<ul class="gnb_sub">
									<li><a href="#">실시간 대여정보</a></li>
									<li><a href="#">자전거 이용안내</a></li>
									<li><a href="#">자전거 수리문의</a></li>
								</ul>
							</li>
							<li class="sub FDust">미세먼지</a>
								<ul class="gnb_sub">
									<li><a href="#">미세먼지 현황</a></li>
								</ul>
							</li>
							<li class="sub Memory">추억저장</a>
								<ul class="gnb_sub">
									<li><a href="#">추억저장</a></li>
								</ul>
							</li>
							<li class="sub Notice">공지사항</a>
								<ul class="gnb_sub">
									<li><a href="#">고객의 소리</a></li>
									<li><a href="#">공지사항</a></li>
								</ul>
							</li>
							<li class="sub Manager" id="manager">관리자</a>
								<ul class="gnb_sub">
									<li><a href="#">공원댓글</a></li>
									<li><a href="#">산책로댓글</a></li>
									<li><a href="#">수리문의</a></li>
									<li><a href="#">회원관리</a></li>
									<li><a href="#">추억저장</a></li>
									<li><a href="#">공지사항</a></li>
									<li><a href="#">고객의 소리함</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>	
			</div>
	</header>
	</div>
</body>
</html>