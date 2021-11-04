<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/script/jquery/fxss-rate/rate.css">
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script src="resources/script/jquery/fxss-rate/rate.js"></script>
<!-- <script src="resources/script/jquery/fxss-rate/need/iconfont.js"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c953a065c47d3eb731f9ab037fd520fa&libraries=services,clusterer,drawing"></script>
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
#LoginBtn,#LogoutBtn,.LoginBtn {
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
	margin-left: 0;
	margin-right: auto;
	font-family: '고딕';
	font-size: 1.1rem;
}

table > tr,td{
	
	width: 700px;
}

main > table > tr,td {
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

/* 별점 */

.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

/* 탭버튼 스타일 */
.tab{
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/*탭 버튼 */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
}
/* 마우스 호버시 버튼 색 */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button:active {
  background-color: #ccc;
}

/* 탭 메뉴  */
.tabcontent {
  display: none;
  padding: 6px 12px;
 /*  border: 1px solid #ccc; */
  border-top: none;
  position: relative;
  height: 100%;
  width: 100%;
}

/* 댓글 */

.pc_wrap {
	width: 95%;
	margin: 0px auto;
	border: 1px solid #444444; 
	display: flex;
	margin-left: 0px;
}

/* 댓글 감싸는 div */
.write_area {
	height: 100px;
}

.user_info {
	float : left;
	display: inline-table;
	width: 10%;
	height: 100px;
	vertical-align: top;
}

.user_name {
	display: table-cell;
	width: 100px;
	height: 100px;
	vertical-align: middle;
	text-align: center;
	font-size: 12pt;
}

.write_con_wrap {
	display: inline-block;
	width: 75%;
	height: 100px;
	vertical-align: top;
	margin-top: -18px;
	margin-left: 157px;
}

/*  */

.write_con {
	width: 75%;
	height: 80px;
	resize: none;
	margin: 2px;
	position: absolute;
}

.btn_wrap {
	display: inline-block;
	width: 400px;
	height: 100px;
	vertical-align: top;
	margin-left:80%;
	z-index: 55;
}
#addBtn{
	margin-left: 157px;
    margin-top: -16px;
    height: 86px;
    width: 69px;
    background-color: rgb(3, 104, 115);
    box-shadow: 0 1px 1px 0 rgb(3 104 115);
    color: white;
    font-family: '고딕';
}


.action_btn {
	width: 126px;
	height: 96px;
	margin: 2px;
	position: absolute;
	left: 600px;
}

.action_btn2 {
	/* width: 71px;
	height: 96px;
	margin: 2px;
	 */
    width: 71px;
    height: 44px;
    margin-left: 157 px;
    margin-top: -16 px;
    height: 86 px;
    width: 69 px;
    background-color: rgb(3, 104, 115);
    box-shadow: 0 1px 1px 0 rgb(3 104 115);
    color: white;
    font-family: '고딕';
}

.write_area .action_btn2 {
	display:none;
}

.login_req_wrap {
	display: inline-table;
	width: 800px;
	height: 100px;
}

.login_req {
	display: table-cell;
	width: 800px;
	height: 100px;
	vertical-align: middle;
	text-align: center;
	font-size: 12pt;
}

.data_req_wrap {
	display: inline-table;
	width: 800px;
	height: 100px;
	border-top : 1px solid #444444;
	margin-bottom: 5px;
}

.data_req {
	display: table-cell;
	width: 800px;
	height: 100px;
	vertical-align: middle;
	text-align: center;
	font-size: 12pt;
}

.ob_data {
	border-top : 1px solid #444444;
	margin-bottom: 5px;
}

.con_info {
	float: left;
	display: inline-table;
	width: 70%;
	height: 100px;
	vertical-align: top;
}

/* 별점 div */
.con_info2 {
	display: inline-table;
	width: 500px;
	height: 100px;
	vertical-align: top;
}
/* 작성날짜 div */
.con_info3 {
	display: inline-table;
	width: 500px;
	height: 100px;
	vertical-align: top;
}

.con {
	display: table-cell;
	width: 100px;
	height: 100px;
	vertical-align: middle;
	text-align: left;
	font-size: 12pt;
}

.wcbox{
	display: flex;
}

.write_con_wrap{
	justify-content: center;
}


/* 상세보기 이미지 */
.imgbox { 
  float: right;
  width: 40.25%;
  height: 200px;
  padding: 1.5625%;
  margin-top: -360px;
  margin-left: 51%;
}
.imgbox img {
	margin-left: 50%;
	margin-top:50px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	/* if("${param.searchGbn}"!=""){
		$("#searchGbn").val("${param.searchGbn}");
	} */
	gnbSlideInit();
	reloadList();
	//reloadMap();
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.5501402, 126.9903773), //지도의 중심좌표.
		level: 5 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	
	//로그인 
	   $("#LoginBtn").on("click",function(){
			
		 location.href = "login";
		});  
	
	//댓글 로그인 
	   $(".LoginBtn").on("click",function(){
			
		 location.href = "login";
		});  

	 
	//로그아웃 
	 $("#LogoutBtn").on("click",function(){
		location.href = "logout";
	}); 
	
	/* table 공원번호 숨기기 */
	$("#hidN").attr('style',"display:none;");
	/* 공원 이름 css */
	$("#PnameC").attr('style',"font-size:38px;font-weight:600;");
	/* 공원 전화번호 */
	$("#PphonC").attr('style',"font-size:20px;");
	$("#PphonC img").attr('style',"margin-right:28px;margin-left:7px;height:20px;margin-top:8px;");
	/* 공원 주소 */
	$("#PaddrC").attr('style',"font-size:20px;");
	$("#PaddrC img").attr('style',"width:30px; height:30px;margin-top:5px;margin-right:28px;");
	$("#PaddrC span").attr('style',"font-weight:600;");
	/* 개원일 */
	$("#PopenC").attr('style',"font-size:20px;");
	$("#PopenC img").attr('style',"width:30px; height:35px;margin-top:5px;margin-right:28px;padding-bottom:0px;");
	$("#PopenC span").attr('style',"font-weight:600;");
	/* 주요시설 */
	$("#PfaciC").attr('style',"font-size:20px;");
	$("#PfaciC img").attr('style',"width:30px; height:35px;margin-top:5px;padding-bottom:0px;margin-right:28px;");
	$("#PfaciC span").attr('style',"font-weight:600;");
	/* 주요식물 */
	$("#PplantC").attr('style',"font-size:20px;");
	$("#PplantC img").attr('style',"width:30px; height:35px;margin-top:5px;padding-bottom:0px;margin-right:28px;");
	$("#PplantC span").attr('style',"font-weight:600;");
	//목록에서 수정버튼을 클릭했을 때 
		$(".pc_list_wrap").on("click","#updateBtn",function(){
					//updateBtn > btn_wrap > ob_data < coninfo < con
			var con = $(this).parent().parent().children(".con_info").children(".con").html();
			var cNum = $(this).parent().parent().find(".user_info").find("input[name='Cnum']")[0].value;
			$("#wcform").find("input[name='Cnum']").val(cNum);
			
			$(".write_con").val(con);
			
			var mo = $(this).parent().attr("mo");
			
			$("#mo").val(mo);
			
			$(".write_area .action_btn").hide();
			$(".write_area .action_btn2").show();
		});
	
	/* 수정 -> 취소버튼을 클릭했을때 이벤트  */
		$(".write_area #cancelBtn").on("click", function(){
			$(".write_con").val("");
			
			$("#mo").val("");
			
			$(".write_area .action_btn").show();
			$(".write_area .action_btn2").hide();
		});
	
	//updBtn 글 수정 
		$(".write_area").on("click","#updBtn",function(){
			 if(checkVal("#con")) {
					alert("내용을 입력해 주세요.");
					$(".write_con").focus();
				} else {
					$("#wcform").attr("action", "parkupdate");
					$("#wcform").submit();
			};
		});
	
// 댓글 목록 생성
 function makeCommentList(list) {
	
	var strHtml = "";
	
	var sMNm =  '${sMNm}';
	var sMNo =  '${sMNo}';
	
	for(var i=0; i<list.length; i++) {
		var data = list[i];
		
		strHtml += "<div class='ob_data'>";
		strHtml += 		"<div class='con-info2'>";
		strHtml += 			"<div class='con-star' data-rate-value='" + data.SRATING + "'></div>";
		strHtml += 		"</div>";
		strHtml += 		"<div class='user_info'>";
		strHtml += 			"<input type='hidden' name='Cnum' value='" + data.COMM_NUM + "'>";
		strHtml += 		"<div class='user_name' name='mo'>" + sMNm + "</div>";
		strHtml += 		"</div>";
		strHtml += 		"<div class='con_info'>";
		strHtml += 			"<div class='con' name='con'>" + data.CON + "</div>";
		strHtml += 		"</div>";
		strHtml += 		"<div class='con-info3'>";
		strHtml += 			"<div class='con-date'>" + data.DT + "</div>";
		strHtml += 		"</div>";
		
		strHtml += 		"<div class='btn_wrap' no='" + data.P_IDX + "' mo='" +sMNm + "' name='no' Cnum='" + data.COMM_NUM + "'>";
		
		// 로그인한 유저만 사용할 수있게 
		if(data.MBER_NUM == sMNo) {
			strHtml += 		"<input type='button' value='수정' class='action_btn2' id='updateBtn'/>";
			strHtml += 		"<input type='button' value='삭제' class='action_btn2' id='deleteBtn'/>";
		}
		strHtml += 		"</div>";
		strHtml += 	"</div>";
		
	}
	
	$(".pc_list_wrap").html(strHtml);
 }
	
//삭제
$(".pc_list_wrap").on("click","#deleteBtn",function(){
	
	if(confirm("삭제하시겠습니까?")){
		var cNum = $(this).parent().parent().find(".user_info").find("input[name='Cnum']")[0].value;
		$("#wcform").find("input[name='Cnum']").val(cNum);
		
		var params = $("#wcform").serialize();	//serialize() : form의 데이터를 문자열로 변환 
		
		$.ajax({	//jquery의 ajax함수 호출 
			url: "parkDelete", //접속 주소
			type: "post",	//전송 방식
			dataType:"json",	//받아올 데이터 형태 
			data : params,	//보낼 데이터(문자열 형태)
			success : function(res){	//성공(ajax통신 성공) 시 다음 함수 실행 
				if(res.result == "success"){
					console.log("res", res.commentList);
					makeCommentList(res.commentList);
				}else if(res.result == "failed"){
					alert("삭제에 실패하였습니다.");
				}else {
					alert("삭제 중 문제가 발생했습니다.");
				}
			},
			error: function(request, status, error){	//실패 시 다음 함수 실행 
				console.log(error);
			}
		});
	}
			
// 			if(confirm("삭제하시겠습니까?")) {
// 				var cNum = $(this).parent().parent().find(".user_info").find("input[name='Cnum']")[0].value;
				
// 				$("#wcform").find("input[name='Cnum']").val(cNum);
// 				$("#wcform").attr("action", "parkDelete");
// 				$("#wcform").submit();
// 					//(#no).val()
// 			};
}); 
	
	
	/* $("#pagingWrap").on("click","span",function(){
		//기존의 값을 #oldTxt에 저장해놓고 페이지를 넘기면 searchTxt에 값이 기존에 값이라서 페이지만 넘어가는것
		//$("#searchTxt").val($("#oldTxt").val()); 	
		$("#page").val($(this).attr("page"));
		
		$("#wcform").attr("action", "parkDtl");
		$("#wcform").submit();
	}); */
		
	//addBtn
	$(".write_area").on("click","#addBtn",function(){
		 if(checkVal("#con")) {
				alert("내용을 입력해 주세요.");
				$(".write_con").focus();
			} else {
				var starNum = $("#rateBox")[0].innerText;
				console.log("별점 값>>>>>>>>" + starNum);
				
				
				console.log("addr>>" + $(this).parents('tr').find('td[name="paddr"]').text());
				
				$("input[name='srating']").val(starNum.substr(0,1));
				$("#wcform").attr("action", "parkadd");
				$("#wcform").submit();
		};
	});
	
	$(".pc_list_wrap .con-star").each(function() {
		$(this).rate({
			// 0：svg  1：Font class  2：Unicode
			type: 0,
			
			// the number of stars
			length: 5,
			
			value: $(this).attr("data-rate-value"),
			
			half:false,
			
			// supports decimal?
			decimal:true,
			
			// is readonly?
			readonly:true,
			
			// shows the current rating value on hover
			hover:false,
			
			// shows rating text
			text:true,
			
			// an array of rating text
			textList: ['1점','2점','3점','4점','5점'],
			// color
			theme:'#FFB800',
			// text/star size
			size:'20px',
			// space between stars
			gutter:'3px',
			// default CSS classes
			selectClass:'fxss_rate_select'
		});
	});
	
	

	$("#rateBox").rate({
		// 0：svg  1：Font class  2：Unicode
		type: 0,
		
		// the number of stars
		length: 5,
		
		// initial value
		value: 0,
		
		// allows half star
		half:false,
		
		// supports decimal?
		decimal:true,
		
		// is readonly?
		readonly:false,
		
		// shows the current rating value on hover
		hover:true,
		
		// shows rating text
		text:true,
		
		// an array of rating text
		textList: ['1점','2점','3점','4점','5점'],
		// color
		theme:'#FFB800',
		// text/star size
		size:'20px',
		// space between stars
		gutter:'3px',
		// default CSS classes
		selectClass:'fxss_rate_select',
		
		incompleteClass:'',
		
		customClass:'',
		callback:function(object){
		    console.log(object)
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


//데이터 취득
function reloadMap(){
	
	console.log("reload ##########");
	var params = $("#actionForm2").serialize();
	$.ajax({	//jquery의 ajax함수 호출  
		url : "http://openapi.seoul.go.kr:8088/5576534466616b6432324c6b586b48/json/GetParkInfo/1/982", 
		type: "get",	//전송 방식
		dataType:"json",	//받아올 데이터 형태 
		async: false,
		data: params,
// 		data : sendData,	//보낼 데이터(문자열 형태)
		success : function(res){	//성공(ajax통신 성공) 시 다음 함수 실행 
			console.log("res >>>>" +res);
			makeMakers(JSON.parse(res.resData).GetParkInfo.row); // 좌표목록 만듬
			//drawList(res.list);
			//drawPaging(res.pb);
		},
		error: function(request, status, error){	//실패 시 다음 함수 실행 
			console.log(request);
			console.log(error);
		}
	});
}
//데이터 취득
 function reloadList(){
	
	var params = $("#actionForm").serialize();
 	$.ajax({	//jquery의 ajax함수 호출  
 		url : "apiDtl", 
		type: "get",	//전송 방식
 		dataType:"json",	//받아올 데이터 형태 
 		async: false,
 		data: params, 
 		success : function(res){	//성공(ajax통신 성공) 시 다음 함수 실행 
 			console.log(res);
 			makeTable(JSON.parse(res.resData));
 			//drawList(res.list);
 			//drawPaging(res.pb);
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
          $data += '<tr id="hidN"><td>' + rows[idx].P_IDX + '</td><tr id="PnameC"><td>' + rows[idx].P_PARK + '</td></tr><tr id="PphonC"><td>'+'<img src="resources/images/park/phone-call.png" width="20px;">'+rows[idx].P_ADMINTEL 
          + '</td></tr><tr id="PaddrC"><td>'+'<img src="resources/images/park/location.png">' + '<span>'+"공원 주소 : "+ '</span>'+ rows[idx].P_ADDR + '</tr></td><tr id="PopenC"><td>'+ '<img src="resources/images/park/right.png">' + '<span>'+"개원일 : "+'</span>' + rows[idx].OPEN_DT + '</td></tr><tr id="PfaciC"><td>' 
          + '<img src="resources/images/park/right.png">' +'<span>' +"주요 시설 : "+'</span>' + rows[idx].MAIN_EQUIP 
          + '</td></tr><tr id="PplantC"><td>'+'<img src="resources/images/park/right.png">' + '<span>'+"주요 식물 : "+'</span>' + rows[idx].MAIN_PLANTS + '</td></tr>';
          
       }
      
      $("#table").html($data);
      $(".imgbox").html('<img src=\"' + rows[idx].P_IMG + '\" width="270px;heigt="230px">');
   }
 
 
  /* 탭 메뉴 이벤트 */
	function openTab(evt, tabName) {
		  // Declare all variables
		  var i, tabcontent, tablinks;

		  // Get all elements with class="tabcontent" and hide them
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }

		  // Get all elements with class="tablinks" and remove the class "active"
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace("active", "");
		  }

		  // Show the current tab, and add an "active" class to the button that opened the tab
		  document.getElementById(tabName).style.display = "block";
		  evt.currentTarget.className += " active";
		}

  
  
  /* 페이징 */
/*  function drawPaging(pb){
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
} */
 
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
							<li class="sub Park">공원</a>	
								<ul class="gnb_sub">
									<li><a href="parkList">공원 찾기</a></li>
									<li><a href="parkMap">길 찾기</a></li>
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
									<li><a href="dust">미세먼지 현황</a></li>
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
		
	<main>
		      	<div class="Cpage"><h4>공원 > 공원찾기> ${no}번 공원</h4></div>
			      	<div>
					<form action="#" id="actionForm" method="get">
							<input type="hidden" name="searchGbn"  value="${param.searchGbn}"/>
							<input type="hidden" name="searchTxt"  value="${param.searchTxt}"/>
							<input type="hidden" name="page"  value="${param.page}"/>
							<input type="hidden" name="no"  value="${param.no}"/>
							<input type="hidden" name="mo"  value="${sMNo}"/>
							<input type="hidden" name="name"  value="${param.name}"/>
							<input type="hidden" name="addr"  value="${param.addr}"/>
							<input type="hidden" name="phon"  value="${param.phon}"/>
							<input type="hidden" name="Cnum"  value="${param.Cnum}"/>
					</form>
					</div>
				<div>
			            <table>
			            	<thead>
								
							</thead>
				               <tbody id="table">
				               
				               </tbody>
				            </table>
				</div>
				               <div class="imgbox"></div>   
				
				<div class="tab">
				  <button class="tablinks" onclick="openTab(event, 'Comm')">댓글</button>
				  <button class="tablinks" onclick="openTab(event, 'parklot')">주차장</button>
				</div>
				
				<section id="Comm" class="tabcontent">
					<h2>댓글</h2>	
					<div class="pc_wrap">
						<div class="write_area">
							<div id="rateBox"></div>
								<form action="#" id="wcform" method="post">
							<c:choose>
								<c:when test="${empty sMNo}">
								<!-- 비 로그인 시 -->
									<div class="login_req_wrap">
										<div class="login_req">작성 시 로그인이 필요합니다. <input type="button" value="로그인" class="LoginBtn"/></div>
									</div>
								</c:when>
								<c:otherwise>
								<input type="hidden" id="mo" name="mo" value="${sMNo}"/>
 								<%-- <input type="hidden" id="page" name="page" value="${page}"/>  --%>
								<input type="hidden" name="page"  value="${param.page}"/>
								<input type="hidden" name="no"  value="${param.no}"/>
								<input type="hidden" name="name"  value="${param.name}"/>
								<input type="hidden" name="addr"  value="${param.addr}"/>
								<input type="hidden" name="phon"  value="${param.phon}"/>
								<input type="hidden" name="Cnum"/>
								<input type="hidden" name="srating"/>
								<div class="wcbox">
										<div class="user_info">
											<div class="user_name">${sMNm}</div>
										</div>
										<div class="write_con_wrap">
											<textarea class="write_con" id="con" name="con">${data.CON}</textarea>
										</div>
										<div class="btn_wrap" no="${no}" mo="${sMNo}" name="${name}" addr="${addr}" phon="${phon}">
											<input type="button" value="저장" class="action_btn" id="addBtn"/>
											<input type="button" value="수정" class="action_btn2" id="updBtn"/>
											<input type="button" value="취소" class="action_btn2" id="cancelBtn"/>
										</div>
										</c:otherwise>
								</c:choose>
									</form>
								</div>
						</div>
					</div>
					
					
					<div class="pc_list_wrap">
					<c:choose>
						<c:when test="${fn:length(list) eq 0}">
						<!-- 데이터 없을 시 -->
							<div class="data_req_wrap">
								<div class="data_req">데이터가 없습니다.</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="data" items="${list}">
								<div class="ob_data">
										<div class="con-info2">
											<div class="con-star" data-rate-value="${data.SRATING}"></div>
										</div>
										<div class="user_info">
										<input type="hidden" name="Cnum" value="${data.COMM_NUM}">
											<div class="user_name" name="mo">${sMNm}</div>
										</div>
										<div class="con_info">
											<div class="con" name="con">${data.CON}</div>
										</div>
										<div class="con-info3">
											<div class="con-date">${data.DT}</div>
										</div>
								<div class="btn_wrap" no="${data.P_IDX}" mo="${sMNo}" name="no" Cnum="${data.COMM_NUM}">
									<!-- 로그인한 유저만 사용할 수있게 -->
									<c:if test="${data.MBER_NUM eq sMNo}">
										<input type="button" value="수정" class="action_btn2" id="updateBtn"/>
										<input type="button" value="삭제" class="action_btn2" id="deleteBtn"/>
									</c:if>
								</div>
							</div>
							</c:forEach>
					     </c:otherwise>
					</c:choose>
					</div>
						<div class="paging_wrap"></div>
				</section>
				
				
				
				
				<section id="parklot" class="tabcontent">
					<h2>주차장</h2>
					<form action="#" id="actionForm2" method="get">
							<input type="hidden" name="page"  value="${param.page}"/>
							<input type="hidden" name="no"  value="${param.no}"/>
					</form>
					<div id="map" style="width:600px;height:400px;margin-left:auto;margin-right:auto;"></div>
				</section>
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