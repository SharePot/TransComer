<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/simpleListView.css" />
<meta charset="UTF-8">
<title> SharePot - 단순의뢰 </title>
</head>
<c:import url="../common/menuBar.jsp" />
<body>
	<div id="page-wrapper">
		<section id="main">
			<div id="boardWrapper">
				<h1>단순의뢰</h1><br>
				<c:if test="${!empty loginUser }">
					<c:url var="simpleWrite" value="sReqInsertView.tc" />
					<a  href="${simpleWrite }" >글쓰기</a>
				</c:if>
				<table border="1">
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>채택</th>
						<th>작성자</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="sReq" items="${sReqList }">
						<tr>
							<c:if test="${sReq.simpleDStatus eq 'N' }">
								<td>${sReq.simpleNo }</td>
								<td>${sReq.simplePLang }, ${sReq.simpleTLang }</td>
								<td>
									<c:url var="sReqDetail" value="sReqDetail.tc">
										<c:param name="simpleNo" value="${sReq.simpleNo }" />
									</c:url>
									<a href="${sReqDetail}">${sReq.simpleTitle }</a>
								</td>
								<c:if test="${sReq.simpleAStatus eq 'Y' }">
									<td>O</td>
								</c:if>
								<c:if test="${sReq.simpleAStatus eq 'N' }">
									<td>X</td>
								</c:if>
								<td>${sReq.simpleWriter }</td>
								<td>${sReq.simpleCount }</td>
							</c:if>
						</tr>
					</c:forEach>
					<tr align="center" height="20">
						<td colspan="6">
						
							<!-- [이전] -->
							<c:if test="${pi.spCurrentPage <= 1 }">[이전] &nbsp;</c:if>
							<c:if test="${pi.spCurrentPage > 1 }">
								<c:url var="before" value="blist.kh">
									<c:param name="spPage" value="${pi.spCurrentPage - 1 }" />
								</c:url>
								<a href="${before}">[이전]</a>&nbsp;
							</c:if>
							
							<!-- 페이지 -->
							<c:forEach var="p" begin="${pi.spStartPage }" end="${pi.spEndPage }">
								<c:if test="${p eq spCurrentPage }">
									<font color="red" size="4"><b>[${p }]</b></font>
								</c:if>
								<c:if test="${p ne spCurrentPage }">
									<c:url var="pagination" value="sReqListView.tc">
										<c:param name="spPage" value="${p }" />
									</c:url>
									<a href="${pagination }">${p }</a>&nbsp;
								</c:if>
							</c:forEach>
							
							<!-- [다음] -->
							<c:if test="${pi.spCurrentPage <= pi.spMaxPage }">[다음] &nbsp;</c:if>
							<c:if test="${pi.spCurrentPage > pi.spMaxPage }">
								<c:url var="after" value="sReqListView.tc">
									<c:param name="spPage" value="${pi.spCurrentPage + 1 }" />
								</c:url>
								<a href="${after}">[다음]</a>&nbsp;
							</c:if>
							
						</td>
					</tr>
					<tr>
						<td colspan="6">
								<form action="sReqSearch.tc" name="searchForm" method="get">
									<select id="searchCondition" name="searchCondition">
										<option value="all" <c:if test="${simpleSearch.searchCondition == 'all' }">selected</c:if>>전체</option>
										<option value="writer" <c:if test="${simpleSearch.searchCondition == 'writer' }">selected</c:if>>작성자</option>
										<option value="title" <c:if test="${simpleSearch.searchCondition == 'title' }">selected</c:if>>제목</option>
										<option value="content" <c:if test="${simpleSearch.searchCondition == 'content' }">selected</c:if>>내용</option>
									</select>
									<input type="search" name="searchValue" value="">
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