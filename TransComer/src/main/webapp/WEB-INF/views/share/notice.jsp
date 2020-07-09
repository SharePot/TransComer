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
	
a{
	text-decoration: none;
}
pagination{
	text-align: center;
}
#search{
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
					번역본 공유 게시판</p>
			</div>
			<div id="contents">
				<div class="container">
					<!--select박스 memberweb보기-->
					<select id="lang" class="custom-select custom-select-sm-10 col-md-9"
								style="height: 8%; width: 13%; margin-right:  10px;">
						<option selected>언어</option>
						<option>C/C++</option>
						<option>Java</option>
						<option>Python</option>
						<option>기타</option>		
					</select>
					<!--select박스 memberweb보기-->
					<select id="lang" class="custom-select custom-select-sm-10 col-md-9"
								style="height: 8%; width: 15%; margin-right:  10px;">
						<option selected>번역</option>
						<option>English</option>
						<option>Korean</option>
						<option>Chinese</option>
						<option>Japanese</option>
					
					</select>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>언어</th>
								<th>제목</th>
								<th>번역</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Java</td>
								<td>NullpointerException </td>
								<td>Korean</td>
								<td>이씨</td>
								<td>2020.07.06</td>
								<td>15</td>
							</tr>

							<tr>
								<td>2</td>
								<td>C++</td>
								<td>컴파일러가 뭐에요?</td>
								<td>English</td>
								<td>박씨</td>
								<td>2020.07.06</td>
								<td>17</td>
							</tr>

							<tr>
								<td>3</td>
								<td>English</td>
								<td>영어 본문 번역해주세요</td>
								<td>Chinese</td>
								<td>김씨</td>
								<td>2020.07.06</td>
								<td>18</td>
							</tr>
													
							<tr>
								<td>4</td>
								<td>Japanese</td>
								<td>일어 본문 번역해주세요</td>
								<td>Korean</td>
								<td>홍씨</td>
								<td>2020.07.06</td>
								<td>8</td>
							</tr>
							
							<tr>
								<td>5</td>
								<td>Chinese</td>
								<td>중국어 본문 번역해주세요</td>
								<td>Korean</td>
								<td>양씨</td>
								<td>2020.07.06</td>
								<td>8</td>
							</tr>
						</tbody>
					</table>
					<hr />
					<div style="text-align: center;">
						 <select id="selectBox"
								class="custom-select custom-select-sm-10 col-md-9"
								style="height: 8%; width: 16%; margin-right:  10px;">
								<option selected>검색</option>
								<!--<option value="1">링크</option>-->
								<option value="2">제목</option>
								<option value="3">내용</option>
								<option value="4">작성자</option>
							</select>
						<!--<input  type="text" placeholder="검색어를 입력해주세요." style="width: 70%; margin-top: 10px;">-->
						<input id="search" type="text" placeholder="검색어를 입력해주세요."  style="padding:6px;">
					<button class="btn btn-primary"  type="submit" style="font-size: 15px; padding: 10px; float: right;" >신청서 작성</button>
					</div>
					<br>
					
					<div class="d-flex justify-content-center">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
						</ul>
					</div>
					</div>
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



