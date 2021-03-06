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

<style>
#contentSection {
    width: 60% ;
    margin: 0 auto;
}
th{
font-weight:bold;
}
.account{
width:450 !important;
}
#rPoint{
width:100 !important;
}
</style>
</head>
<c:import url="../common/menuBar.jsp" />
<body>

<div id="page-wrapper">
		<section id="main">
		    <div id="contentSection">
 <h2 align="center">포인트 환급 신청</h2>
 <br>
<center><p>14일 이전 환급 신청건은 당월 15일, 15일 이후 환급 신청건은 익월 15일에 환급됩니다.</p></center>
 
<hr>

<form action="pointRefundInsert.tc" method="post" enctype="multipart/form-data">
<input type="hidden" value="${loginUser.memberId }" name="memberId" > 
<table align="center">
	<tr>
		<th>보유 포인트</th>
		<td><input type="hidden" value="${loginUser.point }" id="havePoint" readonly>${loginUser.point }</td>
	</tr>
	<tr>
		<th>환급 신청 포인트<br><p style="font-size:1px;">100,000 포인트 이상부터 환급 가능(단위 10,000)</p></th>
		<td id="rPoint"><input  type="number" min="100000" step="10000" name="refundPoint" id="refundPoint"></td>
		
	</tr>


   <c:if test="${loginuUser.account ne ',,' }">
	 <c:forTokens var="accountInfo" items="${loginUser.account }" delims="," varStatus="status">
					<c:if test="${status.index eq 0 }">
							<tr>
							<th>은행명</th>
							<td>
								<input class="account" type="text" name="bank" id="bank" value="${accountInfo }"  size="6">
							</td>
							</tr>
					</c:if>
					<c:if test="${status.index eq 1 }">
						<tr>
							<th>예금주</th>
							<td><input class="account" type="text" name="accountOwner"  id="accountOwner" value="${accountInfo }"></td>
						</tr>
					</c:if>
					<c:if test="${status.index eq 2}">
						<tr>
							<th>계좌번호</th>
							<td><input class="account" type="text" name="account" id="account"  value="${accountInfo }"></td>
						</tr>
					</c:if>
				</c:forTokens>
				</c:if>
			  <c:if test="${loginUser.account eq ',,' }">
						<tr>
							<th>은행명</th>
							<td>
								<input class="account" type="text" name="bank" id="bank2" value=""  size="6">
							</td>
							</tr>
						<tr>
							<th>예금주</th>
							<td><input class="account" type="text" name="accountOwner"  id="accountOwner2" value=""></td>
						</tr>
						<tr>
							<th>계좌번호</th>
							<td><input class="account" type="text" name="account" id="account2"  value=""></td>
						</tr>
				</c:if>
					<tr><th colspan="2" align="center"><center><span id="message" style="color:blue;"></span></center></th></tr>
				<tr>
				<td colspan="2" align="center">
					<input type="submit" onclick="return check();" value="환급 신청">&nbsp; &nbsp;
					<input type="reset" value="취소">
					<input type="hidden" id="acc" value="${loginUser.memberId }">
				</td>
			</tr>
</table>
</form>
</div>
</section>
</div>
<script>
var rPoint=$("#refundPoint").val();
console.log(rPoint);

function check(){
	var havepoint=$("#havePoint").val();
	var rPoint=$("#refundPoint").val();
	var bank=$("#bank").val();
	var accountOwner=$("#accountOwner").val();
	var account=$("#account").val();
	var bank2=$("#bank2").val();
	var accountOwner2=$("#accountOwner2").val();
	var account2=$("#account2").val();
	console.log(rPoint);
	if(havepoint < rPoint){
		$("#message").html("보유 포인트보다 환급 요청한 포인트가 더 높습니다.");
		return false;
		}else if((bank==null || accountOwner ==null || account==null )&&(bank2==null || accountOwner2 ==null || account2==null)){
	$("#message").html("환급 받을 계좌 정보를 입력해주세요.");
	return false; 
}	 else{
	alert("환급 신청이 완료되었습니다.");	
}

	
}



</script>

</body>
</html>