<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<style type="text/css">
#att {
	display: none;
}
.hide_btn {
	display: none;
}
</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace("con", {
		resize_enabled : false, //resize_enabled : 마우스로 크기 조절하는거
		language : "ko",
		enterMode : "2" //enterMode : 엔터를 줄바꿈으로 쓰겠다.
	});
	
	$("#ListBtn").on("click", function(){
		$("#actionForm").attr("action", "AfterServiceList");
		$("#actionForm").submit();
	});
	
	//첨부파일버튼
	$("#attach").on("click", function() {
		$("#att").click();
	});
	
	//첨부파일 선택 시
	$("#att").on("change", function() {
		//마지막 \에서 다음 글자부터 자르겠다 => 파일명만 나옴
		$("#filename").html($(this).val().substring($(this).val().lastIndexOf("\\") + 1));
	});
	
	//첨부파일 삭제 버튼
	$("#fileDelBtn").on("click", function() {
		$("#filename").html(""); //사용자에게 보여지는 파일명
		$("#dbFile").val(""); //DB에 올라갈 파일명
		$("#attach").attr("class", ""); //첨부파일 선택 버튼 보이기
		$(this).remove(); //첨부파일 삭제 버튼 제거
	});
	
	//수정 버튼
	$("#updateBtn").on("click", function() {
		//ck데이터 중에 con과 관련된 객체에서 데이터를 취득하여 textarea인 con에 값을 넣는다.
		$("#con").val(CKEDITOR.instances['con'].getData());
		if(checkVal("#title")) {
			alert("제목을 입력해주세요.");
			$("#title").focus();
		} else if(checkVal("#serialNum")) {
			alert("고유번호를 입력해주세요.");
		} /* else if(checkVal("#")) {
			alert("대여소 위치를 입력해주세요.");
		}  */else if(checkVal("#con")) {
			alert("수리내용을 입력해주세요.");
		} else {
		var fileForm = $("#fileForm");
			fileForm.ajaxForm({
				success : function(res) {
					if(res.result == "SUCCESS") {
						//업로드 파일명 적용
						if(res.filename.length > 0) { //업로드한 파일이 있는 경우
							$("#dbFile").val(res.filename[0]);
						}
						var params = $("#updateForm").serialize();
						$.ajax({
							url: "ASUpdateAjax",
							type: "post",
							dataType: "json",
							data: params,
							success: function(res) {
								if(res.result == "success") {
									$("#actionForm").submit();
								} else if(res.result == "failed") {
									alert("수정에 실패하였습니다.");
								} else {
									alert("수정 중 문제가 발생하였습니다.");
								}
							},
							error: function(request, status, error) {
								console.log(error);
							}
						});
					} else {
						alert("파일 업로드에 실패하였습니다.");
					}
				},
				error : function(reg, status, error) {
					console.log(error);
					alert("파일 업로드 중 문제가 발생하였습니다.");
				}
			});
			fileForm.submit();
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

</script>
</head>
<body>
<form id="fileForm" name="fileForm" action="fileUploadAjax" method="post" enctype="multipart/form-data">
	<input type="file" name="att" id="att">
</form>
<form action="ASDtl" method="post" id="actionForm">
	<input type="hidden" name="page" value="${param.page}">
	<input type="hidden" name="title" value="${param.title}">
</form>
<form action="#" id="updateForm" method="post">
	제목<input type="text" id="title" name="title"  value="${data.TITLE}"/><br/>
	고유번호 : ${data.BK_SERIAL_NUM}<input type="hidden" name="serialNum" value="${data.BK_SERIAL_NUM}" /><br/>
	작성자 : ${data.ID}<input type="hidden" name="id" value="<%-- ${sMNo} --%>" /><br/>
	<textarea rows="5" cols="5" id="con" name="con">${data.CON}</textarea><br/>
	첨부파일 :
	<c:choose>
		<c:when test="${!empty data.ATACH}">
		<!-- 첨부파일이 있는 경우 버튼을 숨긴다. -->
			<input type="button" value="첨부파일선택" id="attach" class="hide_btn"/>
		</c:when>
		<c:otherwise>
			<input type="button" value="첨부파일선택" id="attach" />
		</c:otherwise>
	</c:choose>
	<c:set var="len" value="${fn:length(data.ATACH)}"></c:set>
	<span id="filename">${fn:substring(data.ATACH, 20, len)}</span><!-- 현재 등록되어있는 파일명 -->
	<c:if test="${!empty data.ATACH}">
		<input type="button" value="첨부파일삭제" id="fileDelBtn" />
	</c:if>
	<input type="hidden" name="dbFile" id="dbFile" value="${data.ATACH}" /><!-- DB저장용 -->
</form>
<input type="button" value="저장" id="updateBtn" />
<input type="button" value="목록" id="ListBtn" />
</body>
</html>