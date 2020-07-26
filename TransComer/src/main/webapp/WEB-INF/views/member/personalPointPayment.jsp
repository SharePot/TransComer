<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 1:1 의뢰 결제</title>
<style>
	#mainWrapper {
		width: 80%;
		margin: 0 auto;
	}
	
	input {
		-webkit-appearance : active !important;
			appearance: active !important;
	}
	
</style>
</head>
<body>
<c:import url="../common/menuBar.jsp" />
	<section id="main">
		<div id="mainWrapper">
<center><h1>포인트결제</h1></center>
<hr>
<center>1:1 의뢰 결제 세부 사항</center>
<br><br>
<form action="personalPayUpdate.tc" method="post">
<input type="hidden" name="personalReqRep" value="${personalReqRep}">
<table border="1">
	<tr>
		<th>번역가</th>
		<th>의뢰 번역 언어</th>
		<th>의뢰 개발 언어</th>
		<th>의뢰 내용</th>
		<th>가격</th>
			
	</tr>
	<tr>
			<td>${personalReqRep.pRepTranslator }</td>
			<td>${personalReqRep.pReqTLang }</td>
			<td>${personalReqRep.pReqPLang }</td>
			<td>${personalReqRep.pReqDetail }</td>
			<td>${personalReqRep.pReqPrice }</td>
	</tr>
</table>

	<table>
	<tr>
		<td>보유 포인트</td>
		<td><input type="text" value="${loginUser.point}" name="point"  readonly></td>
	</tr>
	<tr>
		<td>결제 예정 포인트</td>
		<td><input type="text" value="${personalReqRep.pReqPrice }" name="pReqPrice" readonly ></td>
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
	</table>
	<input type="hidden" name="memberId" value="${personalReqRep.memberId }">
	<input type="hidden" name="pReqNo" value="${personalReqRep.pReqNo }">
	<input type="hidden" name="personalNo" value="${personalReqRep.personalNo }">
	</form>
	</div>
	</section>
	<script>
		 function check(){
			  if($("#agree").is(":checked")){
				  alert("정상적으로 결제가 완료 되었습니다.");
				  return true;
			  }else{
				  alert("규정에 동의해야 가입이 가능 합니다.");
				  return false;
			  }
		   }
		 </script>
</body>
</html>