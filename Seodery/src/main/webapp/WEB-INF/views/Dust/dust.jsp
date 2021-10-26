<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7450fc3d5a89c106bff0c13b9a43db59"></script>
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
            background-image :url("/images/park/logo.png");
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
/* 마이페이지 연필 이미지 */
.pencil{
	width: 30px;
	height: 30px;
	background-image: url("../images/pencil.png");
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
	/* border: 1px solid black; */
	width: 100%;
	margin-top: 5.5%;
	margin-left: 1.5%;
	font-family: '고딕';
	font-weight: 900;
	
	
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

	.map {
		width:800px;
		height:500px;
	 	border : 1px solid;
		top: 50%;
		left: 50%;
		transform:translate(-50%, -30%); 
		position: absolute;
		}

	.controll_Dust {	
		top: 30%;
		left: 35%;
		transform:translate(-60%, -30%); 
		position: absolute;
		background-color:white;
		
	}
	
	#Btn_FDust {
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		margin-right: -4px;
	}
	#Btn_UFDust {
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		margin-right: -2px;
	}
	
	#controll_Dust button {
		border: 1px solid green;
		background: white;
		color: black;
		padding: 5px;
	}
	

	.dust-info {
        width:200px;
        height:200px;
        border : 1px solid;
        margin: 5px;
        top: 45%;
		left: 25%;
		transform:translate(-50%, -30%); 
		position: absolute;
    	}
    	
    .udust-info {
        width:200px;
        height:200px;
        border : 1px solid;
        margin: 5px;
        top: 70%;
		left: 25%;
		transform:translate(-50%, -30%); 
		position: absolute;
    	}   
    	
    .good {	
	 	background-color: rgb( 66, 167, 255);    
	 	width:30%;
    	box-sizing: border-box;
	}
	.normal {		
	 	background-color: rgb( 66, 255,162);    
	 	width:30%;
    	box-sizing: border-box;
	}
	.bad {	
	 	background-color: yellow;    
	 	width:30%;
    	box-sizing: border-box;
	}
	.worst {		
	 	background-color: rgb( 250, 61,48);    
	 	width:30%;
    	box-sizing: border-box;
	 	
	}    
    .sys {	

	 	background-color: gray;    
	 	width:30%;
    	box-sizing: border-box;	 	
	} 
	
	.timedust{
	    width:100px;
		height:20px;
		border : 1px solid;
		margin: 5px;
		top: 30%;
		left: 70%;
		transform:translate(140%, -50%); 
		position: absolute;
	     	}
	     	
	 .names-dust{
		 top: 30%;	
		 left: 75%;
		 position: absolute;
	     	}
	 .map_circle {
   		display: inline-block;
	    width: 25px;
	    height: 25px;
	    border-radius: 25px;
	    line-height: 50px;
	    text-align: center;
	    background-color: skyblue;
	    opacity: 0.9;
	     	}
</style>
<script type="text/javascript">
	
	//지도 표시 div
	$(document).ready(function() {
		var container = document.getElementById('map');
	
		//지도 중심 좌표
		var options = {
			center: new kakao.maps.LatLng(37.565994, 126.977496),
			level: 9
		};
		
		//지도 생성
		var map = new kakao.maps.Map(container, options);
		var customOverlay = new kakao.maps.CustomOverlay({
		});
		
		//행정구역 구분
		$.getJSON("resources/json/map.geojson", function(geojson) {
		 console.log(geojson);
		    var data = geojson.features;
		    var coordinates = [];    //좌표 저장할 배열
		    var name = '';            //행정 구 이름
		 
		    $.each(data, function(index, val) {
		 
		        coordinates = val.geometry.coordinates[0];
		        name = val.properties.SIG_KOR_NM;
		        
		        displayArea(coordinates, name);
		 
		    });
		});
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		var polygons=[];        //function 안 쪽에 지역변수로 넣으니깐 폴리곤 하나 생성할 때마다 배열이 비어서 클릭했을 때 전체를 못 없애줌.  그래서 전역변수로 만듦.
	    
		//행정구역 폴리곤
		function displayArea(coordinates, name) {
		    var path = [];            //폴리곤 그려줄 path
		    var points = [];        //중심좌표 구하기 위한 지역구 좌표들
		    
		    $.each(coordinates[0], function(index, coordinate) {      // console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
		        var point = new Object(); 
		        point.x = coordinate[1];
		        point.y = coordinate[0];
		        points.push(point);
		        path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));            //new kakao.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가
		    })
		    
		    // 다각형을 생성합니다 
		    var polygon = new kakao.maps.Polygon({
		        map : map, // 다각형을 표시할 지도 객체
		        path : path,
		        strokeWeight : 2,
		        strokeColor : '#004c80',
		        strokeOpacity : 0.8,
		        fillColor : '#fff',
		        fillOpacity : 0.7
		    });
		    
		    polygons.push(polygon);            //폴리곤 제거하기 위한 배열
		    
		  //지역 배열
		    var Locs = ['중구','종로구', '용산구','은평구','서대문구','마포구','광진구','성동구','중랑구',
			     '동대문구','성북구','도봉구','강북구','노원구','강서구','구로구','영등포구','동작구','관악구','금천구','양천구','강남구' ,'서초구','송파구','강동구','강남구'];  
		  //지역별 좌표	    
		    var circleLocs = [
		    	 new kakao.maps.LatLng(37.562368, 126.994337),
		    	 new kakao.maps.LatLng(37.601722, 126.972595),
		    	 new kakao.maps.LatLng(37.530788, 126.980108),
		    	 new kakao.maps.LatLng(37.622929, 126.924228),
		    	 new kakao.maps.LatLng(37.576761, 126.937031),
		    	 new kakao.maps.LatLng(37.559806, 126.898465),
		    	 new kakao.maps.LatLng(37.546251, 127.091018),
		    	 new kakao.maps.LatLng(37.554394, 127.039176),
		    	 new kakao.maps.LatLng(37.599985, 127.091837),
		    	 new kakao.maps.LatLng(37.581922, 127.053984),
		    	 new kakao.maps.LatLng(37.603368, 127.011140),
		    	 new kakao.maps.LatLng(37.673821, 127.031243),
		    	 new kakao.maps.LatLng(37.639221, 127.007821),
		    	 new kakao.maps.LatLng(37.649826, 127.074220),
		    	 new kakao.maps.LatLng(37.568567, 126.823401),
		    	 new kakao.maps.LatLng(37.493266, 126.839458),
		    	 new kakao.maps.LatLng(37.525442, 126.908517),
		    	 new kakao.maps.LatLng(37.504990, 126.952272),
		    	 new kakao.maps.LatLng(37.464280, 126.940805),
		    	 new kakao.maps.LatLng(37.448795, 126.906071),
		    	 new kakao.maps.LatLng(37.517080, 126.852273),
		    	 new kakao.maps.LatLng(37.493893, 127.071649),
		    	 new kakao.maps.LatLng(37.477033, 127.017967),
		    	 new kakao.maps.LatLng(37.510105, 127.109649),
		    	 new kakao.maps.LatLng(37.554159, 127.146360)
		    	];
		    
		    //지역 들어간 원을 좌표에 생성
		    for (var i = 0; i < circleLocs.length; i ++) {
		    	  var circleHtml = "<div class=\"map_circle\">" + Locs[i] + "</div>";
		    	   var customOverlay = new kakao.maps.CustomOverlay({
		    			    	map: map,
		    			    	position:circleLocs[i],
		    			    	content:circleHtml,
		    			    	zIndex:1000
		    	    });
		    	}
		    	
		    
		 
		    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
		    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
		 
		        customOverlay.setPosition(mouseEvent.latLng);
		    });
		 
		    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
		    // 커스텀 오버레이를 지도에서 제거합니다 
		    kakao.maps.event.addListener(polygon, 'mouseout', function() {
		        polygon.setOptions({
		            fillColor : '#fff'
		        });
		        customOverlay.setMap(null);
		    });
		 
		    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 해당 지역 확대을 확대합니다.
		    kakao.maps.event.addListener(polygon, 'click', function() {
		        
		        // 현재 지도 레벨에서 2레벨 확대한 레벨
		        var level = map.getLevel()-1;
		        
		        // 지도를 클릭된 폴리곤의 중앙 위치를 기준으로 확대합니다
		        map.setLevel(level, {anchor: centroid(points), animate: {
		            duration: 350            //확대 애니메이션 시간
		        }});            
		 
		        //deletePolygon(polygons);                    //폴리곤 제거      
		    });
		}
		//centroid 알고리즘 (폴리곤 중심좌표 구하기 위함)
		function centroid (points) {
			 var i, j, len, p1, p2, f, area, x, y;

			area = x = y = 0;

			for (i = 0, len = points.length, j = len - 1; i < len; j = i++) {
					p1 = points[i];
					p2 = points[j];

					f = p1.y * p2.x - p2.y * p1.x;
					x += (p1.x + p2.x) * f;
					y += (p1.y + p2.y) * f;
					area += f * 3;
					
			}
			return new kakao.maps.LatLng(x / area, y / area);
		}
	
		function deletePolygon(polygons) {
			for(var i = 0 ; i < polygons.length ; i++) {
				polygons[i].setMap(null);
			}
			
			polygons = [];
		}
		
	});
	

    function dust() {
        $('#names-dust').empty(); 
          $.ajax({ 
              type: "GET",
              url: "http://openapi.seoul.go.kr:8088/6d6d62644373647436327074734965/json/RealtimeCityAir/1/25/",
              data: {}, 
              success: function (response) { 
                  let rows = response['RealtimeCityAir']['row']
                  for(let i = 0 ;i<rows.length;i++){
                    let gu_time = rows[i]['MSRDT']
                    let gu_name = rows[i]['MSRSTE_NM']
                    let gu_dust = rows[i]['PM10']
                    let gu_udust = rows[i]['PM25']
                    let temp_html = ``
                        if(gu_dust>70){
                           temp_html = `<li>${gu_name}:${gu_dust}</li>`
                        }
                        else{
                           temp_html = `<li>${gu_name}-${gu_dust}-${gu_udust}:${gu_time}</li>`
                           
                        }
                        $('#names-dust').append(temp_html);
                      }
                  }
              });
          }
    
    
		</script>
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
	<div class="Cpage"><h4>미세먼지</h4></div>	
<div class="paging_wrap"></div>
    </main>
    
    <!--지도 크기  -->
  <div id="map" class="map"></div>
   	
   	<!--미세, 초미세 버튼  -->
       <div id="controll_Dust" class="controll_Dust">
   		<button id="Btn_FDust" onclick="">미세먼지</button>
   		<button id="Btn_UFDust" onclick="">초미세먼지</button>
    </div>
    
    <!--미세먼지 기준  -->  
					<div class="dust-info">
						     <h3 style="text-align:center";>미세먼지</h3>
						    	<dl>
						            <dd><em>등급</em><em>지수범위</em></dd>
						            <dd><span class="good">좋음</span>0~15</dd>
						            <dd><span class="normal">보통</span>16~35</dd>
						            <dd><span class="bad">나쁨</span>36~75</dd>
						            <dd><span class="worst">매우나쁨</span>76~</dd>
						            <dd><span class="sys">점검중</span>-</dd>
								</dl>			
					    </div>		
					    					
       <!--초미세먼지 기준  -->
				   
						<div class="udust-info">
							  <h3 style="text-align:center";>초미세먼지</h3>
								<dl>
									<dd><em>등급</em><em>지수범위</em></dd>
									<dd><span class="good">좋음</span>0~30</dd>
									<dd><span class="normal">보통</span>31~80</dd>
									<dd><span class="bad">나쁨</span>81~150</dd>
									<dd><span class="worst">매우나쁨</span>151~</dd>
									<dd><span>점검중</span>-</dd>
								</dl>	
						</div>			
			   <!--실시간 미세먼지 출력  -->		
					
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