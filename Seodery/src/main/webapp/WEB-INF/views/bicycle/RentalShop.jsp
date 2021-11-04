<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 대여정보</title>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bacfa63ae8d74a05f2ba2ee2f08d3302"></script>
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
.logout {
	white-space: nowrap;
	display: flex;
	position: absolute;
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

	.h1 {
		padding-left: 10%;
	}
	
	#map {
		margin-left: 15%;
		margin-bottom: 3%;
		/* z-index: -1; */
		z-index: auto;
	}
	
 	div .customOverlay {
		color: white;
		border-radius: 10px;
		width: 20px;
		text-align: center;
	}
	
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	//로고 누르면 메인으로 이동(로고가 아니라 헤더 전체,,)
	$("#header").on("click", function() {
		location.href = "mainpage";
	});
	
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(37.55564880, 126.91062927), //생성자는 위도, 경도순으로 넣기
		level: 4,
		maxLevel: 8
	};
	
	
	var map = new kakao.maps.Map(container, options);
	
	let apiRslt = [];
	let positions= [];
	$.ajax({
		url : "rentalapi",
		type : "get",
		dataType:"JSON",
		async: false, //동기
		success: function(res) {
			console.log(res);

			apiRslt = res.rentBikeStatus.row;
			positions = apiRslt.map((props) => {
				return({
					title: props.parkingBikeTotCnt, 
					latlng: new kakao.maps.LatLng(props.stationLatitude, props.stationLongitude),
					name: props.stationName
				});
			});	
		},
		error: function(err) {
			console.log(err);
		}
	});
	
	
	//5개이하 마커
	var redImageSrc = "https://i.ibb.co/gd2nbMJ/maker-red.png"; // 마커이미지의 주소입니다    
    var redImageSize = new kakao.maps.Size(54, 59); // 마커이미지의 크기입니다
    var redImageOption = {offset: new kakao.maps.Point(27, 59)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다	
 	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var redMarkerImage = new kakao.maps.MarkerImage(redImageSrc, redImageSize, redImageOption);
        
    //20개 이하
    var yellowImageSrc = "https://i.ibb.co/WpGj3Kj/maker-yellow.png"; // 마커이미지의 주소입니다    
    var yellowImageSize = new kakao.maps.Size(54, 59); // 마커이미지의 크기입니다
    var yellowImageOption = {offset: new kakao.maps.Point(27, 59)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다	
    var yellowMarkerImage = new kakao.maps.MarkerImage(yellowImageSrc, yellowImageSize, yellowImageOption);
	
    //그 외
    var greenImageSrc = "https://i.ibb.co/DVqv7Ym/maker-green.png"; // 마커이미지의 주소입니다    
    var greenImageSize = new kakao.maps.Size(54, 59); // 마커이미지의 크기입니다
    var greenImageOption = {offset: new kakao.maps.Point(27, 59)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다	
    var greenMarkerImage = new kakao.maps.MarkerImage(greenImageSrc, greenImageSize, greenImageOption);
    
    // 마커를 생성합니다

    for (var i=0; i< positions.length; i++) {
    	
    	let bikeLeft = positions[i].title;
    	if (bikeLeft <= 5) { 
    		var content = '<div class="customOverlay" style="background-color: red;">' + positions[i].title + '</div>';
		    var redMarker = new kakao.maps.Marker({
		    	map: map,
		    	position: positions[i].latlng,
		    	title: positions[i].title,
		       	image: redMarkerImage, // 마커이미지 설정 
		        name: positions[i].name,
		        clickable: true
			});
    	} else if (5 < bikeLeft && bikeLeft <= 20) { 
    		var content = '<div class="customOverlay" style="background-color: #E6EC1C;">' + positions[i].title + '</div>';
    		var yellowMarker = new kakao.maps.Marker({
		    	map: map,
		    	position: positions[i].latlng,
		    	title: positions[i].title,
		       	image: yellowMarkerImage, // 마커이미지 설정 
		        name: positions[i].name,
		        clickable: true
			});
    	} else {
    		/* console.dir('else'); */
    		var content = '<div class="customOverlay" style="background-color: #49D04C;">' + positions[i].title + '</div>';
    		var greenMarker = new kakao.maps.Marker({
		    	map: map,
		    	position: positions[i].latlng,
		    	title: positions[i].title,
		       	image: greenMarkerImage, // 마커이미지 설정
		        name: positions[i].name,
		        clickable: true
			});
    	}
	    // 커스텀 오버레이를 생성합니다
	    var customOverlay = new kakao.maps.CustomOverlay({
	        map: map,
	        position: positions[i].latlng,
	        content: content,
	        yAnchor: 2.4
	    });
	 	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	    var iwContent = '<div style="padding:5px;">' + positions[i].name + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable,
	        name: positions[i].name
	    });
    }
 // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(redMarker, 'click', function() {
          // 마커 위에 인포윈도우를 표시합니다
          infowindow.open(map, redMarker);  
    });
 // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(yellowMarker, 'click', function() {
          // 마커 위에 인포윈도우를 표시합니다
          infowindow.open(map, yellowMarker);  
    });
 // 마커에 클릭이벤트를 등록합니다
  	kakao.maps.event.addListener(greenMarker, 'click', function() {
          // 마커 위에 인포윈도우를 표시합니다
          infowindow.open(map, greenMarker);  
    });
 
		// 마커가 지도 위에 표시되도록 설정합니다
	    /* marker.setMap(map);   */
    /* var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });
    clusterer.addMarkers(redMarker, yellowMarker, greenMarker); */

});

/* function reloadList(){
	$.ajax({
		url : "rentalapi",
		type : "get",
		dataType:"json",
		data: params,
		success: function(res) {
			console.log(res);
			
			let rows = res.rentBikeStatus.row;
			for (let i = 0; i < rows.length; i++) {
                let bikeLeft = rows[i].parkingBikeTotCnt;
			}
				
		},
		error: function(request, status, error) {
			console.log(error);
		}
	});
} */
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
								<input type="button" value="로그인" id="LoginBtn" onclick="console.log('!');" /> 
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
	<div class="Cpage"><h4>자전거 > 실시간 대여소</h4></div>
	
	<div class="h1">
	<h1>실시간 대여소</h1>
	</div>
	
	<!-- 지도 크기 -->
	<div id="map" style="width:850px;height:500px;"></div>
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