<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수리문의 작성</title>
<style>
#att {
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
	
	//엔터키 폼 실행 차단
	$("#addForm").on("keypress", "input", function(event) {
		if(event.keyCode == 13) { //엔터키가 눌렸을 때
			return false; // form 실행 이벤트를 하지 않음
		}
	});
	
	$("#ListBtn").on("click", function(){
	$("#goForm").submit();
	});
	
	//첨부파일버튼
	$("#attach").on("click", function() {
		$("#att").click();
	});
	
	//첨부파일 선택 시
	$("#att").on("change", function() {
		//마지막 \에서 다음 글자부터 자르겠다 => 파일명만 나옴
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") + 1));
	});
	
	$("#addBtn").on("click", function() {
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
			//위에서 필터처리 먼저 한 후 success, error처리
			var fileForm = $("#fileForm");
			fileForm.ajaxForm({
				success : function(res) {
					if(res.result == "SUCCESS") {
						//업로드 파일명 적용
						if(res.fileName.length > 0) { //업로드한 파일이 있는 경우
							$("#dbFile").val(res.fileName[0]);
						}
						//글 저장
						var params = $("#addForm").serialize();
						$.ajax({
							url: "ASAddAjax",
							type: "post",
							dataType: "json",
							data: params,
							success: function(res) {
								if(res.result == "success") {
									location.href = "AfterServiceList";
								} else if(res.result == "failed") {
									alert("작성에 실패하였습니다.");
								} else {
									alert("작성 중 문제가 발생하였습니다.");
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
<form action="AfterServiceList" method="post" id="goForm">
	<input type="hidden" name="page" value="${param.page}">
</form>
<form action="#" id="addForm" method="post">
	제목 : <input type="text" id="title" name="title" /><br>
	고유번호 : <input type="text" id="serialNum" name="serialNum" /><br>
	대여소 위치 : <input type="text" id="rentsh_loc" name="rentsh_loc" /><br>
	작성자 : ${sMNm}<input type="hidden" value="${data.m_num}" name="id" /><br> <!-- 수정 -->
	<%-- <input type="hidden" value="${data.m_num}" name="m_num" /> --%>
	<textarea rows="5" cols="5" id="con" name="con"></textarea><br/>
	첨부파일 : <input type="button" id="attach" value="첨부파일선택" /><br>
	<span id="fileName"></span>
	<input type="hidden" name="dbFile" id="dbFile" /><!-- DB저장용 -->
</form>
<input type="button" value="등록" id="addBtn" />
<input type="button" value="목록" id="ListBtn" />
</body>
</html>