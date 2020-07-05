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
 <h1 align="center">게시글 목록</h1>
   
   <h3 align="center">
      총 개시글 갯수 : ${pi.listCount }
      <c:if test="${ !empty loginUser }">
         <button onclick="location.href='#';">글쓰기</button>
      </c:if>
   </h3>
   
   <table align="center" border="1" cellspacing="0" width="700" id="tb">
      <tr>
         <th>번호</th>
         <th width="300">제목</th>
         <th>작성자</th>
         <th>날짜</th>
         <th>조회수</th>
         <th>첨부파일</th>
      </tr>
      <c:forEach var="study" items="${list }">
         <tr>
		         <td align="center">${study.studyNo }</td>
		<td align="left">
			<c:if test="${ !empty loginUser }">
				<c:url var="studyDetail" value="studyDetail.tc">
					<c:param name="studyNo" value="${study.studyNo }" />
					<c:param name="page" value="${pi.currentPage }" />					
				</c:url>					
				<a href="${studyDetail }">${study.studyTitle }</a>
			</c:if>
			<c:if test="${ empty loginUser }">
				${study.studyTitle }
			</c:if>
		</td>

         <td align="center">${study.memberId }</td>
         <td align="center">${study.studyWriteDate }</td>
         <td align="center">${study.studyCount }</td>
         <td align="center">
            <c:if test="${ !empty study.originalFileName }">
               ◎
            </c:if>
            <c:if test="${ empty study.originalFileName }">
               &nbsp;
            </c:if>
         </td>
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
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
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