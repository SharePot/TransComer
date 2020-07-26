<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>SharePot</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<style>
html {
	background-color: white
}

/*
				테두리 색 변경
				input:focus {
				outline:3px solid #7FFFD4;
				}*/
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

a {
	text-decoration: none;
}

pagination {
	text-align: center;
}

#search {
	border: 1px solid gray;
	border-radius: 15px;
	/*border: none;
				border-top: 0px;
				border-right:
				0px;
				border-left: 0px;*/
	/*border-bottom: 0px;*/
	width: 50%;
}

#selectBox {
	border-radius: 15px;
}
</style>
</head>
<body class="homepage is-preload">
<c:import url="../common/menuBar.jsp" />
	<form action="shareInsert.tc" method="post"
		enctype="multipart/form-data">
		<div id="page-wrapper">

			<!-- <!-- Header -->
			<!-- <section id="header">

				Logo
				<h1>
					<a href="index.html">SharePot</a>
				</h1>

				Nav
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
			</section> -->


			<!-- Main -->
			<section id="main">
				<div>
					<p id="p1"
						style="font-size: 30px; text-align: center; font-weight: 900">
						번역본 공유 신청</p>
					<input type="hidden" value="${loginUser.memberId }" name="memberId">
				</div>
				<div id="contents">
					<div class="container">
						<div class="row">
							<div class="card">
								<div class="d-flex justify-content-center">
									<input type="text"
										placeholder="제목을 입력해주세요.&nbsp;&nbsp;&nbsp;&nbsp;EX) OOO에 관한 번역"
										style="width: 92%; margin-right: 9px;" class="form-control"
										id="inputTitle" name="shareTitle" >
								</div>
								<br>
								<!--select박스 memberweb보기 -->
								<div style="text-align: center;">
									<select id="lang"
										class="form-control custom-select custom-select-sm-10 col-md-9"
										style="width: 45%; margin-right: 10px;" name="pLanguage">
										<option selected>언어</option>
										<option>C/C++</option>
										<option>Java</option>
										<option>Python</option>
										<option>기타</option>
									</select>
									<!--select박스 memberweb보기 -->
									<select id="lang"
										class="custom-select custom-select-sm-10 col-md-9"
										style="width: 45%; margin-right: 10px;" name="tLanguage">
										<option selected>번역</option>
										<option>English</option>
										<option>Korean</option>
										<option>Chinese</option>
										<option>Japanese</option>
									</select> <br> <br>

									<!--파일 첨부 -->
									<!--onchange: 스크립트로 데이터 변경이 있을 때 동작되는 함수 -->
									<!--onchange 피라미터 갯수를 스크립트의 갯수와 동일하게 입력 -->

									<input style="background-color: white; width: 45%;" type="file"
										name="uploadFile" onchange="checkFile(this, 2)">
									&nbsp; <input
										style="background-color: white; width: 45%; margin-right: 5px;"
										type="file" name="uploadFile" onchange="checkFile(this, 2)">
									<br>
								</div>
								<br>
								<!--TextArea -->
								<div class="d-flex justify-content-center">
									<!--<input type="text" placeholder="페이지의 설명과 신청이유를 적어주세요." style="width:92%; 
										margin-right: 9px; height: 150px;" class="form-control" id="inputTitle" > -->
									<textarea
										style="resize: none; margin-right: 10px; boarder-color: gainsboro; border-radius: 5px; width: 91%;"
										rows="5" cols="200" name="shareContent"
										placeholder=" 페이지의 설명과 신청이유를 적어주세요." class="form-control"></textarea>
								</div>
								<br>
								<div class="d-flex justify-content-center">
									<!-- <button class="btn-warning" onclick="back()">뒤로가기</button> -->
									

									<input type="button" class="btn_list" value="취소" onclick="goBack()">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="submit" class="btn-primary">등록</button>
								</div>
								<br>
							</div>
							<br>
						</div>
					</div>
				</div>
		</div>

		</section>
		<br>
	</form>
	<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="resources/assets/js/browser.min.js"></script>
	<script src="resources/assets/js/breakpoints.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="resources/assets/js/main.js"></script>
	

	<!--파일 업로더 유효성 검사 -->

	<script>
	function goBack() {
	    window.history.back();
	}
	</script>

	<script>
		function checkFile(f) {

			// files 로 해당 파일 정보 얻기.
			var file = f.files;

			// file[0].name 은 파일명 입니다.
			// 정규식으로 확장자 체크
			if (!/\.(zip|jpg|jpeg|png)$/i.test(file[0].name))
				alert('zip, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

			// 체크를 통과했다면 종료.
			else
				return;

			f.outerHTML = f.outerHTML;
		}
	</script>

	<!-- <script>
	function checkFile(el){

		// files 로 해당 파일 정보 얻기.
		var file = el.files;

		// file[0].size 는 파일 용량 정보입니다.
		if(file[0].size > 1024 * 1024 * 2){
			// 용량 초과시 경고후 해당 파일의 용량도 보여줌
			alert('2MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
		}

		else return;

		el.outerHTML = el.outerHTML;
	}
	</script> -->

</body>

</html>



