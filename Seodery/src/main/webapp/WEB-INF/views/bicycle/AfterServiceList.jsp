<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자전거 수리문의</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<style type="text/css">
<!-- 기본테마 -->
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
       
 /* 로그아웃 버튼 */
#LoginBtn {
	border : none;
	border-radius: 5px;
	background-color:rgb(3, 104, 115);
	font-size: 1.1rem;
	color : white;
	font-family: '고딕';
	cursor: pointer;
	padding: 4px 17px 4px 17px;
	box-shadow:  0 1px 1px 0 rgb(3, 104, 115);
	/* position: fixed;
	right: 90px;
	top: 100px; */
}
       
 /* 로그아웃 버튼 */
#LogoutBtn {
	border : none;
	border-radius: 5px;
	background-color:rgb(3, 104, 115);
	font-size: 1.1rem;
	color : white;
	font-family: '고딕';
	cursor: pointer;
	padding: 4px 17px 4px 17px;
	box-shadow:  0 1px 1px 0 rgb(3, 104, 115);
	/* position: fixed;
	right: 90px;
	top: 100px; */
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
.gnb > .navi > .sub{
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
	padding-top: 3%;
	padding-left: 8%;
	font-family: '고딕';
	font-weight: 900;
}

main > table > tr,th {
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

#actionForm {
	float: right;
	padding-right: 10%;
}

.tabled {
	padding-top: 30px;
	padding-bottom: 30px;
}

.table {
	text-align: center;
	border: 2px solid gray;
	width: 80%;
}
</style>

<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//페이징 처리
	$("#PagingWrap").on("click", "span", function() {
		$("#page").val($(this).attr("page"));		
		reloadList();
	});
	
	//작성 버튼
	$("#addBtn").on("click", function() {
		$("#actionForm").attr("action", "ASAdd");
		$("#actionForm").submit();
	});
	
	//상세보기로 이동(제목 누르면)
	$("tbody").on("click", "tr", function() {
		$("#title").val($(this).attr("title"));
		$("#searchTxt").val($("#oldTxt").val());
		$("#actionForm").attr("action", "ASDtl");
		$("#actionForm").submit();
	});
	
	//로그인
	$("#LoginBtn").on("click", function() {
		location.href = "Login";
	});
	
	//로그아웃
	$("#LogoutBtn").on("click", function() {
		location.href = "Logout";
	});

});
function reloadList() {
	var params = $("#actionForm").serialize();
	$.ajax({
		url: "AfterServiceListAjax",
		type: "get",
		dataType: "json",
		data: params,
		success: function(res) {
			drawList(res.list);
			drawPaging(res.pb);
		},
		error: function(request, status, error) {
			console.log(error);
		}
	});
}

function drawList(list) {
	var html = "";
	
	for(var data of list) {
		html += "<tr title=\"" + data.BAS_title + "\"> ";
		html += "<td>" + data.BAS_qs_num + "</td>		";
		html += "<td>" + data.BAS_title + "</td>		";
		if(data.BAS_title != null) {
	    	html += "<img src=\"resources/images/bicycle/attach_icon.png\" />";
	    }
	    html += "</td>";
		html += "<td>" + data.UR_ID + "</td>		";
		html += "<td>" + data.BAS_WRDATE + "</td>		";
		/* html += "<td>" + data.BAS_처리상태 + "</td>	"; */
		/* if 관리자가 답을 달면 처리완료, 안달면 null? */
		html += "</tr>						";
	}
	
	$("tbody").html(html);
}

function drawPaging(pb) {
	var html ="";
		
		if($("#page").val() == "1") {
			html += "<span page=\"1\">이전</span>    ";
		} else {
			html += "<span page=\"" +($("#page").val() * 1 - 1) + "\">이전</span>    ";
		}
		
		for(var i = pb.startPcount; i <= pb.endPcount; i++) {
			if($("#page").val() == i) {
				html += "<span page=\"" + i + "\"><b>" + i + "</b></span>    ";
			} else {
				html += "<span page=\"" + i + "\">" + i + "</span>    ";
			}
		}
		
		if($("#page").val() == pb.maxPcount) {
			html += "<span page=\"" + pb.maxPcount + "\">다음</span>    ";
		} else {
			html += "<span page=\"" +($("#page").val() * 1 + 1) + "\">다음</span>    ";
		}

		$("#PagingWrap").html(html);
}
</script>
</head>
<body>
<%-- <div>
	<c:choose>
		<c:when test="${empty sMNo}">
			<input type="button" value="로그인" id="LoginBtn" />
		</c:when>
		<c:otherwise>
			${sMNm}님 어서오세요.<input type="button" value="로그아웃" id="LogoutBtn" />
		</c:otherwise>
	</c:choose>
</div> --%>

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
									<li><a href="#">공원 찾기</a></li>
									<li><a href="#">길 찾기</a></li>
								</ul>
							</li>
							<li class="sub WalkT">산책로
								<ul class="gnb_sub">
									<li><a href="#">산책로 찾기</a></li>
								</ul>
							</li>
							<li class="sub Bike">자전거
								<ul class="gnb_sub">
									<li><a href="#">실시간 대여정보</a></li>
									<li><a href="#">자전거 이용안내</a></li>
									<li><a href="#">자전거 수리문의</a></li>
								</ul>
							</li>
							<li class="sub FDust">미세먼지
								<ul class="gnb_sub">
									<li><a href="#">미세먼지 현황</a></li>
								</ul>
							</li>
							<li class="sub Memory">추억저장
								<ul class="gnb_sub">
									<li><a href="#">추억저장</a></li>
								</ul>
							</li>
							<li class="sub Notice">공지사항
								<ul class="gnb_sub">
									<li><a href="#">고객의 소리</a></li>
									<li><a href="#">공지사항</a></li>
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
</div>
<main>
	<div class="Cpage"><h4>자전거 > 자전거 수리문의</h4></div>

<div class="title">
	<h1>자전거 수리문의</h1>
</div>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="page" id="page" value="${page}" />
	<input type="hidden" name="title" id="title" />
	<input type="button" value="작성" id="addBtn" />
</form>
<div class="tabled" align="center">
<table class="table">
	<thead>
		<tr>
			<th style="width:10%">번호</th>
			<th style="width:40%">제목</th>
			<th style="width:10%">아이디</th>
			<th style="width:20%">작성일</th>
			<th style="width:20%">처리상태</th>
		</tr>
	</thead>
	<%-- <colgroup><col width="200"/><col width="200"/></colgroup> --%>
	<tbody></tbody>
</table>
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

<div id="PagingWrap"></div>
</body>
</html>