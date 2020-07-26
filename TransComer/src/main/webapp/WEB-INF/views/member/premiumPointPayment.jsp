<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import = "java.util.Calendar" %>
<%Calendar cal = Calendar.getInstance();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 프리미엄 가입</title>
<style>
#contentSection {
    width: 60% ;
    margin: 0 auto;
}
	#mainWrapper {
		width: 80%;
		margin: 0 auto;
	}
	
	input {
		-webkit-appearance : active !important;
		appearance: active !important;
	}
	#title{
font-size:30px !important;
}
.p{
font-weight:bold;
}
a{
text-decoration:none !important;
}
#detail{
font-size:20px !important;
}
.textP{
width:60% !important;
text-align:left !important;
}

#table{
font-size:13px !important;
}
</style>
</head>
<body>
<c:import url="../common/menuBar.jsp" />
	<section id="main">
		<div id="mainWrapper">
			  <div id="contentSection">
<center><h1 id="title">포인트결제</h1></center>
<hr>
<center><h1 id="detail"><b>프리미엄 가입 결제 세부 사항 </b></h1></center>
<br>
<form action="memberUpdatePreminum.tc" method="post">
<input type="hidden" name="memberId" value="${loginUser.memberId }">
<table id="table" class="table table-bordered">
	<tr>
		<th>기존 등급</th>
		<th>변경 등급</th>
		<th>프리미엄 가입 날짜</th>
		<th>프리미엄 마감 날짜</th>
			
	</tr>
	<tr>
			<td>일반 회원</td>
			<td>프리미엄</td>
			<td><%= cal.get(Calendar.YEAR) %>년 <%= cal.get(Calendar.MONTH)+1 %>월 <%= cal.get(Calendar.DATE) %>일</td>
			<td><%= cal.get(Calendar.YEAR) %>년 <%= cal.get(Calendar.MONTH)+2 %>월 <%= cal.get(Calendar.DATE) %>일</td>
	</tr>
</table>
<br><br>
	<table>
	<tr>
		<td class="p" >보유 포인트 : </td>
		<td class="textP" ><b><input type="hidden" id="havePoint"  value="${loginUser.point}" name="point" readonly>${loginUser.point} Point</b></td>
	</tr>
	<tr>
		<td  class="p">결제 예정 포인트 : </td>
		<td class="textP" >13000 Point</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
		<a href="paymentView.tc">포인트 충전하러 가기</a></td>
	</tr>
	<tr>
		<td colspan="2" align="center">위 거래 조건 확인 및 결제 진행 동의 &nbsp;<input type="checkbox" id="agree"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" onclick="return check()" value="결제"> &nbsp;<input type="reset" value="취소"></td>
	</tr>
		<tr><th colspan="2" align="center"><center><span id="message" style="color:blue;"></span></center></th></tr>
	</table>
	</form>
	</div>
	</div>
	</section>
	<script>
		 function check(){
			 if($("#havePoint").val() < 13000 ){
					$("#message").html("보유 포인트보다 결제 예정 포인트가 더 높습니다.");
					return false;}
			 else if($("#agree").is(":checked")){
				  alert("프리미엄 회원으로 정상 가입이 완료 되었습니다.");
				  return true;
			  }else{
				  alert("규정에 동의해야 가입이 가능 합니다.");
				  return false;
			  }
		   }
		 </script>
</body>
</html>