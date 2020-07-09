<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>SharePot</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<!--<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
         <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
         <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
         <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>-->
<style>
html {
	background-color: white
}

#contents {
	min-height: 400px;
	width: 80%;
	float: left;
}

#contents {
	width: auto;
	float: none;
	min-height: 200px;
	margin-bottom: 10px;
}

.p {
	padding-left: 10px;
	text-align: center;
	/*text-indent: 400px;*/
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
		/*border: none;
		border-top: 0px;
		border-right: 0px;
		border-left: 0px;*/
		/*border-bottom: 0px;*/
	width: 50%;
}
#selectBox{
	border-radius: 15px;
}
</style>
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">

			<!-- Logo -->
			<h1>
				<a href="index.html">SharePot</a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li class="current"><a href="#">Home</a></li>
					<li><a href="#">번역 의뢰</a>
						<ul>
							<li><a href="#">단순 의뢰</a></li>
							<li><a href="#">1:1 의뢰</a></li>
						</ul></li>
					<li><a href="#">번역 공유</a></li>
					<li><a href="#">스터디</a></li>	
					<li><a href="#">Q&amp;A</a></li>
				</ul>
			</nav>
		</section>


		<!-- Main -->
		<section id="main">
			<div>
				<p id="p1"
					style="font-size: 30px; text-align: center; font-weight: 900">
					회원 탈퇴 안내</p>
			</div>
			<div id="contents">

				<p class="p">회원 탈퇴 시 가입 당시 기록되었던 모든 개인정보는 삭제됩니다.</p>
				<p class="p" style="margin-right: 35px;">또한 가지고 계신 포인트는 재사용 및
					복구가 불가능합니다.</p>
				<p class="p" style="margin-right: 25px;">모두 숙지 부탁드리고 신중한 탈퇴를
					진행해주시기 바랍니다.</p>
				<p class="p" style="margin-right: 9px;">탈퇴를 원하시면 비밀번호를 입력 한 후에
					탈퇴를 진행해주세요.</p>
			</div>

			<div style="text-align: center;">
				<label style="margin-right: 2%;">비밀번호</label>
				<input type="password" id="passwordRe"
					placeholder="비밀번호를 입력해주세요." style="width: 20%;">
			</div>
			<br>
			<br>
			<div style="text-align: center;">
				<input type="button" id="resetBtn" value="돌아가기"
					style="width: 120px; height: 40px;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" name="submitBtn"
					value="탈퇴하기" style="width: 120px; height: 40px;">
			</div>
		</section>

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>



