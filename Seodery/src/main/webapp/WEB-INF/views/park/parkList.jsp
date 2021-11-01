<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	/* border: 1px solid black; */
	width: 100%;
	margin-top: 5.5%;
	margin-left: 1.5%;
	font-family: '고딕';
	font-weight: 900;
}

/* 상세보기 버튼 */
#DtlBtn {
	/* border : none; */
	border-radius: 5px;
	background-color:rgb(3, 104, 115);
	font-size: 1.1rem;
	color : white;
	font-family: '고딕';
	cursor: pointer;
	padding: 4px 17px 4px 17px;
	box-shadow:  0 1px 1px 0 rgb(3, 104, 115);
}



/* 표 */
#table {
	/* width: 85%;
	height : 50%; */
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
	font-family: '고딕';
	font-size: 1.1rem;
}


main > table > tr,td {
	border-top: 1px solid black;
}

th {
	padding: 5px;
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

.paging_wrap{
	margin-top : 5%;;
	margin-left: 40%;
}

</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	/* if("${param.searchGbn}"!=""){
		$("#searchGbn").val("${param.searchGbn}");
	} */
	reloadList();
	 //글작성
	/* $("#addBtn").on("click",function(){
		$("#searchTxt").val($("#oldTxt").val());	//취소했을시 검색어유지
		
		$("#actionForm").attr("action","testABAdd");
		$("#actionForm").submit();
	}); */
	
	//로그인 
	/* $("#loginBtn").on("click",function(){
			$("#loginForm").attr("action","logins")
			$("#loginForm").submit()
		}) */
	 
	 
	//로그아웃 
	/* $("#logoutBtn").on("click",function(){
		location.href = "testLogout";
	}); */
	
	//검색
	/* $("#searchBtn").on("click",function(){
		$("#oldTxt").val($("#searchTxt").val());
		$("#page").val("1");
		
		reloadList();
	}); */
	
	//검색창 엔터치면 검색이 되게 한다. 
	/* $("#searchTxt").on("keypress",function(event){
		if(event.keyCode ==13 ){
			$("#searchBtn").click();
			return false;
		}
	}); */
	
	//페이징
	 $(".paging_wrap").on("click","span",function(){
		 $("#page").val($(this).attr("page"));
		 /* $("#searchTxt").val($("#oldTxt").val());  */
		
		reloadList();
	}); 
	
	//상세보기 버튼을 클릭했을 때 이벤트 
	 $("tbody").on("click", "input", function(){
		console.log("no >>" + $(this).parents('tr').find('td[name="pIdx"]').text());
		console.log("name>>" + $(this).parents('tr').find('td[name="pname"]').text());
		console.log("addr>>" + $(this).parents('tr').find('td[name="paddr"]').text());
		console.log("phon>>" + $(this).parents('tr').find('td[name="pphon"]').text());
		//$("#no").attr($(this).parents('tr').find('td[name="pIdx"]').text()); 
		
		$("#no").val($(this).parents('tr').find('td[name="pIdx"]').text());
		$("#name").val($(this).parents('tr').find('td[name="pname"]').text());
		$("#addr").val($(this).parents('tr').find('td[name="paddr"]').text());
		$("#phon").val($(this).parents('tr').find('td[name="pphon"]').text());
		
		$("#actionForm").attr("action","parkDtl");
		$("#actionForm").submit();
	});  
	
	
	
});

/*  var getIndex = function() {
	  var select = document.querySelector('.select');
	  var index = select.rowIndex;
	  alert(index);
	}; */

//데이터 취득
 function reloadList(){
 	/* var sendData = {
 			"KEY" : "58446e7a71616b643239487a427157"
 			,"TYPE" : "json"
 			,"SERVICE" : "SearchParkInfoService"
 			,"START_INDEX" : 1
 			,"END_INDEX" : 10
 	}; */
	var params = $("#actionForm").serialize();
 	$.ajax({	//jquery의 ajax함수 호출  
//  		url: "http://data.seoul.go.kr/dataList/OA-394/S/1/datasetView.do?"
// 					+"KEY=58446e7a71616b643239487a427157&TYPE=json&SERVICE=SearchParkInfoService&START_INDEX=1&END_INDEX=10", //접속 주소
		url : "apitest", 
		type: "get",	//전송 방식
 		dataType:"json",	//받아올 데이터 형태 
 		data: params,
//  		data : sendData,	//보낼 데이터(문자열 형태)
 		success : function(res){	//성공(ajax통신 성공) 시 다음 함수 실행 
 			console.log(res);
 			makeTable(JSON.parse(res.resData));
 			//drawList(res.list);
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
         $data += '<tr><td name="pIdx">'+ rows[idx].P_IDX + '</td><td name="pname">' + rows[idx].P_PARK + '</td><td name="paddr">'+ rows[idx].P_ADDR 
         		+ '</td><td name="pphon">'+ rows[idx].P_ADMINTEL + '</td><td>' + '<input type="button" value="상세보기" id="DtlBtn">' + '</td></tr>';
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
			<div id="logo">
				<form action="#" method="post" id="Loginform" >
					<div class="logout">
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
									<li><a href="http://localhost/Seodery/parkList">공원 찾기</a></li>
									<li><a href="http://localhost/Seodery/parkMap">길 찾기</a></li>
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
									<li><a href="http://localhost/Seodery/dust">미세먼지 현황</a></li>
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
      	<div class="Cpage"><h4>공원 > 공원찾기</h4></div>
      	<div>
	<form action="#" id="actionForm" method="get">
		<select name="searchGbn" id="searchGbn">
			<option value="0">지역</option>
		</select>
		<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}"/>
		<input type="hidden" name="oldTxt" value="${param.searchTxt}"/>
		<input type="hidden" name="page" id="page" value="${page}"/>
		<input type="hidden" name="no" id="no"/>
		<input type="hidden" name="name" id="name"/>
		<input type="hidden" name="addr" id="addr"/>
		<input type="hidden" name="phon" id="phon"/>
		<input type="button" value="검색" id="searchBtn"/>
		<!-- 로그인한 상태라면 작성버튼 -->
		<%-- <c:if test="${!empty sMNo}">
			<input type="button" value="작성" id="addBtn"/>
		</c:if> --%>
	</form>
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