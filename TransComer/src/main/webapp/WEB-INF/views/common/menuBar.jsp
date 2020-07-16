<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE HTML>
<html lang="ko">

<head>
    <title>SharePot</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
</head>

<body class="homepage is-preload">
    <div id="page-wrapper">
    
    	<div id="topBar" align="right">
			<ul>
				<c:url var="login" value="loginPage.tc" />
				<c:if test="${ empty sessionScope.loginUser }">
					<li><a href="${login }">로그인</a></li>
					<li><a>회원가입</a></li>
				</c:if>
				
				<c:url var="logout" value="logout.tc" />
				<c:url var="alarm" value="alarmView.tc" />
				
				<c:if test="${!empty sessionScope.loginUser }">
					<li><a href="${logout }">로그아웃</a></li>
					<li>
						<c:if test="${loginUser.status ne 'ADMIN' }">
							<a href="myPage.tc">마이페이지</a>
						</c:if>
						<c:if test="${loginUser.status eq 'ADMIN' }">
							<a href="adminPage.tc">관리자페이지</a>
						</c:if>
					</li>
					<li><a href="${alarm }">알림</a></li>
				</c:if>
			</ul>
        </div>

        <!-- Header -->
        <section id="header">
			
            <!-- Logo -->
            <h1><a href="index.html">SharePot</a></h1>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li class="current"><a href="#">Home</a></li>
                    <li>
                    <c:url var="sList" value="sReqListView.tc" />
					<c:url var="pList" value="plist.tc" />
                        <a href="#">번역 의뢰</a>
                        <ul>
                            <li><a href="${sList }">단순의뢰</a></li>
                            <li><a href="${pList }">1:1 의뢰</a></li>
                        </ul>
                    </li>
                    <li><a href="#">번역 공유</a></li>
                    <li><a href="studyList.tc">스터디</a></li>
                    <li><a href="qlist.tc">Q&amp;A</a></li>
                </ul>
            </nav>
        </section>
    </div>

    <!-- Scripts -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/jquery.dropotron.min.js"></script>
    <script src="resources/js/browser.min.js"></script>
    <script src="resources/js/breakpoints.min.js"></script>
    <script src="resources/js/util.js"></script>
    <script src="resources/js/main.js"></script>
    <!--템플릿 css-->
    <link rel="stylesheet" href="resources/css/main.css" />

</body></html>