<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c953a065c47d3eb731f9ab037fd520fa"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c953a065c47d3eb731f9ab037fd520fa&libraries=services,clusterer,drawing"></script>
<style type="text/css">
 /* 웹 폰트 적용 */
 @font-face {
    font-family: 'Cafe24Ssurround';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
    font-weight: normal;
    font-style: normal;https://apis.map.kakao.com/web/wizard
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
            position : relative;
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
#LoginBtn,#LogoutBtn {
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
   /* position: fixed;
   right: 90px;
   top: 100px; */
} 

.dtlbtn{
	  background-color:rgb(3, 104, 115);
	  box-shadow:  0 1px 1px 0 rgb(3, 104, 115);
	  color: white;
	  border-radius: 5px;
}

/* 로그인버튼, 유저 로그인정보 div */
.logo{
	white-space : nowrap;
 	display : flex;
 	position : absolute;
	right: 3%;
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
	padding-top: 36px; 
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

.map-container{
	border: 1px solid green;
	padding: 50px;
	border-radius: 5px;
	width:800px;
	height:400px;
	margin-left:auto;
	margin-right:auto;
}

table{
	margin-right: 8%;
}

/* footer */
footer { 
	width: 85%;
	height: 110px;
	position: relative;				
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
/* 페이징 div  */
.paging_wrap{
	margin-top : 5%;;
	margin-left: 40%;
}

.desc #DtlBtn{
	border: none;
    background-color: white;
    color: blue;
    font-weight: 900;
    cursor: pointer;
}

/* 지도 오버레이 */
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73p
x;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
.info .pIdx{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	var overlays = new Array();
	gnbSlideInit();
	
	//로고 누르면 메인으로 이동(로고가 아니라 헤더 전체,,)
	/* $("#header").on("click", function() {
		location.href = "mainpage";
	}); */
	
	//연필 누르면 마이페이지
	   $(".logout").on("click", function() {
	      location.href = "mypage";
	   });
	
	//로그인 
	   $("#LoginBtn").on("click",function(){
			
		 location.href = "login";
		});  

	 
	//로그아웃 
	 $("#LogoutBtn").on("click",function(){
		location.href = "logout";
	}); 
	
	 $(".pencil").on("click", function(){
			location.href = "mypage";
		});
	
	//상세보기 버튼을 클릭했을 때 이벤트 
	 $("tbody").on("click", "input", function(){
		console.log("no >>" + $(this).parents('tr').find('td[name="pIdx"]').text());
		
		//$("#no").attr($(this).parents('tr').find('td[name="pIdx"]').text()); 
		
		$("#no").val($(this).parents('tr').find('td[name="pIdx"]').text());
		
		$("#actionForm").attr("action","parkDtl");
		$("#actionForm").submit();
	});  
	
	//지도 상세보기 버튼을 클릭했을 때 이벤트 
	 $("#map").on("click", "input", function(){
		console.log("위치>>>>" + $(this).parents('div').children('div[name="pIdx"]').text());
		
		$("#no").val($(this).parents('div').children('div[name="pIdx"]').text());
		
		$("#actionForm").attr("action","parkDtl");
		$("#actionForm").submit();
	});  
	
	//페이징
	 $(".paging_wrap").on("click","span",function(){
		 $("#page").val($(this).attr("page"));
		 /* $("#searchTxt").val($("#oldTxt").val());  */
		
		reloadList();
	}); 
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(37.5501402, 126.9903773), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨
	}; 

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커 만들기
	 function makeMakers(list) {
		console.log("makeMakers###########");
		var positions = [];
		console.log(list);
		for( var i=0; i<list.length; i++) {
		    var data = list[i];
		    
			var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: new kakao.maps.LatLng(data.LATITUDE, data.LONGITUDE), // 마커를 표시할 위치
		        title : data.P_PARK, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        idx : overlays.length
		    });
			
			var idx = overlays.length;
			
// 			var iwPosition = new kakao.maps.LatLng(data.LATITUDE, data.LONGITUDE); //인포윈도우 표시 위치입니다
			var iwContent = 
			'<div class="wrap">' + '<div class="info">' + '<div name="pIdx">' + data.P_IDX +'</div>'
			+'<div class="title">' + data.P_PARK + '<div class="close close_info" idx="' + idx + '" title="닫기"></div>' + 
            '</div>' + '<div class="body">' + '<div class="img">' +
            '<img src=\"' + data.P_IMG + '\" width="73px;heigt="70px">' +
            '</div>' + 
            '<div class="desc">' + 
            '<div class="ellipsis">'+data.P_ADDR +'</div>' + 
            '<input type="button" value="상세보기" id="DtlBtn">'+
            '</div>' + 
            '</div>' + 
            '</div>' +    
            '</div>';
            
				var overlay = new kakao.maps.CustomOverlay({
				    content: iwContent,
				    map: map,
// 				    position: iwPosition      
				    position: marker.getPosition()  
				});
				
				overlays.push(overlay);
				
				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				kakao.maps.event.addListener(marker, 'click', function() {
					overlay.setMap(map);
					
				});
		}
		
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		$("body").on("click", ".close_info", function() {
			overlays[$(this).attr("idx")].setMap(null);
		});
	 } 
	

	
	reloadList();
	reloadMap();
	//데이터 취득
	function reloadMap(){
		
		console.log("reload ##########");
		
		var params = $("#actionForm").serialize();
		$.ajax({	//jquery의 ajax함수 호출  
			url : "http://openAPI.seoul.go.kr:8088/58446e7a71616b643239487a427157/json/SearchParkInfoService/1/200", 
			type: "get",	//전송 방식
			dataType:"json",	//받아올 데이터 형태 
			data: params,
	// 		data : sendData,	//보낼 데이터(문자열 형태)
			success : function(res){	//성공(ajax통신 성공) 시 다음 함수 실행 
				makeMakers(res.SearchParkInfoService.row); // 좌표목록 만듬
				//drawList(res.list);
				//drawPaging(res.pb);
			},
			error: function(request, status, error){	//실패 시 다음 함수 실행 
				console.log(request);
				console.log(error);
			}
		});
	}
	
});

function reloadList(){
	
	var params = $("#actionForm").serialize();
	$.ajax({	//jquery의 ajax함수 호출  
		url : "apitest", 
		type: "get",	//전송 방식
		dataType:"json",	//받아올 데이터 형태 
		data: params,
		success : function(res){	//성공(ajax통신 성공) 시 다음 함수 실행 
			makeTable(JSON.parse(res.resData)); // 목록 만듬
			drawPaging(res.pb);
		},
		error: function(request, status, error){	//실패 시 다음 함수 실행 
			console.log(request);
			console.log(error);
		}
	});
}

//목록 그리기 
function makeTable(jsonData) {
    var rows = jsonData.SearchParkInfoService.row;
    $data = "";
    
    for (var idx in rows) {
       $data += '<tr><td name="pIdx">'+ rows[idx].P_IDX + '</td><td>' + rows[idx].P_PARK + '</td><td>'+ rows[idx].P_ADDR 
       		+ '</td><td>'+ rows[idx].P_ADMINTEL + '</td><td>' + '<input type="button" value="상세보기" id="DtlBtn class="dtlbtn">' + '</td></tr>';
    }
    
    $("#table").html($data);
    
 }

/* 페이징 */
function drawPaging(pb){
	console.log("pb", pb);
	 
	var html ="";
	
	html += "<span page=\"1\">처음</span>      " ;
	
	//현재페이지가 1인지 확인
	if($("#page").val()=="1"){
		html +=  "<span page=\"1\">이전</span>";
	}else{
		html += "<span page=\""+($("#page").val()*1-1)+"\">이전</span>";
	}
	
	
	for(var i = pb.startPcount; i<= pb.endPcount ; i++){
		if($("#page").val()==i){
			html += "<span page=\""+ i + "\"><b>"+i+"</b></span>";
		}else{
			html += "<span page=\""+ i + "\">"+ i + "</span>";
		}
	}
	
	if($("#page").val()== pb.maxPcount){
		html += "<span page=\""+pb.maxPcount +"\">다음</span>      ";
	}else {
		html += "<span page=\""+ ($("#page").val()*1 +1) +"\">다음</span>      ";
	}
	
	html += "<span page=\""+pb.maxPcount +"\">마지막</span>      ";
	
	$(".paging_wrap").html(html);
}

</script>
</head>
<body>
    <div id="wrapper">
        <header id="header">
			<div class="logo">
						<div class="pencil"></div>
						<c:choose>
							<c:when test="${empty sMNo}">
								<div class="login">
									<input type="button" value="로그인" id="LoginBtn"/>
								</div>
							</c:when>
						<c:otherwise>
							<div class="logout">
								${sMNm}님 환영합니다.
								<input type="button" value="로그아웃" id="LogoutBtn"/>
							</div>
						</c:otherwise>
						</c:choose>
			</div>
	</header>			
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
		
	<main>
      	<div class="Cpage"><h4>공원 > 길 찾기</h4></div>
      	<form action="#" id="actionForm" method="get">
			<input type="hidden" name="page" id="page" value="${page}"/>
			<input type="hidden" name="no" id="no"/>
		</form>
		<div class="map-container">
      	<div id="map" style="width:800px;height:400px;margin-left:auto;margin-right:auto;"></div>
    	</div>	
    		<div align="center">
            <table style="text-align:center;">
            	<thead>
			<tr>
				<th>번호</th>
				<th>공원이름</th>
				<th>공원 주소</th>
				<th>전화번호</th>
				<th>상세보기</th>
			</tr>
		</thead>
               <colgroup><col width="200"/><col width="200"/></colgroup>
               <tbody id="table">
               
               </tbody>   
            </table>
	</div>
    	<div class="paging_wrap"></div>
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