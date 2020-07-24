<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 포인트 환급 완료건</title>
</head>
<c:import url="../common/menuBar.jsp" />
<body>

<div id="page-wrapper">
		<section id="main">
		<div id="boardWrapper">
 <h2 align="center">포인트 환급 완료 목록</h2>
   <br><br><br>
   
   <h3 align="center">  총 포인트 환급 완료 건수 : ${pi.listCount }</h3>
   <br><br>
   
   <table align="center" border="1" >
    <tr>
         <th>No</th>
         <th>아이디</th>
         <th>환급 포인트</th>
         <th>은행명</th>
         <th>예금주</th>
         <th>계좌번호</th>
         <th>신청 날짜</th>
         <th>환급 여부</th>
         <th>확정 날짜</th>
      </tr>
      <c:forEach var="pointRefund" items="${list }">
         <tr>
         <c:if test="${pointRefund.refundYn ne 'W' } ">
		         <td >${pointRefund.refundNo }</td>
	         <td>${pointRefund.memberId }</td>
	         <td>${pointRefund.refundPoint }</td>
	      <c:forTokens var="accountInfo" items="${pointRefund.accountInfo }" delims="," varStatus="status">
					<c:if test="${status.index eq 0 }">
							<td>
								<input type="hidden" name="bank"  value="${accountInfo }" readonly size="6">
							${accountInfo }
							</td>
					</c:if>
					<c:if test="${status.index eq 1 }">
							<td><input type="hidden" name="accountOwner" readonly value="${accountInfo }">
							${accountInfo }
							</td>
					</c:if>
					<c:if test="${status.index eq 2}">
							<td><input type="hidden" name="account" readonly  value="${accountInfo }">
							${accountInfo }
							</td>
					</c:if>
				</c:forTokens>
	         <td>${pointRefund.refundRequestDate }</td>
	        <td>
	         <c:if test="${pointRefund.refundYn eq 'Y' }">
	         	확정
	         </c:if>
	         <c:if test="${pointRefund.refundYn eq 'W' }">
	         	대기
	         </c:if>
	         <c:if test="${pointRefund.refundYn eq 'N' }">
	         	반려
	         </c:if>
	         </td>
         <td>
         <c:if test= "${pointRefund.refundCompleteDate eq null }">
         	미확정
         </c:if>
         ${pointRefund.refundCompleteDate }</td>
         </c:if>
      </tr>
      </c:forEach>
      
      
      <!-- 페이징 처리 -->
		      <tr align="center" height="20">
		         <td colspan="6">
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
			<c:forEach var="p" begin="${pi.currentPage }" end="${pi.endPage }">
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
   </div>
   
</body>
</html>