<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center><h1>${member.memberId} 상세 페이지</h1></center>
<br>
<hr>
<table align="center">
<tr colspan="2"><td>-기본 정보</td></tr>
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
	<tr colspan="2"><td><hr></td></tr>
	<tr colspan="2"><td>-계좌 정보</td></tr>
	<tr>
	 <c:forTokens var="accountInfo" items="${member.account }" delims="," varStatus="status">
					<c:if test="${status.index eq 0 }">
							<tr>
							<td>은행명</td>
							<td>
								<input type="text" name="bank"  value="${accountInfo }" readonly size="6">
							</td>
							</tr>
					</c:if>
					<c:if test="${status.index eq 1 }">
						<tr>
							<td>계좌주</td>
							<td><input type="text" name="accountOwner" readonly value="${accountInfo }"></td>
						</tr>
					</c:if>
					<c:if test="${status.index eq 2}">
						<tr>
							<td>계좌번호</td>
							<td><input type="text" name="account" readonly  value="${accountInfo }"></td>
						</tr>
					</c:if>
				</c:forTokens>
	
	<tr colspan="2"><td><hr></td></tr>
	<tr colspan="2"><td>-보유 포인트</td></tr>
	<tr>
		<td>포인트 </td>
		<td>${member.point }</td>
	</tr>


</table>

</body>
</html>