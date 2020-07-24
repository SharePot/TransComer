<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 포인트 변동 목록</title>
</head>
<body>
<input type="hidden" value="${loginUser.memberId}" name="memberId">

<c:import url="../common/menuBar.jsp" />
	<section id="main">
		<div id="mainWrapper">
<center><h1>포인트 내역</h1></center>
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
    <!-- 페이징 처리 -->
		      <tr height="20">
		         <td align="center" colspan="9">
				   <!-- [이전] -->
				<c:if test="${pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${pi. currentPage > 1 }">
					<c:url var="before" value="pointRefundList.tc">
						<c:param name="page" value="${pi.currentPage - 1 }" />
					</c:url>
					<a href="${before }">[이전]</a> &nbsp;
				</c:if>
				
				
			<!-- 페이지 -->
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq currentPage }">
					<font color="red" size="4"><b>[${p }]</b></font>
				</c:if>
				<c:if test="${p ne currentPage }">
					<c:url var="pagination" value="pointRefundList.tc">
						<c:param name="page" value="${p }" />
					</c:url>
					<a href="${pagination }">${p }</a> &nbsp;
				</c:if>
			</c:forEach>

					
				
				
				
		       <!-- [다음] -->
		<c:if test="${pi.currentPage >= pi.maxPage }">
			[다음] &nbsp;
		</c:if>
		<c:if test="${pi. currentPage < pi.maxPage }">
			<c:url var="after" value="pointRefundList.tc">
				<c:param name="page" value="${pi.currentPage + 1 }" />
			</c:url>
			<a href="${after }">[다음]</a> &nbsp;
		</c:if>

         		 
         </td>
      </tr>
</table>
</div>
</section>

</body>
</html>