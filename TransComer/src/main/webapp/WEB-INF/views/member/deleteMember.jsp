<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>SharePot</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<style>
html {
	background-color: white
}

#contents {
	width: auto;
	float: none;
	height: auto !important;
	line-height : 35px;
}

.p {
	padding-left: 10px;
	text-align: center;
}

#p {
	text-indent: 440px;
	font-size: 15px;
}

#p1 {
	font-size: 25px;
}
#passwordRe{
	border: 1px solid gray;
	border-radius: 15px;
	width: 50%;
}
#selectBox{
	border-radius: 15px;
}

#deleteBtn, #resetBtn {
	background: skyblue !important;
}

</style>
</head>
<c:import url="../common/menuBar.jsp" />
<body class="homepage is-preload">
	<div id="page-wrapper">
		<!-- Main -->
		<section id="main">
			<br>
			<br>
			<div>
				<input type="hidden" id="memberPw" value="${loginUser.memberPw }">
				<p id="p1" style="font-size: 30px; text-align: center; font-weight: 900">회원 탈퇴 안내</p>
			</div>
			<div id="contents">

				<p class="p">회원 탈퇴 시 가입 당시 기록되었던 모든 개인정보는 삭제됩니다. <br>
				또한 가지고 계신 포인트는 재사용 및 복구가 불가능합니다.<br>
				모두 숙지 부탁드리고 신중한 탈퇴를 진행해주시기 바랍니다.<br>
				탈퇴를 원하시면 비밀번호를 입력 한 후에 탈퇴를 진행해주세요.</p>
			</div>

				<input type="hidden" id="memberId" value="${loginUser.memberId }">
				<div style="text-align: center;">
					<label>비밀번호</label>&nbsp;&nbsp;
						<input type="password" id="passwordRe" placeholder="   비밀번호를 입력해주세요." style="width: 20%;">
					<br><br>
					<p id="pwError"></p>
				</div>
				<div style="text-align: center;">
					<button type="reset" id="resetBtn">취소</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<c:url var="delete" value="memberDelete.tc">
						<c:param name="memberId" value="${loginUser.memberId }"/>
					</c:url>
					<button name="submitBtn" id="deleteBtn" href="${delete }">탈퇴</button>
				</div>
		</section>

		<br>
		<br>
	</div>
	
	<script>
	
		$("#deleteBtn").click(function() {
			
			if ($("#passwordRe").val() == $("#memberPw").val()) {
				
				var result = window.confirm("SharePot을 탈퇴하시겠습니까?")
				if (result) {
					return true;
				}
				
			} else {
				
				$("#pwError").html("비밀번호가 일치하지 않습니다.").css("color", "red").show();
				return false;
				
			}
			
		});
	
	</script>
	
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<link rel="stylesheet" href="assets/css/main.css" />

</body>
</html>