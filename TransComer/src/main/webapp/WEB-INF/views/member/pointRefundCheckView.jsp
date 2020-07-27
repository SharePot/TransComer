<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 포인트 환급</title>
<style>
#contentSection {
    width: 60% ;
    margin: 0 auto;
}
	th{
font-weight:bold;
}
	#title{
font-size:30px !important;
}

a{
text-decoration:none !important;
}
</style>
</head>
<c:import url="../common/menuBar.jsp" />
<body>

<div id="page-wrapper">
		<section id="main">
		<div id="contentSection">
 <h2 align="center" id="title">포인트 환급</h2>
<hr>
<table align="center">
	<tr>
		<th>아이디</th>
		<td>${pointRefund.memberId }</td>
	</tr>
	<tr>
		<th>환급 신청 포인트</th>
		<td>${pointRefund.refundPoint }</td>
	</tr>
	<tr>
	 <c:forTokens var="accountInfo" items="${pointRefund.accountInfo }" delims="," varStatus="status">
					<c:if test="${status.index eq 0 }">
							<tr>
							<th>은행명</th>
							<td>
								<input type="hidden" name="bank"  value="${accountInfo }" readonly size="6">
							${accountInfo }
							</td>
							</tr>
					</c:if>
					<c:if test="${status.index eq 1 }">
						<tr>
							<th>예금주</th>
							<td><input type="hidden" name="accountOwner" readonly value="${accountInfo }">
							${accountInfo }
							</td>
						</tr>
					</c:if>
					<c:if test="${status.index eq 2}">
						<tr>
							<th>계좌번호</th>
							<td><input type="hidden" name="account" readonly  value="${accountInfo }">
							${accountInfo }
							</td>
						</tr>
					</c:if>
				</c:forTokens>
	
	<tr>
		<th align="center" colspan="2"><center><h2>최종 환급 포인트</h2>(수수료 10% 차감)	<h1>=${pointRefund.refundPoint *0.9 } </h1></center></th>
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
           <a  onclick="return check()" href="${conform}"> <button class="btn btn-success">승인</button></a> &nbsp;
           <a onclick="return check()" href="${reject}"> <button  class="btn btn-danger">반려</button></a> &nbsp;
           <br> <br><a href="pointRefundList.tc"><button  class="btn btn-secondary">목록으로</button></a>  &nbsp;
		
		
			</td>
	</tr>

</table>
</div>
</section>
</div>
<script>
function check(){
	  alert("처리 되었습니다.");
}



</script>


</body>



</html>