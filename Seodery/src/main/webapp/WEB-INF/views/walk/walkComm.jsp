<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>        
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>산책 프로젝트</title>
    <script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <!-- <link rel="stylesheet" type="text/css" href="default.css"> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <script type="text/javascript"
		src="resources/script/jquery/jquery.form.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="resources/script/jquery/rate.js"></script>
    <link rel="stylesheet" href="resources/script/jquery/rate.css">
    <script src="resources/script/jquery/iconfont.js"></script>
	<script src="resources/script/jquery/iconfont.css"></script> 
    <script type="text/javascript">
    $(document).ready(function(){
    	  
    	  
    	/*   $(".write_area #cancleBtn").on("click", function(){
    			$("#comm").val("");
    			
    			$(".write_area .action_btn").show();
    			$(".write_area .action_btn2").hide();
    		}); */
    		
    		
    	 $("#rateBox").rate({
   		  type:0,
             length: 5,
             value: 3,
             half:true,
             decimal:true,
             readonly: false,
             hover:false,
             text:false,
             textList: ['Bad','Poor','Medium','Good','Perfect'],
             theme:'#FFB800',
             size: '25px',
             gutter:'3px',
             selectClass: 'fxss_rate_select',
             incompleteClass: '',
             customClass: '',
             callback: function(object){
                 console.log(object)
             }
         });
    		
    		$("#writeBtn").on("click", function(){
    			alert('성공');
    		});
	
    	  
    });
    
   
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
	
	$("writeBtn").on("click", function(){
		if(checkVal("#comm")){
			alert("내용을 입력해 주세요.");
			$("#comm").focus();
		} else {
			var params = $("#addForm").serialize();
			
			$.ajax({
				url : "walkCommCUDAjax",
				type : "post",
				dataType : "json",
				data : params,
				success : function(res){
					if(res.result == "success"){
						location.href = "walkComm";
					} else if(res.result == "failed"){
						alert("작성에 실패하였습니다.");
					} else {
						alert("작성중 문제가 발생했습니다.");
					}
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
		}

	});
	
	
	function checkVal(sel) {
		if($.trim($(sel).val()) == "") {
			return true;
		} else {
			return false;
		}
	}
</script>
    <style>
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
            height: 100vh;
        }
        
        main{
        	height : 85%;
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
            text-align: center;
        }
        
 /* 로그인 버튼 */
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
   	 width : 100%;
   	overflow : auto;
}

/* 메뉴 */
.navi > li{
	line-height: 30px;   	/* 줄간격 */
	/*text-align: center;		 텍스트 정렬 */ 	
	padding: 13px;
	color:  black;
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
	/* border-right: 1px solid gray; */
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

.write_area{
	margin-left : 70.5%;
	/* position: absolute; */
	right: 25%;
	top: 255px;
	z-index: -999;
 	width:500px;
    height:30px; 
    display: inline-block;
}
/* input {
  width:300px;
  height:30px;
  font-size:20px; 
}  */

comm_wrap


/* footer */
footer { 
	width: 85%;
	height: 100px;
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

/* 표 */
#table {
	width: 85%;
	height : 50%;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
	font-family: '고딕';
	font-size: 1.2rem;
}

#table > th,td{
	border-bottom: 1px solid #ddd;
    border-top: 1px solid #ddd;
	padding: 5px;
	text-align: center;
	line-height: 30px;
}

/* th {
	border : 1px solid black;
	padding: 5px;
	background-color: rgb(212,212,212);
} */

/* 작성버튼 */
#writeBtn{
	border : none;
	border-radius: 5px;
	width: 55px;
	height: 28px;
	background-color: rgb(3, 104, 115);
	color: white;
	font-family: '고딕';
	cursor: pointer;
	box-shadow:  0 1px 1px 0 rgb(3, 104, 115);
	/* white-space : nowrap; */
	/* position: absolute; */
	right: 14%;
	top: 255px;
	z-index: -999;
}

.update_btn{
	border : none;
	border-radius: 5px;
	width: 65px;
	height: 28px;
	background-color: rgb(3, 104, 115);
	color: white;
	font-family: '고딕';
	cursor: pointer;
	box-shadow:  0 1px 1px 0 rgb(3, 104, 115);
	white-space : nowrap;
}
#DelBtn{
	border : none;
	border-radius: 5px;
	width: 65px;
	height: 28px;
	background-color: rgb(3, 104, 115);
	color: white;
	font-family: '고딕';
	cursor: pointer;
	box-shadow:  0 1px 1px 0 rgb(3, 104, 115);
	white-space : nowrap;
}

.topbox {
    display: flex; 
	height: 20px;
    margin-bottom: 5px; 
	margin-left: 10px;
	margin-top: 70px;
	position: relative;
}

/* 페이징 div */
.page{
	display: flex;
	justify-content: center;
	margin-top: 25px;
}

.paging{
	margin-right: 7px;
}
/* 1번째 페이지 */
#one{
	color: red;
}

.comm_sel{
	border-bottom: 
}




</style>
</head>
<body>
<div id="wrapper">
        <header id="header">
			<div id="logo">
				<!-- <form action="#" method="post" >
					<div class="logout">
						{000}님 환영합니다.
						<div class="pencil"></div>
						<input type="button" value="로그아웃" id="LogoutBtn"/>
					</div> -->
					 <c:choose>
					      <c:when test="${empty sMNo}">
					           <input type="hidden" value="로그인" id="loginBtn"/>
					      </c:when>
					      <c:otherwise>
					         <div class="logout">
					         <div class="pencil"></div>
					         ${sMNm}님 어서오십시오.<input type="button" value="로그아웃" id="LogoutBtn"/>
					         </div>
					      </c:otherwise>
					   </c:choose>
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
							<li class="sub Park">공원</a>	
								<ul class="gnb_sub">
									<li><a href="#">공원 찾기</a></li>
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
		
	<main>
	<div class="write_area">
	<form action="#" id="addForm" method="post">
	<input type="hidden" name="gbn" value="c">
	<input type="hidden" name="mno" value="${sMNo}">
	<div class="comm_sel"><p>댓글</p></div>
	      	<div class="topbox">
	      		<div id="rateBox"></div>
	      		
	      		<div class="comm_wrap">
	      			<input type="text" class="menuBox" name="comm" id="comm" placeholder="내용을 입력해주세요">
	      			<input type="button" value="작성" class="action_btn" id="writeBtn">
		      		<input type="hidden" value="수정" class="action_btn2" id="updateBtn">
		      		<input type="hidden" value="취소" class="action_btn2" id="cancleBtn">
	      		</div>
	      	</div>
	      	</form>
	      	</div>
	      	<table id="table">
	      		<tbody>
	      			<tr>
	      				<td><b>아이디:@@@</b></td>
	      				<td><b>댓글내용:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></td>
	      				<td>2021-09-15</td>
	      				<td><input type="button" value="수정" id="updateBtn" class="update_btn"></td>
	      				<td><input type="button" value="삭제" id="DelBtn"></td>
	      			</tr>
	      			<tr>
	      				<td><b>아이디:@@@</b></td>
	      				<td><b>댓글내용:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></td>
	      				<td>2021-09-15</td>
	      				<td><input type="button" value="수정" id="updateBtn" class="update_btn"></td>
	      				<td><input type="button" value="삭제" id="DelBtn"></td>
	      			</tr>
	      			<tr>
	      				<td><b>아이디:@@@</b></td>
	      				<td><b>댓글내용:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></td>
	      				<td>2021-09-15</td>
	      				<td><input type="button" value="수정" id="updateBtn" class="update_btn"></td>
	      				<td><input type="button" value="삭제" id="DelBtn"></td>
	      			</tr>
	      			<tr>
	      				<td><b>아이디:@@@</b></td>
	      				<td><b>댓글내용:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></td>
	      				<td>2021-09-15</td>
	      				<td><input type="button" value="수정" id="updateBtn" class="update_btn"></td>
	      				<td><input type="button" value="삭제" id="DelBtn"></td>
	      			</tr>
	      			<tr>
	      				<td><b>아이디:@@@</b></td>
	      				<td><b>댓글내용:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></td>
	      				<td>2021-09-15</td>
	      				<td><input type="button" value="수정" id="updateBtn" class="update_btn"></td>
	      				<td><input type="button" value="삭제" id="DelBtn"></td>
	      			</tr>
	      			<tr>
	      				<td><b>아이디:@@@</b></td>
	      				<td><b>댓글내용:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></td>
	      				<td>2021-09-15</td>
	      				<td><input type="button" value="수정" id="updateBtn" class="update_btn"></td>
	      				<td><input type="button" value="삭제" id="DelBtn"></td>
	      			</tr>
	      			<tr>
	      				<td><b>아이디:@@@</b></td>
	      				<td><b>댓글내용:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></td>
	      				<td>2021-09-15</td>
	      				<td><input type="button" value="수정" id="updateBtn" class="update_btn"></td>
	      				<td><input type="button" value="삭제" id="DelBtn"></td>
	      			</tr>
	      			<tr>
	      				<td><b>아이디:@@@</b></td>
	      				<td><b>댓글내용:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></td>
	      				<td>2021-09-15</td>
	      				<td><input type="button" value="수정" id="updateBtn" class="update_btn"></td>
	      				<td><input type="button" value="삭제" id="DelBtn"></td>
	      			</tr>
	      			<tr>
	      				<td><b>아이디:@@@</b></td>
	      				<td><b>댓글내용:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></td>
	      				<td>2021-09-15</td>
	      				<td><input type="button" value="수정" id="updateBtn" class="update_btn"></td>
	      				<td><input type="button" value="삭제" id="DelBtn"></td>
	      			</tr>
	      			<tr>
	      				<td><b>아이디:@@@</b></td>
	      				<td><b>댓글내용:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@</b></td>
	      				<td>2021-09-15</td>
	      				<td><input type="button" value="수정" id="updateBtn" class="update_btn"></td>
	      				<td><input type="button" value="삭제" id="DelBtn"></td>
	      			</tr>
	      		</tbody>	
	      	</table>
		      		<div class="page">
			      		<div class="paging">이전</div>
			      		<div class="paging" id="one">1</div>
			      		<div class="paging">2</div>
			      		<div class="paging">3</div>
			      		<div class="paging">4</div>
			      		<div class="paging">5</div>
			      		<div class="paging">다음</div>
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
					<span>프로젝트 : 프로젝트</span><br/>
					<span>조원 :  </span><br/>
				</p>
		</div>
    </footer>
    
    </div>
</body>
</html>