<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 포인트 환급</title>
</head>
<c:import url="../common/menuBar.jsp" />
<body>

<div id="page-wrapper">
		<section id="main">
		<div id="boardWrapper">
 <h2 align="center">포인트 환급</h2>
   <br><br><br>
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
								<input type="hidden" name="bank"  value="${accountInfo }" readonly size="6">
							${accountInfo }
							</td>
							</tr>
					</c:if>
					<c:if test="${status.index eq 1 }">
						<tr>
							<td>예금주</td>
							<td><input type="hidden" name="accountOwner" readonly value="${accountInfo }">
							${accountInfo }
							</td>
						</tr>
					</c:if>
					<c:if test="${status.index eq 2}">
						<tr>
							<td>계좌번호</td>
							<td><input type="hidden" name="account" readonly  value="${accountInfo }">
							${accountInfo }
							</td>
						</tr>
					</c:if>
				</c:forTokens>
	
	<tr>
		<td align="center" colspan="2"><h2>-최종 환급 포인트</h2>(수수료 10% 차감)	<h1>=${pointRefund.refundPoint *0.9 } </h1></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		       <c:url var="conform" value="pointRefundUpdate.tc">
               <c:param name="refundYn" value="Y"/>
               <c:param name="refundNo" value="${pointRefund.refundNo }"/>
               <c:param name="refundPoint" value="${pointRefund.refundPoint }"/>
               <c:param name="memberId" value="${pointRefund.memberId }"/>
            </c:url>
                  <c:url var="reject" value="pointRefundUpdate.tc">
               <c:param name="refundNo" value="N"/>
               <c:param name="refundNo" value="${pointRefund.refundNo }"/>
            </c:url>
            <a href="${conform}">승인</a> &nbsp;
            <a href="${reject}">반려</a> &nbsp;
            <a href="pointRefundList.tc">취소</a> &nbsp;
		
		
			</td>
	</tr>

</table>
</div>
</section>
</div>

</body>
</html>