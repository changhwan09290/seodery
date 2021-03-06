<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서드리 로그인</title>
    <script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <link rel="stylesheet" href="resources/css/login/default.css">
    <link rel="stylesheet" href="resources/css/login/login.css">
	<script src="resources/script/login/login.js"></script>                          
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <link rel="stylesheet" href="resources/css/login/mainpage.css">
    <script type="text/javascript">
	$(function () {
		$("#loginBtn").on("click",function(){
			$("#loginForm").attr("action","logins")
			$("#loginForm").submit()
		})
	})
</script>
</head>
<body>
    <div id="wrapper">
        <header id="header">
			<div id="logo">
				<img src="resources/images/login/logo.png" alt=""> 
				<form action="#" method="post" >
					<div class="login">
						<input type="button" value="로그인" id="LoginBtn"/>
					</div>
				</form>
			</div> 
			
			<div class="navcon">
				<nav id="nav">
					<div class="gnb_subbox"></div>
					<div class="gnb">
						<ul class="navi">
							<div class="dvbox">
								<div class="dv"></div>
								<div class="dv"></div>
								<div class="dv"></div>
							</div>
							<li class="sub Park">공원
								<ul class="gnb_sub">
									<li><a href="parkList">공원 찾기</a></li>
									<li><a href="parkMap">길 찾기</a></li>
								</ul>
							</li>
							<li class="sub WalkT">산책로
								<ul class="gnb_sub">
									<li><a href="walkList">산책로 찾기</a></li>
								</ul>
							</li>
							<li class="sub Bike">자전거
								<ul class="gnb_sub">
									<li><a href="RentalShop">실시간 대여정보</a></li>
									<li><a href="use_info">자전거 이용안내</a></li>
									<li><a href="AfterServiceList">자전거 수리문의</a></li>
								</ul>
							</li>
							<li class="sub FDust">미세먼지
								<ul class="gnb_sub">
									<li><a href="dust">미세먼지 현황</a></li>
								</ul>
							</li>
							<li class="sub Memory">추억저장
								<ul class="gnb_sub">
									<li><a href="memoryList">추억저장</a></li>
								</ul>
							</li>
							<li class="sub Notice">공지사항
								<ul class="gnb_sub">
									<li><a href="MOpinionList">고객의 소리</a></li>
									<li><a href="NoticeList">공지사항</a></li>
								</ul>
							</li>
							<li class="sub Manager" id="manager">관리자
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
		
	<main>
			<div class="Cpage"></div>
			 <div class="login-form">
			    <form  action="#" method="post" id="loginForm">
			      	<h1>Login</h1>
				      <div class="form-group">
					        <input type="text" name="id" placeholder="아이디를 입력해주세요">
					        <div class="input-icon"></div>
				      </div>
		      		  <div class="form-group">
					        <input type="password" name="psw" placeholder="비밀번호를 입력해주세요">
					        <div class="input-icon2"></div>
		      		  </div>      
			      <button class="login-btn" type="button" id="loginBtn">로그인</button>      
					     <a class="reset-psw" href="#">아이디 찾기</a>
					     <a class="reset-psw" href="#">비밀번호 찾기</a>
			      	<div class="seperator"><b>or</b></div>
			     	 	 <a class="reset-psw" href="member">회원가입</a>
			    </form>
	  	 	</div>
    </main>
    
    
    <footer>
       <div class="foot">
			<nav>
			<br/>
				<a href="http://naver.com" target="_blank">웹사이트 소개</a>
				<a href="http://naver.com" target="_blank">개인정보 처리방침</a>
				<a href="http://naver.com" target="_blank">이용약관</a>
				<a href="http://naver.com" target="_blank">인재채용</a>
			</nav>
				<p>
					<span>프로젝트 : 서드리 프로젝트</span><br/>
					<span>조원 : 권나영, 박현지, 손창환, 송윤태, 임지혜 </span><br/>
				</p>
		</div>
    </footer>
</body>
</html>

