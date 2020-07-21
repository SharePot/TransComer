<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>번역본 공유 승인 반려</title>
<!-- 부트스트랩 4.5.0 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!--해당 템플릿의 css-->
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header"> <!-- Logo -->
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
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!--메인 내용 구역 1-->
					<!--페이지 제목, 아이콘-->
					<div class="d-flex justify-content-center">
						<!--아이콘 -->
						<svg width="2.2em" height="2.2em" viewBox="0 0 16 16"
							class="bi bi-folder-check" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg"> <path
							fill-rule="evenodd"
							d="M9.828 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91H9v1H2.826a2 2 0 0 1-1.991-1.819l-.637-7a1.99 1.99 0 0 1 .342-1.31L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3h3.982a2 2 0 0 1 1.992 2.181L15.546 8H14.54l.265-2.91A1 1 0 0 0 13.81 4H9.828zm-2.95-1.707L7.587 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672a1 1 0 0 1 .707.293z" />
						<path fill-rule="evenodd"
							d="M15.854 10.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708l1.146 1.147 2.646-2.647a.5.5 0 0 1 .708 0z" />
						</svg>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<!--페이지 내용 제목-->
						<span class="h3">번역자료 공유 신청 글 승인/반려 처리</span>
					</div>
					<hr>
				</div>
				<div class="col-12">
					<!--메인 내용 구역 2(지워도 됨, 자유롭게 추가)-->
					<div class="card">
						<div class="card-body">
							<h2 class="card-title" id="requestTitle">번역 공유 글 제목</h2>
							<hr>
							<span class="float-right">작성일 : <span id="rRegDate">20xx-xx-xx</span></span>
							<p class="">
								작성자 : <span id="userId">아이디</span>
							</p>
							<!--미리보기 이미지-->
							<p class="h4 font-weight-bold text-center">미리 보기 이미지</p>
							<div class="text-center">
								<img
									src="https://file3.instiz.net/data/cached_img/upload/2019/09/10/20/e73c2203e6fe3f8165e6ce1477738872.jpg"
									width="80%" class="rounded">
							</div>
							<br>
							<!--번역 내용 글-->
							<p class="h4 font-weight-bold text-center">번역 자료 내용</p>
							<p class="card-text rounded" id="requestContent"
								style="border: 1px solid lightgray; padding: 25px; margin: 0 10%;">
								&nbsp;글 내용이 들어가는 부분입니다.글 내용이 들어가는 부분입니다.글 내용이 들어가는 부분입니다.글 내용이
								들어가는 부분입니다.글 내용이 들어가는 부분입니다.글 내용이 들어가는 부분입니다.글 내용이 들어가는 부분입니다.글
								내용이 들어가는 부분입니다.글 내용이 들어가는 부분입니다.글 내용이 들어가는 부분입니다.글 내용이 들어가는
								부분입니다.글 내용이 들어가는 부분입니다.글 내용이 들어가는 부분입니다.글 내용이 들어가는 부분입니다.글 내용이
								들어가는 부분입니다.글 내용이 들어가는 부분입니다.글 내용이 들어가는 부분입니다.글 내용이 들어가는 부분입니다.글
								내용이 들어가는 부분입니다.글 내용이 들어가는 부분입니다.글 내용이 들어가는 부분입니다.글 내용이 들어가는
								부분입니다. <br>
							</p>
							<br>
						</div>
					</div>
					<br>
					<!--승인, 반려 버튼 영역-->
					<div class="d-flex justify-content-center">
						<button class="btn-primary">승인하기</button>
						&nbsp;&nbsp;&nbsp;
						<button class="btn-warning">반려하기</button>
						&nbsp;&nbsp;&nbsp;
						<button class="btn-secondary">취소</button>

					</div>
				</div>
			</div>
		</div>
		</section>

		<!-- Footer -->
		<section id="footer">
		<div class="container">
			<div class="row">
				<div class="col-8 col-12-medium"></div>
				<div class="col-4 col-12-medium"></div>
				<div class="col-12"></div>
			</div>
		</div>
		</section>

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