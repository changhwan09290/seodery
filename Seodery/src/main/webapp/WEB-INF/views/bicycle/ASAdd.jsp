<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수리문의 작성</title>
<style type="text/css">
/* 웹 폰트 적용 */
@font-face {
	font-family: 'Cafe24Ssurround';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'twayair';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff')
		format('woff');
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
	background-image: url("resources/images/park/logo.png");
	background-size: 320px 164px;
	background-repeat: no-repeat;
	background-position: center;
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
.logout {
	white-space: nowrap;
	display: flex;
	position: absolute;
	right: 8%;
	top: 93px;
	align-items: flex-end;
}

/* 마이페이지 연필 이미지 */
.pencil {
	width: 30px;
	height: 30px;
	background-image: url("resources/images/park/pencil.png");
	background-repeat: no-repeat;
	margin-right: 9px;
	margin-left: 7px;
	background-size: contain;
}

/* 네비게이션바 전체 */
.navi {
	list-style-type: none;
	margin-top: -55px;
	padding: 0px;
	display: flex; /* 가로정렬 */
	background: white;
	/*  background : rgb(150, 210, 90);   */
	width: 100%;
	overflow: auto;
}

/* 메뉴 */
.navi>li {
	line-height: 30px; /* 줄간격 */
	/*text-align: center;		 텍스트 정렬 */
	padding: 13px;
	color: black;
	text-decoration: none;
	width: 25%;
	font-size: 1.4rem;
}
/* 메뉴바 세로선 */
.navi>li.sub {
	text-align: center;
	border-top: 2px solid silver;
	border-bottom: 2px solid rgb(150, 210, 90);
} /* 텍스트 정렬 */

/* 관리자 메뉴 없애기 */
.navi>#manager {
	display: none;
}

/* 메뉴바에 커서 올렸을때 호버이벤트 */
.navi>.Park:hover {
	background: rgb(150, 210, 90);
	color: white;
}

.navi>.WalkT:hover {
	background: rgb(150, 210, 90);
	color: white;
}

.navi>.Bike:hover {
	background: rgb(150, 210, 90);
	color: white;
}

.navi>.FDust:hover {
	background: rgb(150, 210, 90);
	color: white;
}

.navi>.Memory:hover {
	background: rgb(150, 210, 90);
	color: white;
}

.navi>.Notice:hover {
	background: rgb(150, 210, 90);
	color: white;
}

/* 하위메뉴 글씨 */
.gnb_sub>li>a {
	color: black;
	font-size: 0.9em;
}

/* 네비메뉴에 있는 a태그 */
.navi a {
	text-decoration: none;
}

/* dv box */
.dvbox {
	border-top: 2px solid silver;
	border-bottom: 2px solid rgb(150, 210, 90);
}

/* 메뉴 모양 표시 */
.dv {
	width: 35px;
	height: 5px;
	background-color: rgb(121, 55, 55);
	margin: 6px 0;
}

/* 메뉴 글씨체 */
.gnb>.navi>.sub {
	font-family: 'Cafe24Ssurround';
}

/* gnb(네비게이션바)의 하위메뉴 */
.gnb_sub {
	display: none;
	list-style-type: none;
	padding-left: 0px;
}

.navcon {
	padding-top: 193px;
	position: absolute;
	left: 20px;
	right: 20px;
	margin-left: 12px;
	margin-right: 12px;
}
/* 네비게이션바 */
#nav {
	margin-left: 5.6%;
	margin-right: 5.3%;
}
/* 공지사항,공원 best5 목록 글씨 */
main .li {
	font-size: 1.4rem;
	font-family: 'twayair';
}

/* 현재페이지 나타내기 */
main>.Cpage {
	width: 100%;
	/* padding-top: 3%;
	padding-left: 8%; */
	margin-top: 5.5%;
	margin-left:5.5%;
	font-family: '고딕';
	font-weight: 900;
}

main>table>tr, td {
	border-bottom: 1px solid black;
    border-right: 1px solid black;
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

footer>.foot>nav>a {
	text-decoration: none;
	color: black;
}

#att {
	display: none;
}

h1 {
	padding-left: 10%;
}

.hide_btn {
	display: none;
}
</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	CKEDITOR.replace("con", {
		resize_enabled : false, //resize_enabled : 마우스로 크기 조절하는거
		language : "ko",
		enterMode : "2" //enterMode : 엔터를 줄바꿈으로 쓰겠다.
	});
	
	//엔터키 폼 실행 차단
	$("#addForm").on("keypress", "input", function(event) {
		if(event.keyCode == 13) { //엔터키가 눌렸을 때
			return false; // form 실행 이벤트를 하지 않음
		}
	});
	
	$("#ListBtn").on("click", function(){
	$("#goForm").submit();
	});
	
	//첨부파일버튼
	$("#attach").on("click", function() {
		$("#att").click();
	});
	
	//첨부파일 선택 시
	$("#att").on("change", function() {
		//마지막 \에서 다음 글자부터 자르겠다 => 파일명만 나옴
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") + 1));
	});
	
	$("#addBtn").on("click", function() {
		//ck데이터 중에 con과 관련된 객체에서 데이터를 취득하여 textarea인 con에 값을 넣는다.
		$("#con").val(CKEDITOR.instances['con'].getData());

		
			if(checkVal("#title")) {
				alert("제목을 입력해주세요.");
				$("#title").focus();
			} else if(checkVal("#serialNum")) {
				alert("고유번호를 입력해주세요.");
			} else if(checkVal("#rentsh_loc")) {
				alert("대여소 위치를 입력해주세요.");
			} else if(checkVal("#con")) {
				alert("수리내용을 입력해주세요.");
			} else {
				//위에서 필터처리 먼저 한 후 success, error처리
				var fileForm = $("#fileForm");
				fileForm.ajaxForm({
					success : function(res) {
						if(res.result == "SUCCESS") {
							//업로드 파일명 적용
							if(res.fileName.length > 0) { //업로드한 파일이 있는 경우
								$("#dbFile").val(res.fileName[0]);
							}
							//글 저장
							var params = $("#addForm").serialize();
							$.ajax({
								url: "ASAddAjax",
								type: "post",
								dataType: "json",
								data: params,
								success: function(res) {
									if(res.result == "success") {
										location.href = "AfterServiceList";
									} else if(res.result == "failed") {
										alert("작성에 실패하였습니다.");
									} else {
										alert("작성 중 문제가 발생하였습니다.");
									}
								},
								error: function(request, status, error) {
									console.log(error);
								}
							});
						} else {
							alert("파일 업로드에 실패하였습니다.");
						}
					},
					error : function(reg, status, error) {
						console.log(error);
						alert("파일 업로드 중 문제가 발생하였습니다.");
					}
				});
				fileForm.submit();
			}
		
	});
});
function checkVal(sel) {
	if($.trim($(sel).val()) == "") {
		return true;
	} else {
		return false;
	}
}
</script>
</head>
<body>
<div id="wrapper">
<header id="header">
<div id="logo">
	<form action="#" method="post" >
		<div class="logout">
			<c:choose>
				<c:when test="${empty sMNo}">
					<input type="button" value="로그인" id="LoginBtn"/>
				</c:when>
				<c:otherwise>
					${sMNm}님 환영합니다.
					<div class="pencil"></div>
					<input type="button" value="로그아웃" id="LogoutBtn" />
				</c:otherwise>
			</c:choose>
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
						<li><a href="#">추억저장</a></li>
					</ul>
				</li>
				<li class="sub Notice">공지사항
					<ul class="gnb_sub">
						<li><a href="#">고객의 소리</a></li>
						<li><a href="MOpinionList">공지사항</a></li>
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
<main style="padding-bottom: 3%;">
<div class="Cpage">
	<h4>자전거 > 자전거 수리문의 > 글 작성</h4>
</div>
<div class="title">
	<h1>자전거 수리문의</h1>
</div>
<form id="fileForm" name="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
	<input type="file" name="att" id="att">
</form>
<div>
	<form action="AfterServiceList" method="post" id="goForm">
		<input type="hidden" name="page" value="${param.page}">
	</form>
	<form action="#" id="addForm" method="post">
		제목 : <input type="text" id="title" name="title" /><br>
		고유번호 : <input type="text" id="serialNum" name="serialNum" /><br>
		대여소 위치 : <input type="text" id="rentsh_loc" name="rentsh_loc" /><br>
		작성자 : ${sMNm}<input type="hidden" value="${sMNo}" name="m_num" /><br>
		내용
		<textarea rows="5" cols="5" id="con" name="con"></textarea><br/>
		첨부파일 : <input type="button" id="attach" value="첨부파일선택" /><br>
		<span id="fileName"></span>
		<input type="hidden" name="dbFile" id="dbFile" /><!-- DB저장용 -->
	</form>	
</div>
<input type="button" value="등록" id="addBtn" />
<input type="button" value="목록" id="ListBtn" />
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