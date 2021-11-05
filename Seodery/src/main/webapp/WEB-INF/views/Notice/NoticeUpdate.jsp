<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
       
       
        footer{ /*푸터 %로 단위변경*/
            clear: both; 
            width: 85%;
            height: 120px;
            text-align: center;
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
	/* border: 1px solid black; */
	width: 100%;
	margin-top: 5.5%;
	margin-left: 1.5%;
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
	height: 110px;
	position: fixed;				
	bottom : 0px; 
	/* position: relative;				
	top:580px;
	bottom : 0px; */
	padding-top: 15px;
	color: gray;
	font-size: 0.8em;
	text-align: center;
	margin: 0 auto;
	
}
/* footer div */
.foot{
	border-top: 1px solid black;
	
}

footer > .foot > nav > a{
	text-decoration: none;
	color: black;
}



</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
 		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript"
 		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	CKEDITOR.replace("con", {
		resize_enabled : false,
		language : "ko",
		enterMode : "2"
	});
	
	//연필 누르면 마이페이지
	   $(".logout").on("click", function() {
	      location.href = "mypage";
	   });
	
	//취소버튼
	$("#cancelBtn").on("click", function(){
		$("#backForm").submit();
	});
	
	//엔터키 폼실행 막기
	$("#updateForm").on("keypress", "input" , function(event){
		if(event.keyCode == 13) {//엔터키가 눌러졌을때
			return false;	//form실행 이벤트를 하지않음 필수
		}
	});
		
	//첨부파일 버튼
	$("#fileBtn").on("click", function(){
		$("#att").click();
	});
	
	//첨부파일 선택 시
	$("#att").on("change", function(){
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") + 1));
	});
	
	//첨부파일 삭제 버튼
	$("#fileDelBtn").on("click", function(){
		$("#fileName").html("");//사용자에게 보여지는 파일명
		$("#atach").val("");//DB에 올라갈 파일명
		$("#fileBtn").attr("class", "");//첨부파일 선택 버튼 보이기
		$(this).remove(); //첨부파일 삭제버튼 제거
	});	
	
	//수정 버튼
	$("#updateBtn").on("click", function() {
		//ck에디터 중에 con과 관련된 객체에서 데이터를 취득하여textarea인 con에 값을 넣는다
		$("#con").val(CKEDITOR.instances['con'].getData());		

	if(checkVal("#title")) {
			alert("제목을 입력해 주세요.");
			$("#title").focus();
		}else if(checkVal("#con")) {
			alert("내용을 입력해 주세요.");
		}else{	
			var fileForm = $("#fileForm");
			
			fileForm.ajaxForm({
				success : function(res) {
					if(res.result == "SUCCESS") {
					//업로드 파일명 적용
						if(res.fileName.length > 0) {//업로드한 파일이 있는 경우
							$("#atach").val(res.fileName[0]);
						}
					
						//글 수정
						var params = $("#updateForm").serialize();
						
						$.ajax({
							url: "NoticeUpdates",
							type: "post",
							dataType: "json",
							data: params,
							success: function(res){
								if(res.result == "success") {
									$("#backForm").submit();
								}else if(res.result == "failed") {
									alert("수정에 실패하였습니다.");
								} else {
									alert("수정중 문제가 발생하였습니다.");
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
				error : function(req, status, error) {
					console.log(error);
					alert("파일 업로드중에 문제가 발생하였습니다.");
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
	
      		<div class="Cpage"><h4>공지사항 > 작성페이지</h4></div>
      		<div class="title">
      			<h1>공지사항</h1>
      		</div>
      		
			<form id="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
				<input type="file" name="att" id="att" />
			</form>
			<form action="MOpinion" id="backForm" method="post">
				<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
				<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
				<input type="hidden" name="page" value="${param.page}" />
				<input type="hidden" name="no" value="${param.no}" />					
			</form>
		<form action="#" id="updateForm" method="post">
		<input type="hidden" name="no" value="${param.no}" />	
	제목 <input type="text" id="title" name="title" value="${data.TITLE}" /><br>
	작성자 : ${data.ID}<input type="hidden" name="id" value="${sMNo}" /><br>
	<textarea rows="5" cols="5" id="con" name="con">${data.CON}</textarea>
	첨부파일 :
	<c:choose>
		<c:when test="${!empty data.ATACH}">
		<!-- 첨부파일이 있는경우 버튼을 숨긴다 -->
			<input type="button" value="첨부파일선택" id="fileBtn" class="hide_btn" />
		</c:when>
		<c:otherwise>
			<input type="button" value="첨부파일선택" id="fileBtn" />
		</c:otherwise>
	</c:choose>
	<c:set var="len" value="${fn:length(data.ATACH)}"></c:set>
	<span id="fileName">${fn:substring(data.ATACH, 20, len)}</span><!-- 현재 등록되어있는 파일명 -->
	<c:if test="${!empty data.ATACH}">
		<input type="button" value="첨부파일삭제" id="fileDelBtn" />
	</c:if> 
	<input type="hidden" name="atach" id="atach" value="${data.ATACH}" /><!-- DB저장용 -->	
	</form>
		<br>
		<input type="button" value="수정" id="updateBtn" />
		<input type="button" value="취소" id="cancelBtn" />
				

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