<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
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
	
	.reArea{
		border: 0px solid;
		
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
			<div style="text-align: center; border: 1px solid; width: 70%; margin: auto">
				<table>

						<tr class="reArea">
							<td>
								<table>
									<tr>
										<td>
											<p id="p1" style="font-size: 30px; text-align: center; font-weight: 900">${share[0].SHARE_TITLE}</p>
											
										</td>
										<td>
											${share[0].P_LANGUAGE}
										</td>
									</tr>
								</table>
								
						
							</td>
						</tr>
					
					<tr class="reArea">
						<td>
							<div style="border: 1px solid; width: 90%; margin: auto" >
								미리보기 이미지 <br>
								<img src="resources/uploadFiles/${share[0].FILE_PATH}" style="width: 90%" height="300px;"><br>
								번역자료 내용 <br>
								<textarea style="width: 80%; height: 300px;">${share[0].SHARE_CONTENT}</textarea>
							</div>
						</td>
					
					</tr>
					
					<tr class="reArea">
						<td>
							<input type="button" value="삭제요청">
						</td>
						
					</tr>
					
					<tr class="reArea">
						<td>
							<hr style="border-bottom: 1px solid; border-top: 0px solid; width: 90%; margin: auto">
						</td>
						
					</tr>
				

				</table>
				
				<table>
					<tr>
						<td>
							답변1
						</td>
					
					</tr>
					
					<tr>
						<td>
							<div style="border: 1px solid; width: 90%; height: 150px; margin: auto">
								<table>
									<tr>
										<td>
											user1
										</td>
										
										<td>
											2020-02-22
										</td>
										
										<td>
											수정/삭제
										</td>
									</tr>
									
									<tr>
										<td colspan="3">공유 감사합니다!</td>
									</tr>
								
								</table>
							</div>
						</td>
					
					</tr>
					
				</table>
				
				<hr style="border-bottom: 1px solid; border-top: 0px solid; width: 90%; margin: auto">
					 
				<table>
					<tr>
						<td><textarea>dd</textarea></td>
						<td><input type="button" value="등록"></td>
					</tr>
				</table>
			
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



