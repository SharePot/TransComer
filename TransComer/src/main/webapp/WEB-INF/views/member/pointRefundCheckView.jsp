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
<center><h1>포인트 환급</h1></center>
<br>
<hr>
<table align="center">
	<tr>
		<td>아이디</td>
		<td>${pointRefund.memberId }</td>
	</tr>
	<tr>
		<td>환급 신청 포인트</td>
		<td>${pointRefund.refundPoint }</td>
	</tr>
	<tr>
	 <c:forTokens var="accountInfo" items="${pointRefund.accountInfo }" delims="," varStatus="status">
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
	
	<tr>
		<td><h2>-최종 환급 포인트</h2>(수수료 10% 차감)	<h1>=${pointRefund.refundPoint *0.9 } </h1></td>
	</tr>
	<tr>
		<td>
		       <c:url var="conform" value="pointRefundUpdate.tc">
               <c:param name="refundYn" value="Y"/>
               <c:param name="refundNo" value="${pointRefund.refundNo }"/>
               
            </c:url>
                  <c:url var="reject" value="pointRefundUpdate.tc">
               <c:param name="refundNo" value="N"/>
               <c:param name="refundNo" value="${pointRefund.refundNo }"/>
            </c:url>
            <!-- 자기글일 때만 수정/삭제 보이게 하기 -->
            <a href="${conform}">승인</a> &nbsp;
            <a href="${reject}">반려</a> &nbsp;
            <a href="pointRefundList.tc">취소</a> &nbsp;
		
		
			</td>
	</tr>




</table>

</body>
</html>