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
<title>Insert title here</title>
</head>
<body>


<center><h1>포인트 환급 신청</h1></center>
<br>
<hr>
<center><p>14일 이전 환급 신청건은 당월 15일, 15일 이후 환급 신청건은 익월 15일에 환급됩니다.</p></center>
<form action="pointRefundInsert.tc" method="post" enctype="multipart/form-data">
<input type="hidden" value="${loginUser.memberId }" name="memberId" > 
<table align="center">
	<tr>
		<td>보유 포인트</td>
		<td><input type="text" value="${loginUser.point }" id="havePoint" readonly></td>
	</tr>
	<tr>
		<td>환급 신청 포인트<br><h6>100,000 포인트 이상부터 환급 가능(단위 10,000)</h6></td>
		<td><input type="number" min="100000" step="10000" name="refundPoint" id="refundPoint" value="100000"></td>
	</tr>
	<tr><td colspan="2"><span id="message" style="color:blue;"></span></td></tr>
	<tr>
	 <c:forTokens var="accountInfo" items="${loginUser.account }" delims="," varStatus="status">
					<c:if test="${status.index eq 0 }">
							<tr>
							<td>은행명</td>
							<td>
								<input type="text" name="bank"  value="${accountInfo }"  size="6">
							</td>
							</tr>
					</c:if>
					<c:if test="${status.index eq 1 }">
						<tr>
							<td>예금주</td>
							<td><input type="text" name="accountOwner"  value="${accountInfo }"></td>
						</tr>
					</c:if>
					<c:if test="${status.index eq 2}">
						<tr>
							<td>계좌번호</td>
							<td><input type="text" name="account"   value="${accountInfo }"></td>
						</tr>
					</c:if>
				</c:forTokens>
				<tr>
				<td colspan="2" align="center">
					<input type="submit" onclick="return check();" value="등록">&nbsp; &nbsp;
					<input type="reset" value="취소">
				</td>
			</tr>
</table>
</form>

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