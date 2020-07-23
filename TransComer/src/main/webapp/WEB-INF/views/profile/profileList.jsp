<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SharePot - 회원 프로필 목록</title>
<link rel="stylesheet" href="resources/css/simpleListView.css" />
</head>
<c:import url="../common/menuBar.jsp" />
<body>
	<div id="page-wrapper">
	    <section id="main">
	        <div id="boardWrapper">
	        	<h1>회원 프로필 목록</h1><br>
	        	<table>
	        		<tr>
	        			<td>번호</td>
	        			<td>회원 아이디</td>
	        			<td>공개여부</td>
	        		</tr>
	        		<c:forEach var="pf" items="${pfList }">
		        		<tr>
		        			<td>${pf.profileNo }</td>
		        			<td><a href="profileDetail.tc?memberNo=${pf.memberNo }">${pf.memberId }</a></td>
		        			<td>
		        				<c:if test="${pf.profileStatus == 'OPEN'}">
		        					공개
		        				</c:if>
		        				<c:if test="${pf.profileStatus == 'PRIVATE'}">
		        					미공개
		        				</c:if>
		        			</td>
		        		</tr>
	        		</c:forEach>
	        		<tr align="center" height="20">
						<td colspan="3">
						
							<!-- [이전] -->
							<c:if test="${pi.currentPage <= 1 }">[이전] &nbsp;</c:if>
							<c:if test="${pi.currentPage > 1 }">
								<c:url var="before" value="profileList.tc">
									<c:param name="page" value="${pi.currentPage - 1 }" />
								</c:url>
								<a href="${before}">[이전]</a>&nbsp;
							</c:if>
							
							<!-- 페이지 -->
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<c:if test="${p eq currentPage }">
									<font color="red"><b>[${p }]</b></font>
								</c:if>
								<c:if test="${p ne currentPage }">
									<c:url var="pagination" value="profileList.tc">
										<c:param name="page" value="${p }" />
									</c:url>
									<a href="${pagination }">${p }</a>&nbsp;
								</c:if>
							</c:forEach>
							
							<!-- [다음] -->
							<c:if test="${pi.currentPage >= pi.maxPage }">[다음] &nbsp;</c:if>
							<c:if test="${pi.currentPage < pi.maxPage }">
								<c:url var="after" value="profileList.tc">
									<c:param name="page" value="${pi.currentPage + 1 }" />
								</c:url>
								<a href="${after}">[다음]</a>&nbsp;
							</c:if>
							
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
								<form action="profileSearch.tc" name="searchForm" method="get">
									<select id="searchCondition" name="searchCondition">
										<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
										<option value="id" <c:if test="${search.searchCondition == 'id' }">selected</c:if>>회원</option>
										<option value="no" <c:if test="${search.searchCondition == 'no' }">selected</c:if>>번호</option>
										<option value="status" <c:if test="${simpleSearch.searchCondition == 'status' }">selected</c:if>>공개여부</option>
									</select>
									<input type="search" name="searchValue" value="" id="searchValue">
									<button>검색</button><br>
								</form>
						</td>
					</tr>
	        	</table>
			</div>
		</section>
	</div>            
</body>
</html>