<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수리문의 상세 페이지</title>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#ListBtn").on("click", function(){
		$("#actionForm").attr("action", "AfterServiceList");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action", "ASUpdate");
		$("#actionForm").submit();
	});
	
	$("#deleteBtn").on("click", function() {
		if(confirm("삭제하시겠습니까?")) {
			var params = $("#actionForm").serialize();
			$.ajax({
				url: "ASDeleteAjax",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					if(res.result == "success") {
						location.href = "AfterServiceList";
					} else if(res.result == "failed") {
						alert("삭제에 실패하였습니다.");
					} else {
						alert("삭제 중 문제가 발생하였습니다.");
					}
				},
				error: function(request, status, error) {
					console.log(error);
				}
			});
		}
	});
}
</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="page" value="${param.page}">
	<input type="hidden" name="title" value="${param.title}">
</form>
<div>제목 : ${data.TITLE}</div>
<div>고유번호 : ${data.BK_SERIAL_NUM}</div>
<div>대여소 위치 : ${data.RENTSH_LOC}</div>
<div>작성자 : ${data.ID}</div>
<div>
	내용<br>
	${data.CON}
</div>
<c:if test="${!empty data.ATACH}">
<div>
	<c:set var="len" value="${fn:length(data.ATACH)}"></c:set>
	첨부파일 :
	<a href="resources/upload/${fn:replace(fn:replace(data.ATACH, '[', '%5B'), ']', '%5D')}"
		download="${fn:substring(data.ATACH, 20, len)}">
	${fn:substring(data.ATACH, 20, len)}
	</a>
</div>
</c:if>
<c:if test="${data.M_NO eq sMNo}"><!-- 수정 -->
	<input type="button" value="수정" id="updateBtn">
	<input type="button" value="삭제" id="deleteBtn">
</c:if>
<input type="button" value="목록" id="ListBtn">
</body>
</html>