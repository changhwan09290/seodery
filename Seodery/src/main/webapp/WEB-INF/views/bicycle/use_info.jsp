<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자전거 이용안내</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<style type="text/css">
/* 웹 폰트 적용 */
@font-face {
	font-family: 'Cafe24Ssurround';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'twayair';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}
    
        #wrapper { /*85%로 너비값*/
            width: 85%;
            margin: 0 auto;
           /*  position: relative; */
        }
       header { /*헤더 %로 단위변경*/
            width: 100%;
            height: 155px;
            background-image :url("resources/images/park/logo.png");
            background-size: 320px 164px;
            background-repeat : no-repeat;
            background-position : center;
           /*  border-bottom: 2px solid black; */
    }
       
/* 로그인 버튼 */
#LoginBtn, #LogoutBtn {
	z-index: 9999;
	border : none;
	border-radius: 5px;
	background-color:rgb(3, 104, 115);
	font-size: 1.1rem;
	color : white;
	font-family: '고딕';
	cursor: pointer;
	padding: 4px 17px 4px 17px;
	box-shadow:  0 1px 1px 0 rgb(3, 104, 115);
}

/* 로그인버튼, 유저 로그인정보 div */
.logout{
	white-space : nowrap;
 	display : flex;
 	position : absolute;
	right: 8%;
	top: 93px;
	align-items: flex-end;
	
}
/* 마이페이지 연필 이미지 */
.pencil{
	width: 30px;
	height: 30px;
	background-image: url("resources/images/park/pencil.png");
	background-repeat: no-repeat;
	margin-right: 9px;
	margin-left : 7px;
	background-size: contain;
	cursor: pointer;
	z-index: 9999;
}

/* 네비게이션바 전체 */
.navi{
	list-style-type: none;
   	margin-top : -55px;
    padding: 0px; 
    display: flex;		/* 가로정렬 */
     background: white;   
   /*  background : rgb(150, 210, 90);   */
    width: 100%;
   	overflow: auto;
}

/* 메뉴 */
.navi > li{
	line-height: 30px;   	/* 줄간격 */
	/*text-align: center;		 텍스트 정렬 */ 	
	padding: 13px;
	color: black;
	text-decoration: none;
	width: 25%; 
 	font-size: 1.4rem;
}
/* 메뉴바 세로선 */
.navi > li.sub{
	text-align: center;	
	border-top: 2px solid silver;
	border-bottom: 2px solid rgb(150, 210, 90); 
}		/* 텍스트 정렬 */ 	


/* 관리자 메뉴 없애기 */
.navi > #manager{
	display: none;	
}

/* 메뉴바에 커서 올렸을때 호버이벤트 */
.navi > .Park:hover{
	background: rgb(150, 210, 90);
	color: white;
}

.navi > .WalkT:hover{
	background: rgb(150, 210, 90);
	color: white;
}

.navi > .Bike:hover{
	background: rgb(150, 210, 90);
	color: white;
}
.navi > .FDust:hover{
	background: rgb(150, 210, 90);
	color: white;
}

.navi > .Memory:hover{
	background: rgb(150, 210, 90);
	color: white;
}
.navi > .Notice:hover{
	background: rgb(150, 210, 90);
	color: white;
}


/* 하위메뉴 글씨 */
.gnb_sub > li> a{
	color : black;
	font-size: 0.9em;
}

/* 네비메뉴에 있는 a태그 */
.navi a{
	text-decoration:none; 
}

/* dv box */
.dvbox{
	border-top: 2px solid silver;
	border-bottom: 2px solid rgb(150, 210, 90); 
}

/* 메뉴 모양 표시 */
.dv {
  width: 35px;
  height: 5px;
  background-color: rgb(121,55,55);
  margin: 6px 0;
}

/* 메뉴 글씨체 */
.gnb > .navi > .sub {
	font-family: 'Cafe24Ssurround';
}

/* gnb(네비게이션바)의 하위메뉴 */
.gnb_sub {
	 display: none; 
	list-style-type: none;
	padding-left: 0px;
}

.navcon{
	padding-top: 193px; 
	position: absolute; 
	left:20px; 
	right:20px;
	margin-left: 12px;
	margin-right: 12px;
}
/* 네비게이션바 */
#nav{
	margin-left: 5.6%;
   	margin-right: 5.3%;
}
/* 공지사항,공원 best5 목록 글씨 */
main .li{
	font-size: 1.4rem;
	font-family:'twayair';
}

/* 현재페이지 나타내기 */
main > .Cpage {
	width: 100%;
	margin-top: 5.5%;
	margin-left: 5.5%;
	font-family: '고딕';
	font-weight: 900;
}

main > table > tr,td {
	border: 1px solid black;
}


/* body 전체 */
/* #wrap{
	min-height: 100vh;
 	position: relative;
	width: 86%;
} */

/* footer */
footer { 
	width: 85%;
	height: 120px;
	position: relative;
	color: gray;
	font-size: 0.8em;
	text-align: center;
	/* padding-left: 7.5%; */
	bottom: 0;
	margin: 0 auto;
	border-top: 1px solid black;
}

footer > .foot > nav > a{
	text-decoration: none;
	color: black;
}

	.title {
		padding-left: 10%;
	}

	section {
		float: left;
		width: 40%;
		display: grid;
		justify-content: space-between;
		padding-left: 10%;
	}
	
	.left {
		float: left;
	}
	
	aside {
		float: right;
		width: 40%;
		display: grid;
		justify-content: space-between;
		padding-right: 10%;
	}
	
	.left > div > img {
		padding-left: 0;
		width: 350px;
		height: 400px;
	}
	
	ul {
		line-height: 30px;
		list-style:none;
		padding-left: 0;
	}

</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//로그인
	$("#LoginBtn").on("click", function() {
		location.href = "login";
	});
	
	//로그아웃
	$("#LogoutBtn").on("click", function() {
		location.href = "logout";
	});
	
	//연필 누르면 마이페이지
	$(".logout .pencil").on("click", function() {
		location.href = "mypage";
	});

});
</script>
</head>
<body>
<!-- 기본테마 -->
<div id="wrapper">
        <header id="header">
			<div id="logo">
				<form action="#" method="post" >
					<div class="logout">
						<c:choose>
							<c:when test="${empty sMNo}">
								<input type="button" value="로그인" id="LoginBtn" />
							</c:when>
							<c:otherwise>
								${sMNm}님 환영합니다.
								<div class="pencil"></div>
								<input type="button" value="로그아웃" id="LogoutBtn" />
							</c:otherwise>
						</c:choose>						
						<!-- <input type="button" value="로그아웃" id="LogoutBtn"/> -->
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
		<div class="Cpage"><h4>자전거 > 자전거 이용안내</h4></div>
		
		<div class="title">
			<h1>자전거 이용안내</h1>
		</div>
	
		<section class="left">
	
			<h3 style="color:#0F90FA;">이용요금</h3>
			<!-- 색: #0F90FA -->
			<ul>
				<li><b>일일권</b></li>
				<li>&nbsp;- 1시간 1천원</li>
				<li>&nbsp;- 2시간 2천원</li>
			</ul>
			<ul>
				<li><b>정기권</b></li>
				<li>&nbsp;- 7일 3,000원</li>
				<li>&nbsp;- 1개월 5,000원</li>
				<li>&nbsp;- 180일 15,000원</li>
				<li>&nbsp;- 1년 30,000원(1시간권 기준)</li>
			</ul>
			<div class="img">
			<img src="http://localhost:8002/Seodery/resources/images/bicycle/bike.png">
			</div>
		</section>
	
		<aside class="right">
			<h3 style="color:#0F90FA;">자전거 안전하게 이용하세요</h3>
			<ul>
				<li><b>안전모 착용하기</b></li>
				<li>자전거도로 및 도로를 운행할 때에 자전거 운전자 및 동승자는 반드시 안전모를 착용해야 합니다.</li>
			</ul>
			<ul>
				<li><b>자전거 음주운전 금지</b></li>
				<li>술에 취한 상태에서 자전거를 운행하는 경우 20만원 이하의 벌금이나 구류 또는 과료에 처합니다.</li>
			</ul>
			<ul>
				<li><b>안전한 전기자전거 운행</b></li>
				<li>안전요건에 적합하지 않은 전기자전거를 자전거도로에서 운행하는 경우 4만원의 과태료가 부과됨니다.</li>
			</ul>
		</aside>
		<div style="clear:both;"></div>
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
</div>
    <script>
	/* 네비게이션 바 마우스 포커스 이벤트 */
	$(function(){
		gnbSlideInit();
	});
	
	
	function gnbSlideInit() {
		//gnb (상위메뉴에 마우스 포커스)
	    var current = false;
		
	    $('.gnb>ul>li').on('mouseenter focusin',function(){
	       current = true;
	       liObj = $(this)
	       setTimeout(function() {
	             if(current == true) {
	                 $('.gnb>ul>li').removeClass('on'); 
	                 //liObj.addClass('on');
	             //alert();
	             $('.gnb_sub, .gnb_subbox').stop().slideDown();
	             }
	         }, 50);
	    });
	    
	    
	    $('.gnb>ul>li').on('mouseleave focusout',function(){
	       current = false;
	       setTimeout(function() {
	          if(current == false) {
	             $('.gnb>ul>li').removeClass('on');
	             $('.gnb_sub, .gnb_subbox').stop().slideUp();
	          }
	       }, 50); 
	    });
	} 
	
</script>
</body>
</html>