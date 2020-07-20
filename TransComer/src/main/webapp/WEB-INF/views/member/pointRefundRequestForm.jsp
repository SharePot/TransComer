<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 		<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 포인트 환급 신청</title>
</head>
<c:import url="../common/menuBar.jsp" />
<body>

<div id="page-wrapper">
		<section id="main">
		<div id="boardWrapper">
 <h2 align="center">포인트 환급 신청</h2>
 <br>
<center><p>14일 이전 환급 신청건은 당월 15일, 15일 이후 환급 신청건은 익월 15일에 환급됩니다.</p></center>
 
<hr>
  <br>
<form action="pointRefundInsert.tc" method="post" enctype="multipart/form-data">
<input type="hidden" value="${loginUser.memberId }" name="memberId" > 
<table align="center">
	<tr>
		<td>보유 포인트</td>
		<td><input type="hidden" value="${loginUser.point }" id="havePoint" readonly>${loginUser.point }</td>
	</tr>
	<tr>
		<td>환급 신청 포인트<br><p style="font-size:1px;">100,000 포인트 이상부터 환급 가능(단위 10,000)</p></td>
		<td><input type="number" min="100000" step="10000" name="refundPoint" id="refundPoint" value="100000"></td>
	</tr>
	<tr>
	 <c:forTokens var="accountInfo" items="${loginUser.account }" delims="," varStatus="status">
					<c:if test="${status.index eq 0 }">
							<tr>
							<td>은행명</td>
							<td>
								<input type="hidden" name="bank"  value="${accountInfo }"  size="6">
							${accountInfo }
							</td>
							</tr>
					</c:if>
					<c:if test="${status.index eq 1 }">
						<tr>
							<td>예금주</td>
							<td><input type="hidden" name="accountOwner"  value="${accountInfo }">${accountInfo }</td>
						</tr>
					</c:if>
					<c:if test="${status.index eq 2}">
						<tr>
							<td>계좌번호</td>
							<td><input type="hidden" name="account"   value="${accountInfo }">${accountInfo }</td>
						</tr>
					</c:if>
				</c:forTokens>
					<tr><td colspan="2" align="center"><span id="message" style="color:blue;"></span></td></tr>
				<tr>
				<td colspan="2" align="center">
					<input type="submit" onclick="return check();" value="환급 신청">&nbsp; &nbsp;
					<input type="reset" value="취소">
				</td>
			</tr>
</table>
</form>
</div>
</section>
</div>

<script>


function check(){
	var havepoint=$("#havePoint").val();
	console.log(havepoint);	
if($("#havePoint").val() < $("#refundPoint").val()){
	$("#message").html("보유 포인트보다 환급 요청한 포인트가 더 높습니다.");
	return false;
}	
	
}



</script>

</body>
</html>