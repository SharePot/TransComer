<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세</title>
</head>
<body>

<div id="page-wrapper">
		<section id="main">
		<div id="boardWrapper">
 <c:import url="../common/menuBar.jsp" />   
<center><h1>포인트 내역</h1></center>
<hr>

<table>
	<tr>
		<th>No</th>
		<th>날짜</th>
		<th>내역</th>
		<th>금액</th>
	</tr>
 <c:forEach var="pointRefund" items="${list }">
 <tr>
 <td></td>
 </tr>
 </c:forEach>

</table>
</div>
</section>
</div>

</body>
</html>