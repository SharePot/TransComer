<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<style>

</style>
<link rel="stylesheet" href="resources/css/memberDetail.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 회원 정보 상세 보기</title>
</head>
	<c:import url="../common/menuBar.jsp" />
<body>
	<section id="main">
		<div id="mainWrapper">
			<center>
				<h1 id="memId">&#39;${member.memberId}&#39;</h1><h1 id="title">&#160;상세페이지</h1><br><br>
			</center>
			<p class="semiTitle">&#45;&#160;기본정보</p>
			<table align="center">
				<tr>
					<td>아이디</td>
					<td>${member.memberId }</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${member.memberName }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${member.email }</td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td>${member.phone }</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${member.address }</td>
				</tr>
				<tr>
					<td>회원 가입일</td>
					<td>${member.enrollDate }</td>
				</tr>
			</table>
				
				
				<p class="semiTitle">&#45;&#160;계좌정보</p>
				<table>
					<c:if test="${!empty member.account }">
						<c:forTokens var="accountInfo" items="${member.account }" delims="," varStatus="status">
							<tr>
								<c:if test="${status.index eq 0 }">
									<td>은행명</td>
									<td>${accountInfo }</td>
								</c:if>
							</tr>
							<tr>
								<c:if test="${status.index eq 1 }">
									<td>계좌주</td>
									<td>${accountInfo }</td>
								</c:if>
							</tr>
							<tr>
								<c:if test="${status.index eq 2}">
									<td>계좌번호</td>
									<td>${accountInfo }</td>
								</c:if>
							</tr>
						</c:forTokens>
					</c:if>
					<c:if test="${empty member.account }">
						<tr>
							<td id="accountInfoNone">계좌 정보가 없습니다.</td>
						</tr>
					</c:if>
				</table>
				
				
				<p class="semiTitle">&#45;&#160;보유포인트</p>
				<table>
					<tr>
						<td>포인트</td>
						<td>${member.point }</td>
					</tr>				
				</table>

		</div>
	</section>
</body>
</html>