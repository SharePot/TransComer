<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/myPage.css" />
<title>SharePot - 관리자페이지</title>
</head>
<body>
	<c:import url="../common/menuBar.jsp" />
    <section id="main">
		<div id="mainWrapper">
                      
			<img src="/resources/css/images/user.png" id="iconImg">
			<h1 id="pageTitle">관리자페이지</h1>
			<hr>
			<ul id="pageList">
				<li>
					<img src="/resources/css/images/user2.png" class="itemImg">
					<a href="memberList.tc">회원 전체 리스트</a>
				</li>
				<li>
					<img src="/resources/css/images/login.png" class="itemImg">
					<a href="">회원 프로필 리스트</a>
				</li>
				<li>
					<img src="/resources/css/images/emergency.png" class="itemImg">
					<a href="rANDblist.tc">신고 리스트</a>
				</li>
					
				<li>
					<img src="/resources/css/images/paper.png" class="itemImg">
					<a href="">문의 리스트</a>
				</li>
				<li>
					<img src="/resources/css/images/wallet.png" class="itemImg">
					<a href="adminShareList.tc">번역글 승인</a>
				</li>
				<li>
					<img src="/resources/css/images/money.png" class="itemImg">
					<a href="pointRefundList.tc">포인트 환급 목록</a>
				</li>
				<li>
					<img src="/resources/css/images/money (1).png" class="itemImg">
					<a href="">포인트 회수</a>
				</li>
			</ul>
                       
        </div>
	</section>
</body>
</html>