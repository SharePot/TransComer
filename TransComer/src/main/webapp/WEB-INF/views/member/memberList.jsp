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
 <h1 align="center">전체 회원 목록</h1>
   
   <h3 align="center">
      총 회원 수 : ${pi.listCount }
   </h3>
   
   <table align="center" border="1" cellspacing="0" width="700" id="tb">
      <tr>
         <th>NO</th>
         <th width="300">아이디</th>
         <th>이름</th>
         <th>이메일</th>
         <th>은행명</th>
         <th>계좌주</th>
         <th>계좌번호</th>
         <th>블랙리스트</th>
         <th>프리미엄 여부</th>
      </tr>
      <c:forEach var="member" items="${list }">
         <tr>
		         <td align="center">${member.memberNo }</td>
	         <td align="center">
	         	<c:url var="memberDetail" value="memberDetail.tc">
					<c:param name="memberNo" value="${member.memberNo }" />
				</c:url>					
				<a href="${memberDetail}">${member.memberId }</a>
	        </td>
	         <td align="center">${member.memberName }</td>
	         <td align="center">${member.email }</td>
	        <c:if test="${member.account eq null }">
	        <td></td>
	        <td></td>
	        <td> </td>
	        </c:if>
	            <c:if test="${member.account ne null }">
	         <c:forTokens var="accountInfo" items="${member.account }" delims="," varStatus="status">
					<c:if test="${status.index eq 0 }">
							<td><input type="text" name="bank"  value="${accountInfo }" readonly size="6"></td>
					</c:if>
					<c:if test="${status.index eq 1 }">
							<td><input type="text" name="accountOwner" readonly value="${accountInfo }"></td>
					</c:if>
					<c:if test="${status.index eq 2}">
							<td><input type="text" name="account" readonly  value="${accountInfo }"></td>
					</c:if>
				</c:forTokens>
				</c:if>
	         <td align="center">
	         <c:if test="${member.status eq 'BLACKLIST' }">
	         	X
	         </c:if>
	         <c:if test="${member.status ne 'BLACKLIST' }">
	         O
	         </c:if>
	         </td>
	           <td align="center">
	         <c:if test="${member.status eq 'PREMIUM' }">
	         	O
	         </c:if>
	         <c:if test="${member.status ne 'PREMIUM' }">
	         X
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