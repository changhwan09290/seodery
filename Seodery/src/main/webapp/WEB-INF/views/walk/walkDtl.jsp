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
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efcd20073fdb6fbf7035470c42ec3653"></script> -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efcd20073fdb6fbf7035470c42ec3653&libraries=services"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!--   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>  -->
    <script src="resources/script/jquery/rate.js"></script>
    <link rel="stylesheet" href="resources/script/jquery/rate.css">
    <script src="resources/script/jquery/iconfont.js"></script>
    <script src="resources/script/jquery/iconfont.css"></script>  
    <script type="text/javascript">
   $(document).ready(function(){
      var cosn = "${cosn}";
      apiCall(cosn);
          
      $("#backBtn").on("click", function(){
        history.back(); 
      });
      
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
   });
   

   
   function apiCall(cosn){
      $.ajax({   
       url : "walkapiDtl?cosn=" + cosn,
       type: "get",   
       dataType:"json",
        success : function(res){   
           makeTable(res); 
        },
        error: function(request, status, error){   
           console.log(request);
           console.log(error);
        }
     });
   }
   
   function makeTable(jsonData) {
      //console.log(jsonData);
         var rows = jsonData.SeoulGilWalkCourse.row;
         var html = "";
         
         //console.log(rows);
         
         html += '<div class="cos">';
         html += '<div><div class="map"></div><div class="icon_nm">' +'코스명 : ' + rows[0].COURSE_NAME + '</div></div>';
         html += '<div><div class="map"></div><div class="icon_nm">' +'자치구 : ' +  rows[0].AREA_GU + '</div></div>';
         html += '<div><div class="right"></div><div class="icon_nm">' +'소요시간 : ' +  rows[0].LEAD_TIME + '</div></div>';
         html += '<div><div class="right"></div><div class="icon_nm">' +'세부코스 : ' +  rows[0].DETAIL_COURSE + '</div></div>';
         html += '<div><div class="right"></div><div class="icon_nm">' +'교통편 : ' +  rows[0].TRAFFIC_INFO + '</div></div>';
         html += '</div>';
        // html += '<div id="map" style="width:100%;height:350px;"></div>';
         
        // console.log(rows[idx].X,rows[idx].Y);
         
         $("#DtlCon").html(html);
         //callKakaoAPI(rows[0].X,rows[0].Y);
         //console.log(rows);
         
         /* for (var i=0; i<rows.length; i++) {
            callKakaoAPI(rows[i].X,rows[i].Y);
          
            //console.log(rows[i].X,rows[i].Y);
         } */
         
      
         var sortedRows = rows.sort((r1, r2) => r1.CPI_IDX < r2.CPI_IDX);
         
         
         callKakaoAPI(sortedRows);
         //console.log(sortedRows);

         
         
      }
   
   function callKakaoAPI(rows){
      /*  var geocoder = new kakao.maps.services.Geocoder(), // 좌표계 변환 객체를 생성합니다
        wtmX = rows[0].X , // 변환할 WTM X 좌표 입니다
        wtmY = rows[0].Y; // 변환할 WTM Y 좌표 입니다 */
        
        //console.log(rows);
        
        var geocoder = new kakao.maps.services.Geocoder();
        
        for (var i=0; i<rows.length; i++) {
 		   var wtmX = rows[i].X; // 변환할 WTM X 좌표 입니다
 		   var wtmY = rows[i].Y; // 변환할 WTM Y 좌표 입니다 		   		
               
       // WTM 좌표를 WGS84 좌표계의 좌표로 변환합니다
       geocoder.transCoord(wtmX, wtmY, transCoordCB, {
           input_coord: kakao.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
           output_coord: kakao.maps.services.Coords.WGS84 // 변환 결과로 받을 좌표계 입니다 
     
       });
        }
        
        
    
    // 좌표 변환 결과를 받아서 처리할 콜백함수 입니다.
    function transCoordCB(result, status) {
        //console.log(result);
    	var linePath = [];
        // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {
           
        	
        	linePath.push(new kakao.maps.LatLng(result));
           /* for(var i=0; i<result.length; i++){
        	   //console.log(result[i]);
        	   linePath.push(new kakao.maps.LatLng(result));
        	   //positions.push([new kakao.maps.LatLng(result[i].y, result[i].x)]);
           } */
           //console.log(result[0].y);
           //console.log(result[0].x);
           
           var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(result[0].y, result[0].x), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
           
           // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
           var map = new kakao.maps.Map(mapContainer, mapOption);
    
            // 마커를 변환된 위치에 표시합니다
           
           var marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(result[0].y, result[0].x), // 마커를 표시할 위치입니다
                //position : positions,
                map: map // 마커를 표시할 지도객체입니다
            }) 
            
        // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
           /* var linePath = [
               new kakao.maps.LatLng(33.452344169439975, 126.56878163224233),
               new kakao.maps.LatLng(33.452739313807456, 126.5709308145358),
               new kakao.maps.LatLng(33.45178067090639, 126.5726886938753) 
           ]; */

           //var linePath = [];
           
             //console.log(result[0].y);
             //console.log(result[0].x);
             
             //linePath.push(new kakao.maps.LatLng(result[0].y, result[0].x));
             
             /* for (var i=0; i<result.length; i++) {
				var coord = result[i];
				var lat = coord[i];
				var lng = coord[i];
				linePath.push(new kakao.maps.LatLng(lat, lng));
			} */
             
            
           
           // 지도에 표시할 선을 생성합니다
           var polyline = new kakao.maps.Polyline({
               path: linePath, // 선을 구성하는 좌표배열 입니다
               strokeWeight: 5, // 선의 두께 입니다
               strokeColor: '#FFAE00', // 선의 색깔입니다
               strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
               strokeStyle: 'solid' // 선의 스타일입니다
           });

           // 지도에 선을 표시합니다 
           polyline.setMap(map);
        }
    }
    }
	   </script>
 
   <!-- /* function callKakaoAPI(X,Y){
      console.log("document.getElementById('map'):"+document.getElementById('map'));
      var center = ol.proj.transform([lon,lat],'EPSG:4326','EPSG:3857')

      
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div
      mapOption = { 
          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
          //center: new kakao.maps.LatLng(X, Y), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
      };
      
      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);
   }  */ -->
   
     
   
  
    
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
    display: flex;      /* 가로정렬 */
     background: white;   
   /*  background : rgb(150, 210, 90);   */
    width: 100%;
      overflow: auto;
}

/* 메뉴 */
.navi > li{
   line-height: 30px;      /* 줄간격 */
   /*text-align: center;       텍스트 정렬 */    
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
}      /* 텍스트 정렬 */    


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
/*    position: fixed; */            
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

ul{
   list-style-type: none;
   margin-left: -30px;
}

.cos{
   margin-top: 9.5%;
   margin-left:13.5%;
}

.map{
   width: 30px;
   height: 30px;
   background-image: url("resources/images/park/map.png");
   background-repeat: no-repeat;
   margin-right: 9px;
   margin-left : 7px;
   background-size: contain;
   display: inline-block
}

.icon_nm{
   display: inline-block;
   padding: 5px;
}

.right{
   width: 30px;
   height: 30px;
   background-image: url("resources/images/park/right.png");
   background-repeat: no-repeat;
   margin-right: 9px;
   margin-left : 7px;
   background-size: contain;
   display: inline-block;
}

.m1 .m2 .m3 .m4 {
    display: inline-block;
}

#DtlCon{
   display : inline-block;
   width:600px; 
}

#map {
   display : inline-block;
}

.com_map {
   margin-left: 200px;
   margin-top: 100px;
   position: relative;
}

/* 표 */
#table {
   width: 85%;
   height : 50%;
   border-collapse: collapse;
   margin-left: auto;
   margin-right: auto;
   margin-bottom:50px;;
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
   white-space : nowrap;
   /* position: absolute; */
   right: 14%;
   top: 255px;
   z-index: -999;
}

#backBtn{
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
                        <div class="dv">${param.SOUTH_NORTH_DIV}</div>
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
   <div class="com_map">
   <div id="DtlCon"></div>
   <div id="map" style="width:500px;height:400px;"></div>
   </div>
    </main>
   <div class="comm_area">
   <div class="write_area">
   <input type="hidden" name="gbn" value="c">
   <input type="hidden" name="mno" value="${sMNo}">
   <div class="comm_sel"><p>댓글</p></div>
            <div class="topbox">
            <div id="rateBox"></div>  
            <form action="#" id="walkForm" method="post">     
            <input type="hidden" name="no" value="${param.no}">        
               <div class="comm_wrap">
                  <input type="text" class="menuBox" name="comm" id="comm" placeholder="내용을 입력해주세요">
               </div>
               <div class="btn_wrap">
                  <input type="button" value="작성" class="action_btn" id="writeBtn">
                  <input type="button" value="목록으로" class="back_btn" id="backBtn">
                  <input type="hidden" value="수정" class="action_btn2" id="updateBtn">
                  <input type="hidden" value="취소" class="action_btn2" id="cancleBtn">
               </div>
              </form>
            </div>
            </div>
   <div class="walk_list_wrap">
   <c:choose>
      <c:when test="${fn:length(list) eq 0}">
         <div class="data_req_wrap">
            <div class="data_req">데이터가 없습니다.</div>
         </div>
      </c:when>
      <c:otherwise>
         <c:forEach var="data" items="${list}">
            <div class="ob_data">
               <div class="user_info">
                  <div class="user_name">${data.MBER_NUM}</div>
               </div>
               <div class="con_info">
                  <div class="con">${data.CON}</div>
               </div>
               <div class="btn_wrap" no="${data.O_NO}">
               <c:if test="${data.MBER_NUM eq sMNo}">
                  <input type="button" value="수정" class="action_btn2" id="updateBtn" />
                  <input type="button" value="삭제" class="action_btn2" id="deleteBtn" />
               </c:if>
               </div>
            </div>
         </c:forEach>
      </c:otherwise>   
   </c:choose>
   </div>
            </div>
    
    
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
   /* function callKakaoAPI(X,Y){
      console.log(X,Y);
      var geocoder = new kakao.maps.services.Geocoder(), // 좌표계 변환 객체를 생성합니다
       wtmX = X , // 변환할 WTM X 좌표 입니다
       wtmY = Y; // 변환할 WTM Y 좌표 입니다
   
      // WTM 좌표를 WGS84 좌표계의 좌표로 변환합니다
      geocoder.transCoord(wtmX, wtmY, transCoordCB, {
          input_coord: kakao.maps.services.Coords.WTM, // 변환을 위해 입력한 좌표계 입니다
          output_coord: kakao.maps.services.Coords.WGS84 // 변환 결과로 받을 좌표계 입니다 
      });
   
   // 좌표 변환 결과를 받아서 처리할 콜백함수 입니다.
   function transCoordCB(result, status) {
   
       // 정상적으로 검색이 완료됐으면 
       if (status === kakao.maps.services.Status.OK) {
          
          console.log(result[0].y);
          console.log(result[0].x);
          
          var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
           mapOption = {
               center: new kakao.maps.LatLng(result[0].y, result[0].x), // 지도의 중심좌표
               level: 3 // 지도의 확대 레벨
           };
          
          // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
          var map = new kakao.maps.Map(mapContainer, mapOption);
   
           // 마커를 변환된 위치에 표시합니다
           var marker = new kakao.maps.Marker({
               position: new kakao.maps.LatLng(result[0].y, result[0].x), // 마커를 표시할 위치입니다
               map: map // 마커를 표시할 지도객체입니다
           })
       }
   }
   } */
   
   
    </script>
</body>
</html>