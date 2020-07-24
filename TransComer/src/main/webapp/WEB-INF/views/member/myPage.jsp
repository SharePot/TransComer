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
					<c:url var="detail" value="memberDetail.tc">
							<c:param name="memberNo" value="${loginUser.memberNo }" />
						</c:url>
					<img src="/resources/css/images/user2.png" class="itemImg">
					<a href="${detail }">내 정보 보기</a>
				</li>
				<c:if test="${loginUser.profileStatus eq 'N' }">
					<li>
						<c:url var="insert" value="profileInsertView.tc">
							<c:param name="memberNo" value="${loginUser.memberNo }" />
						</c:url>
						<img src="/resources/css/images/login.png" class="itemImg">
						<a href="${insert }">프로필 등록하기</a>
					</li>
				</c:if>
					
				<c:if test="${loginUser.profileStatus ne 'N' }">
					<li>
						<c:url var="profileView" value="profileDetail.tc">
							<c:param name="memberNo" value="${loginUser.memberNo }" />
						</c:url>
						<img src="/resources/css/images/login.png" class="itemImg">
						<a href="${profileView }">프로필 보기</a>
					</li>
				</c:if>
					
				<li>
					<img src="/resources/css/images/paper.png" class="itemImg">
					<a href="myReqRepList.tc">1:1 의뢰 문의 내역</a>
				</li>
				<li>
					<img src="/resources/css/images/paper.png" class="itemImg">
					<a href="mySimpleList.tc">단순 의뢰 문의 내역</a>
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
					<a href="deleteMemberView.tc">회원 탈퇴하기</a>
				</li>
			</ul>
                       
        </div>
	</section>
</body>
</html>