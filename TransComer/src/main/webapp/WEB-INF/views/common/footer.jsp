<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지 하단</title>
<!-- 템플릿 -->
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery.dropotron.min.js"></script>
<script src="resources/js/browser.min.js"></script>
<script src="resources/js/breakpoints.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<!--템플릿 css-->
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body>
	<section id="footer">
		<div class="container">
	        <div class="row">
	            <div class="col-8 col-12-medium">
					제작 : 트랜스코머
	            	<br>
	            	김응진 · 임빛나 · 이두경 · 이다은 · 구현정 · 진가영
	            </div>
	            <div class="col-4 col-12-medium">
	            	셰어팟 · SharePot
	            	<br>
	            	Copyright © TransComer
	            </div>
	            <div class="col-12">
	            	<a href="home.tc" style="text-decoration:none;">셰어팟 홈</a>
	            	&nbsp;|&nbsp;
	            	<a href="homepageinfo.jsp" style="text-decoration:none;">홈페이지 소개</a>
					<c:if test="${ empty sessionScope.loginUser }">
		            	&nbsp;|&nbsp;
		            	<c:url var="login" value="loginPage.tc" />
						<a href="${login }" style="text-decoration:none;">로그인</a>
						&nbsp;|&nbsp;
						<a href="erollView.tc" style="text-decoration:none;">회원가입</a>
					</c:if>
					<c:if test="${ not empty sessionScope.loginUser }">
		            	&nbsp;|&nbsp;
						<c:url var="logout" value="logout.tc" />
						<a href="${logout }" style="text-decoration:none;">로그아웃</a>
					</c:if>
	            </div>
	        </div>
	    </div>
	</section>
</body>
</html>