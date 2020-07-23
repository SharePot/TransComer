<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SharePot - 신고하기</title>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>

	<div id="reportSection">
		<p>신고하기</p>
		<p>허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니, 유의하시어 신중하게 신고해 주세요.</p>
		<hr>
		<form action="rinsert.tc" method="post" name="reportForm">
			<label>작성자 : </label>
			<input type="text" value="${loginUser.memberId}" id="reporter"  name="reporterMemberId" readonly>
			<br>
			<label>신고자 : </label>
			<input type="text" readonly id="target" name="targetMemberId" >
			<br>
			<label>신고사유 : </label>
			<input type="text" name="reportContent" id="content">
			<br>
			<input type="submit" id="reportBtn" value="신고하기" onclick="window.close()">
			<input type="button" id="reportClose" value="창닫기" onclick="window.close()">
		</form>
	</div>

	<script>
		document.getElementById("target").value =
		opener.document.getElementById("responseWriter").value;
	</script>
	
</body>
</html>