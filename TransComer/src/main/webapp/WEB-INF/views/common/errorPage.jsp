<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>SharePot Service Error</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />

</head>
<body class="homepage is-preload">
	<div id="page-wrapper">
		<!-- Header -->
		<c:import url="../common/menuBar.jsp" />
		
		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="d-flex justify-content-center">
							<p class="h2">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-exclamation-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
								</svg>
								서비스 요청 실패
							</p>
						</div>
						<br><br>
						<div class="card" style="margin:0%10%;">
							<!-- 서비스 요청 실패 원인 -->
							<c:if test="${not empty msg }">
								<div class="card-header">
									<div class="d-flex justify-content-center">
										<p class="h4 font-weight-bold">※ ${msg }</p>
									</div>
								</div>
							</c:if>
							<div class="card-body">
								<br>
								<p class="text-center">요청하신 서비스 응답에 실패하였습니다.</p>
								<p class="text-center">이용에 불편을 드려서 죄송합니다.</p>
								<p class="text-center">잠시후에 다시 시도하여 주세요.</p>
								<p class="text-center">저희 서비스를 이용하여 주셔서 감사합니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- Footer -->
       	<c:import url="footer.jsp"/>
	
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



