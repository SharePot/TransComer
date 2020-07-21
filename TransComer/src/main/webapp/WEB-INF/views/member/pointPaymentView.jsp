<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 1:1 의뢰 결제</title>
</head>
<body>
<center><h1>포인트결제</h1></center>
<hr>

<center>1:1 의뢰 결제 세부 사항</center>
<form action="" method="post">
<table>
	<tr>
		<th>번역가</th>
		<th>의뢰 번역 언어</th>
		<th>의뢰 개발 언어</th>
		<th>의뢰 내용</th>
		<th>가격</th>
			
	</tr>
	<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
	</tr>
</table>

	<table>
	<tr>
		<td>보유 포인트</td>
		<td><input type="text" value="${loginUser.point}"></td>
	</tr>
	<tr>
		<td>결제 예정 포인트</td>
		<td></td>
	</tr>
	<tr>
		<td colspan="2"><input type="button"></td>
	</tr>
	<tr>
		<td>위 거래 조건 확인 및 결제 진행 동의<br> <input type="checkbox"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="결제"><input type="reset" value="취소"></td>
	</tr>
	</table>
	</form>

</body>
</html>