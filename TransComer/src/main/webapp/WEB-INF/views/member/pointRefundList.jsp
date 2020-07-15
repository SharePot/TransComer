<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1 align="center">포인트 환급 신청 목록</h1>
   
   <h3 align="center">
      총 포인트 환급 신청 건수 : ${pi.listCount }
   </h3>
   
   <table align="center" border="1" cellspacing="0" width="700" id="tb">
      <tr>
         <th>번호</th>
         <th width="300">고객 아이디</th>
         <th>환급 신청 포인트</th>
         <th>은행명</th>
         <th>계좌주</th>
         <th>계좌번호</th>
         <th>환급 신청 날짜</th>
         <th>환급 여부</th>
         <th>환급 확정 날짜</th>
      </tr>
      <c:forEach var="pointRefund" items="${list }">
         <tr>
		         <td align="center">${pointRefund.refundNo }</td>
	         <td align="center">${pointRefund.memberId }</td>
	         <td align="center">${pointRefund.refundPoint }</td>
	         <c:forTokens var="accountInfo" items="${pointRefund.accountInfo }" delims="," varStatus="status">
					<c:if test="${status.index eq 0 }">
							<td>
								<input type="text" name="bank"  value="${accountInfo }" readonly size="6">
							</td>
					</c:if>
					<c:if test="${status.index eq 1 }">
							<td><input type="text" name="accountOwner" readonly value="${accountInfo }"></td>
					</c:if>
					<c:if test="${status.index eq 2}">
							<td><input type="text" name="account" readonly  value="${accountInfo }"></td>
						
					</c:if>
				</c:forTokens>
	         <td align="center">${pointRefund.refundRequestDate }</td>
	         <td align="center">
	         <c:if test="${pointRefund.refundYn eq 'Y' }">
	         	확정
	         </c:if>
	         <c:if test="${pointRefund.refundYn eq 'W' }">
	         		<c:url var="pointRefundCheck" value="pointRefundCheckView.tc">
					<c:param name="refundNo" value="${pointRefund.refundNo }" />
				</c:url>					
				<a href="${pointRefundCheck }">대기</a>
	         </c:if>
	         <c:if test="${pointRefund.refundYn eq 'N' }">
	         	반려
	         </c:if>
	         </td>
         <td align="center">
         <c:if test= "${pointRefund.refundCompleteDate eq null }">
         	미확정
         </c:if>
         ${pointRefund.refundCompleteDate }</td>
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
					<c:url var="before" value="blist.kh">
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
					<c:url var="pagination" value="blist.kh">
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
			<c:url var="after" value="blist.kh">
				<c:param name="page" value="${pi.currentPage + 1 }" />
			</c:url>
			<a href="${after }">[다음]</a> &nbsp;
		</c:if>

         		 
         </td>
      </tr>
   </table>
   
   
</body>
</html>