<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 프리미엄 가입</title>
<style>
	#mainWrapper {
		width: 80%;
		margin: 0 auto;
	}
	
	input {
		-webkit-appearance : active !important;
	}
</style>
</head>
<body>
<c:import url="../common/menuBar.jsp" />
	<section id="main">
		<div id="mainWrapper">
		 <h1 align="center">프리미엄 회원 가입</h1><br>
		 <hr>
		 
		 <center><p style="font-size:1px;">프리미엄 회원으로 가입하시면,  한달 간 자료 공유 게시판 글을 무제한으로 조회 가능 합니다.</p></center>
		 <div color="gray" width="500px" height="500px">
		 <center><h1><b>규정</b></h1></center>
		 <table>
		 <tr><td colspan="2" align="right">확인 및 동의 여부</td></tr>
		 <tr>
		 	<td>결제 후 환불은 불가 합니다.</td>
		 	<td><input type="checkbox" name="ch"></td>
		 </tr>
		 <tr>
		 	<td>아이디 공유가 발견 되면 그 즉시 프리미엄 자격이 박탈됩니다.</td>
		 	<td><input type="checkbox" name="ch"></td>
		 </tr>
		 <tr>
		 	<td>기한이 지나면 자동으로 일반 회원으로 변경 됩니다.</td>
		 	<td><input type="checkbox" name="ch"></td>
		 </tr>
		 
		 <tr><td colspan="2" align="center">전체 동의 &nbsp;<input type="checkbox" name="all" id="all"></td></tr>
		 <tr><td colspan="2" align="center">위 사항을 모두 동의해야 프리미엄 회원 가입이 가능 합니다.</td></tr>
		 </table>
		 </div>
		 <div align="center">
		 <form action="premiumPayment.tc" method="post">
		 <input type="submit"  onclick="return check()" value="가입" >&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="취소">
		 </form>
		 </div>
		   </div>
		   </section>
		   
		   <script>
		   $(document).ready(function(){
			   $("#all").click(function(){
				if($("#all").prop("checked")){
					$("input[name=ch]").prop("checked",true);
				}else{
					$("input[name=ch]").prop("checked",false);
				}	   
			   })
		   })
		   
		 function check(){
			  if(($("input[name=ch]").is(":checked") )&& ($("#all").is(":checked"))){
				  return true;
			  }else{
				  alert("모든 규정에 동의해야 가입이 가능 합니다.");
				  return false;
			  }
		   }
		   
		   </script>

</body>

</html>