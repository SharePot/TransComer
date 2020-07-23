<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form action="shareInsert.tc" method="post"
		enctype="multipart/form-data">
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
						번역본 공유 신청</p>
					<input type="hidden" value="${loginUser.memberId }" name="memberId">
				</div>
				<div id="contents">
					<div class="container">

						<div class="d-flex justify-content-center">
							<input type="text"
								placeholder="제목을 입력해주세요.&nbsp;&nbsp;&nbsp;&nbsp;EX) OOO에 관한 번역"
								style="width: 92%; margin-right: 9px;" class="form-control"
								id="inputTitle" name="shareTitle">
						</div>
						<br>
						<!--select박스 memberweb보기 -->
						<div style="text-align: center;">
							<select id="lang"
								class="custom-select custom-select-sm-10 col-md-9"
								style="height: 8%; width: 45%; margin-right: 10px;"
								name="pLanguage">
								<option selected>언어</option>
								<option>C/C++</option>
								<option>Java</option>
								<option>Python</option>
								<option>기타</option>
							</select>
							<!--select박스 memberweb보기 -->
							<select id="lang"
								class="custom-select custom-select-sm-10 col-md-9"
								style="height: 8%; width: 45%; margin-right: 10px;"
								name="tLanguage">
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
								name="uploadFile" onchange="checkFile(this, 2)"> &nbsp; 
							
							<input style="background-color: white; width: 45%; margin-right: 5px;"
							type="file" name="uploadFile" onchange="checkFile(this, 2)"> <br>
							
						</div>
						<br>
						<!--TextArea -->
						<div class="d-flex justify-content-center">
							<!--<input type="text" placeholder="페이지의 설명과 신청이유를 적어주세요." style="width:92%; 
										margin-right: 9px; height: 150px;" class="form-control" id="inputTitle" > -->
							<textarea
								style="resize: none; margin-right: 10px; border-color: gainsboro; border-radius: 5px; width: 91%;"
								rows="5" cols="200" placeholder=" 페이지의 설명과 신청이유를 적어주세요."
								class="form-control" name="shareContent"></textarea>
						</div>

						<br>

						<div style="text-align: center;">
							<input type="button" value="돌아가기"  onclick="history.back()">
							
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							 <input type="submit" value="신청하기">
						</div>
						<br>



					</div>
				</div>

			</section>

			<br> <br> <br> <br> <br> <br> <br>
			<br>
		</div>
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
			function checkFile(info,mb){
				checkType(info,mb);
				checkSize(info,mb);

			}
	
			function checkType(info,mb){

			var file = info.files[0].name.split('.');
			
			if(!/\.(zip|jpg|jpeg|png)$/i.test(file[1])) {
			alert("jpg, png, jpeg, zip 파일만 첨부 가능합니다.");
				info.outerHTML = info.outerHTML;
				return false;
			}
				 return true;

			}
		</script>
		
		

	<script>
			//파일 용량 체크
			function checkSize(info, mb){
				if (info.files[0].size > 10 * 1024 * 1024 * mb){ //단위는 MB
					alert("10MB 이하 크기의 파일만 첨부할 수 있습니다.");
					info.outerHTML = info.outerHTML;
					return false;
				}
				return true;
			}
		</script>


</body>

</html>



