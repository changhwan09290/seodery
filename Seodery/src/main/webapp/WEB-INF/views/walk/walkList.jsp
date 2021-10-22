<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
	<script type="text/javascript">
	$(document).ready(function(){
		   reloadList();
		
		/* $("#pagingWrap").on("click", "span", function() {
			$("#page").val($(this).attr("page"));
			
			reloadList();
		}); */
		
		$(".dtl_btn").on("click", function(){
			location.href = "walkComm";
		});
		
	});
	
	/* 네비게이션 바 마우스 포커스 이벤트 */
	$(function(){
		gnbSlideInit();
	});
	
	
	
	/* $("#searchBtn").on("click", function() {
		 $("#page").val("1"); 
		$("#oldTxt").val($("#searchTxt").val());
		
		reloadList();
	}); */
	
	
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
	
	function reloadList(){
	
	$.ajax({   
    url : "apiwalk",
    type: "get",   
    dataType:"json",
     success : function(res){   
        console.log(res);
        makeTable(res); 
        drawPaging(res);
     },
     error: function(request, status, error){   
        console.log(request);
        console.log(error);
     }
  });
}

	   function makeTable(jsonData) {
		      var rows = jsonData.SeoulGilWalkCourse.row;
		      
		      var html = "";
		      var button ='<td><input type="button" value="상세보기" class="dtl_btn" id="DtlBtn"></td>';
		      
		      for (var idx in rows) {
		         html += '<tr><td>' + rows[idx].COURSE_NAME + '</td><td>' + rows[idx].AREA_GU + '</td><td>' + rows[idx].LEAD_TIME + '</td><td>' + button + '</td></tr>';
		      }
		      
		      $("tbody").html(html);
		   }
	   
	   function drawPaging(pb){
			var html ="";
			
			html += "<span page=\"1\">처음</span>        ";
			
			if($("#page").val() == "1"){
				html += "<span page=\"1\">이전</span>        ";
			} else {
				html += "<span page=\"" + ($("#page").val() * 1 - 1) + "\">이전</span>        ";
			}
		   
			for(var i = pb.startPcount ; i <= pb.endPcount ; i++){
				if($("#page").val() == i){
					html += "<span page=\"" + i + "\"><b>" + i + "</b></span>        ";
				} else {
					html += "<span page=\"" + i + "\">" + i + "</span>           ";
				}
			}
			
			if($("#page").val() == pb.maxPcount) {
				html += "<span page=\"" + pb.maxPcount + "\">다음</span>";
			} else {
				html += "<span page=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>";
			}
			
			html += "<span page=\""+ pb.maxPcount + "\">마지막</span>";
			
			$(".paging_wrap").html(html);
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
            background-image :url("resources/images/logo.png");
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
	background-image: url("resources/images/pencil.png");
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

.searchTxt{
	/* margin-left : 70.5%; */
	position: absolute;
	right: 25%;
	top: 255px;
	z-index: -999;
}



/* 작성버튼 */
#SearchBtn{
	border : none;
	border-radius: 5px;
	width: 55px;
	height: 28px;
	background-color: rgb(3, 104, 115);
	color: white;
	font-family: '고딕';
	cursor: pointer;
	box-shadow:  0 1px 1px 0 rgb(3, 104, 115);
	white-space : nowrap;
	position: absolute;
	right: 19.5%;
	top: 255px;
	z-index: -999;
}

#DtlBtn{
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
	height: 50px;
	margin-bottom: 10px; 
	margin-left: 10px;
}
/* footer */
footer { 
	width: 85%;
	height: 100px;
/* 	position: fixed; */				
	bottom : 0px; 
	position: relative;				
	/* top:580px;
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
	font-size: 1.5rem;
}

#table > th,td{
	border-bottom: 2px solid #ddd;
    border-top: 2px solid #ddd;
	padding: 5px;
	text-align: center;
	line-height: 30px;
}

/* th {
	border : 1px solid black;
	padding: 5px;
	background-color: rgb(212,212,212);
} */

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

#pagingWrap{
	/* position: absolute; */
	width: 500px;
	position: relative;	
	left: 50%;
}
</style>
</head>
<body>
<div id="wrapper">
        <header id="header">
			<div id="logo">
				<form action="#" method="post" >
					<div class="logout">
						{000}님 환영합니다.
						<div class="pencil"></div>
						<input type="button" value="로그아웃" id="LogoutBtn"/>
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
	<div class="Cpage"><h4>산책로 > 산책로 찾기</h4></div>
		<form action="#" id="actionForm" method="post">
	      	<div class="topbox">
	      		<input type="text" class="searchTxt" name="searchTxt" id="searchTxt" placeholder="지역명을 입력해주세요">
	      		<input type="hidden" id="oldTxt">
	      		<input type="hidden" id="page" name="page" value="${page}" />
	      		<input type="button" value="검색" id="SearchBtn"/>
	      	</div>
	    </form>  	
	      	<div align="center">
	      	<table id="table">
	      		<tbody>
	      		</tbody>	
	      	</table>
	      	</div>
		      		<div id="pagingWrap"></div>
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
</body>
</html>