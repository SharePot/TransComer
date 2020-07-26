<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 포인트 변동 목록</title>
<style>
#contentSection {
    width: 60% ;
    margin: 0 auto;
}
#title{
font-size:30px !important;
}
th{
font-weight:bold;
}
#userPoint{
font-weight:bold;
font-size:20px;
}
</style>
</head>
<body>
<input type="hidden" value="${loginUser.memberId}" name="memberId">

<c:import url="../common/menuBar.jsp" />
	<section id="main">
		<div id="mainWrapper">
		  <div id="contentSection">
<center><h1 id="title">포인트 내역</h1></center>
<hr>
<table>
	<tr>
		<th>No</th>
		<th>날짜</th>
		<th>내역</th>
		<th>금액</th>
		<th>충전/차감</th>
	</tr>
 <c:forEach var="point" items="${list }">
 <tr>
 <td>${point.pointNo}</td>
 <td>${point.pointUpdateDate}</td>
 <td>${point.pointContent}</td>
 <td>${point.pointAmount}</td>
 <c:if test="${point.pointStatus eq 'ADD'}"><td color="blue">충전</td></c:if>
<c:if test="${point.pointStatus ne 'ADD'}"><td color="red">차감</td></c:if>

 </tr>
 </c:forEach>
 <tr><td colspan="6" align="center" id="userPoint">잔여 포인트 : ${loginUser.point } 포인트</td></tr>
  </table>
 <!-- 페이징 처리 -->
				<ul class="pagination justify-content-center">
					<!-- [이전] -->
					<c:if test="${pi.currentPage <= 1 }">
						<li class="page-item">
							<a class="page-link" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
						
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="before" value="pointChangeMemberList.tc">
							<c:param name="page" value="${pi.currentPage - 1 }" />
								<c:param name="memberId" value="${loginUser.memberId }" />
						</c:url>
						<li class="page-item">
							<a href="${before}" class="page-link" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if> 
					<!-- 페이지 --> 
					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq currentPage }">
							<li class="page-item active" aria-current="page">
								<a class="page-link">${p } <span class="sr-only">(current)</span></a>
							</li>
						</c:if>
							
						<c:if test="${p ne currentPage }">
							<c:url var="pagination" value="pointChangeMemberList.tc">
								<c:param name="page" value="${p }" />
								<c:param name="memberId" value="${loginUser.memberId }" />
							</c:url>
							<li class="page-item">
								<a href="${pagination }" class="page-link">${p }</a>
							</li>
						</c:if>
					</c:forEach>
						
					<!-- [다음] -->
					<c:if test="${pi.currentPage >= pi.maxPage }">
						<li class="page-item">
							<a class="page-link" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<c:url var="after" value="List.tc">
							<c:param name="page" value="${pi.currentPage + 1 }" />
						</c:url>
						<li class="page-item">
							<a href="${after}" class="page-link" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>&nbsp;
						</li>
					</c:if>
				</ul> 

</div>
</div>
</section>

</body>
</html>