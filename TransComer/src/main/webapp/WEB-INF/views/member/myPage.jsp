<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/myPage.css" />
<title>SharePot - 마이페이지</title>
</head>
<body>
	<c:import url="../common/menuBar.jsp" />
    <section id="main">
		<div id="mainWrapper">
                      
			<img src="/resources/css/images/user.png" id="iconImg">
			<h1 id="pageTitle">마이페이지</h1>
			<hr>
			<ul id="pageList">
				<li>
					<img src="/resources/css/images/user2.png" class="itemImg">
					<a href="memberDetail.tc">내 정보 보기 / 수정하기</a>
				</li>
				<li>
					<img src="/resources/css/images/login.png" class="itemImg">
					<a href="profileInsertView.tc">경력 프로필 등록 / 수정하기</a>
				</li>
					
				<li>
					<img src="/resources/css/images/paper.png" class="itemImg">
					<a href="myPersonalList.tc">나의 의뢰 문의 내역</a>
				</li>
				<li>
					<img src="/resources/css/images/wallet.png" class="itemImg">
					<a href="">잔여 포인트 / 포인트 사용내역 확인</a>
				</li>
				<li>
					<img src="/resources/css/images/money.png" class="itemImg">
					<a href="">포인트 충전 결제</a>
				</li>
				<li>
					<img src="/resources/css/images/money (1).png" class="itemImg">
					<a href="pointRefundRequestView.tc">포인트 환급 신청</a>
				</li>
				<li>
					<img src="/resources/css/images/premium-quality.png" class="itemImg">
					<a href="">프리미엄 가입</a>
				</li>
				<li>
					<img src="/resources/css/images/doorway.png" class="itemImg">
					<a href="">회원 탈퇴하기</a>
				</li>
			</ul>
                       
        </div>
	</section>
</body>
</html>