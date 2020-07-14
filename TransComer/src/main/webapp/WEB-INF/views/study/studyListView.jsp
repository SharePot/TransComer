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
      총 게시글 갯수 : ${pi.studyListCount }
      <c:if test="${ !empty loginUser }">
         <button onclick="location.href='studyWriterView.tc'">글쓰기</button>
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
					<c:param name="page" value="${pi.studyCurrentPage }" />					
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
            <c:if test="${ !empty study.studyFilePath }">
               ◎
            </c:if>
            <c:if test="${ empty study.studyFilePath }">
               &nbsp;
            </c:if>
         </td>
      </tr>
      </c:forEach>
      
      
      <!-- 페이징 처리 -->
		      <tr align="center" height="20">
		         <td colspan="6">
				   <!-- [이전] -->
				<c:if test="${pi.studyCurrentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${pi. studyCurrentPage > 1 }">
					<c:url var="before" value="blist.kh">
						<c:param name="page" value="${pi.studyCurrentPage - 1 }" />
					</c:url>
					<a href="${before }">[이전]</a> &nbsp;
				</c:if>
				
				
			<!-- 페이지 -->
			<c:forEach var="p" begin="${pi.studyCurrentPage }" end="${pi.studyEndPage }">
				<c:if test="${p eq studyCurrentPage }">
					<font color="red" size="4"><b>[${p }]</b></font>
				</c:if>
				<c:if test="${p ne studyCurrentPage }">
					<c:url var="pagination" value="blist.kh">
						<c:param name="page" value="${p }" />
					</c:url>
					<a href="${pagination }">${p }</a> &nbsp;
				</c:if>
			</c:forEach>

					
				
				
				
		       <!-- [다음] -->
		<c:if test="${pi.studyCurrentPage >= pi.studyMaxPage }">
			[다음] &nbsp;
		</c:if>
		<c:if test="${pi. studyCurrentPage < pi.studyMaxPage }">
			<c:url var="after" value="blist.kh">
				<c:param name="page" value="${pi.studyCurrentPage + 1 }" />
			</c:url>
			<a href="${after }">[다음]</a> &nbsp;
		</c:if>

         		 
         </td>
      </tr>
   </table>
   
    <div id="searchArea" align="center">
      <form action="studySearch.tc" name="searchForm" method="get">
         <select id="studySearchCondition" name="studySearchCondition">
            <option value="all" <c:if test="${search.studySearchCondition == 'all' }">selected</c:if>>전체</option>
            <option value="writer" <c:if test="${search.studySearchCondition == 'writer' }">selected</c:if>>작성자</option>
            <option value="title" <c:if test="${search.studySearchCondition == 'title' }">selected</c:if>>제목</option>
            <option value="content" <c:if test="${search.studySearchCondition == 'content' }">selected</c:if>>내용</option>
         </select>
         <input type="search" name="studySearchValue" value="">
         <button>검색</button><br>
         <input type="checkbox" name="studyExistFile" <c:if test="${!empty search.studyExistFile }">checked</c:if>>
      </form>
   </div>
   
</body>
</html>