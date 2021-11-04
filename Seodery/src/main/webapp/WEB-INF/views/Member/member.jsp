<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="resources/css/login/member.css">

<style>

</style>
 <script type="text/javascript">
 
//취소 버튼 클릭시 첫화면으로 이동
 function goFirstForm() {
     location.href="MainForm.do";
 }    
 
 // 아이디 중복체크 화면open
 function openIdChk(){
 
     window.name = "parentForm";
     window.open("Member/IdCheckForm.jsp",
             "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
 }

 // 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
 // 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
 // 다시 중복체크를 하도록 한다.
 function inputIdChk(){
     document.userInfo.idDuplication.value ="idUncheck";
 }

</script>
    
</head>
<body>
    <!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
    	
    	<div class="wp1">
	        <br><br>
	        <b>서드리 회원가입</b>
	        <br><br><br>
        </div>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
 <form method="post" action="MemberJoinAction.do" 
                name="userInfo" onsubmit="return checkValue()">


                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="id" maxlength="50">   
                       <input type="button" value="중복확인" onclick="openIdChk()">    
                        <input type="hidden" name="idDuplication" value="idUncheck" >
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="gender" value="남" checked>남
                        <input type="radio" name="gender" value="여" checked>여
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생일</td>
                    <td>
                        <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" >
                        <select name="birthmm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">이메일</td>
                    <td>
                        <input type="text" name="mail1" maxlength="50">@
                        <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <input type="text" name="phone" />
                    </td>
                </tr>
				<tr>
					<td id="title">주소</th>
					<td><input type="text" id="address_kakao" name="address"
						readonly maxlength="50"/></td>
					</td>
				</tr>
				<tr>
					<td id="title">상세 주소</th>
					<td><input type="text" name="address_detail" maxlength="50"/></td>
				</tr>
			</table>
            <br>
            
            <div class="wp2">
            	<input type="submit" value="가입"/>  <input type="button" value="취소">
            </div>
        </form>
    </div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</html>