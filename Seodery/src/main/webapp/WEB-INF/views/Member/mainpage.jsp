<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <link rel="stylesheet" href="resources/css/login/default.css">
    <link rel="stylesheet" href="resources/css/login/login.css">
     <link rel="stylesheet" href="resources/css/login/mainpage.css">
   
	<script src="resources/script/login/login.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

	
			<style type="text/css">
		.main-body{
			height: 100%;
			background: #eee;
		}
		</style>
<script type="text/javascript">
   function linkGo(url) {
      location.href = url
   }
</script>
</head>
<body>
 <div id="wrapper">
<!--   <div id="wrapper"></div> -->
        <header id="header">
         <div class="logo">
            <img src="resources/images/login/logo.png" alt="">
         </div> 
            <c:choose>
               <c:when test="${empty sMNo }">
                  <div class="login">
                     <input type="button" value="로그인" id="LoginBtn" onclick="linkGo('login')"/>
                  </div>
               </c:when>
               <c:otherwise>
                  <div class="logout">
                     ${sMNm }님 환영합니다.
                     <div class="pencil"></div>
                     <input type="button" value="로그아웃" id="LogoutBtn" onclick="linkGo('logout')"/>
                  </div>
               </c:otherwise>
            </c:choose>
         
         <div class="navcon">
            <nav id="nav">
               <div class="gnb_subbox"></div>
               <div class="gnb">
                  <ul class="navi">
                     <!-- <div class="dvbox">
                        <div class="dv"></div>
                        <div class="dv"></div>
                        <div class="dv"></div>
                     </div> -->
                     <li class="sub Park">공원</a>   
                        <ul class="gnb_sub">
                           <li><a href="parkList">공원 찾기</a></li>
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
   <div class="sival">
  <div class="content">
            <div class="Notice">
            <br/>
            <h2>공지사항</h2>
               <ul>
                  <li class="li">제목 : 공지내용1 2021-00-00</li>
                  <li class="li">제목 : 공지내용2 2021-00-00</li>
                  <li class="li">제목 : 공지내용3 2021-00-00</li>
                  <li class="li">제목 : 공지내용4 2021-00-00</li>
               </ul>
         </div>
        </div>
        
        <aside class="right-side">
            <div class="parkB">
            <br/>
            <h2>공원 BEST 5</h2>
               <ul>
                  <li class="li">1. 공원명 : 하늘공원</li>
                  <li class="li">2. 공원명 : 보라매공원</li>
                  <li class="li">3. 공원명 : 호수공원</li>
                  <li class="li">4. 공원명 : 서울숲</li>
               </ul>
         </div>
        </aside>
        </div>
        
        <!-- <section class="content2"> -->
         <!-- 클래스명은 변경하면 안 됨 -->
         <div class="swiper-container">
            <div><h2>추억저장</h2></div>
            <div class="swiper-wrapper">
               <div class="swiper-slide"><img src="resources/images/login/logo.png"></div>
               <div class="swiper-slide"><img src="resources/images/login/book.png"></div>
               <div class="swiper-slide"><img src="resources/images/login/kids.jpg"></div>
               <div class="swiper-slide"><img src="resources/images/login/ice.jpg"></div>
               <div class="swiper-slide"><img src="resources/images/login/logo.png"></div>
               <div class="swiper-slide"><img src="resources/images/login/book.png"></div>
               <div class="swiper-slide"><img src="resources/images/login/kids.jpg"></div>
               <div class="swiper-slide"><img src="resources/images/login/logo.png"></div>
               <div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0708.jpg"></div>
               <div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0231.jpg"></div>
               <div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0580.jpg"></div>
               <div class="swiper-slide"><img src="resources/images/login/logo.png"></div>
               <div class="swiper-slide"><img src="resources/images/login/book.png"></div>
               <div class="swiper-slide"><img src="resources/images/login/kids.jpg"></div>
               <div class="swiper-slide"><img src="resources/images/login/logo.png"></div>
            </div>
         
            <!-- 네비게이션 -->
               <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
               <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
         
            <!-- 페이징 -->
               <div class="swiper-pagination"></div>
         </div>
      <!-- </section> -->   
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
   
    <script type="text/javascript" src="resources/script/jquery/swiper.js"></script>
   
</body>
</html>