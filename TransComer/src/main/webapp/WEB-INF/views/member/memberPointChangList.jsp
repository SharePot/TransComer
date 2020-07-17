<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>