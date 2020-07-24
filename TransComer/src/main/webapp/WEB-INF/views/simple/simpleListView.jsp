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
		<br>
			<div id="boardWrapper">
				<h1>단순의뢰</h1><br>
				
				<table border="1" class="table table-hover">
					<tr>
						<th scope="col" id="no">번호</th>
						<th scope="col" id="lang">분류</th>
						<th scope="col" id="title">제목</th>
						<th scope="col" id="adopt">채택</th>
						<th scope="col" id="writer">작성자</th>
						<th scope="col" id="count">조회수</th>
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
									<a href="${sReqDetail}" id="simpleTitle">${sReq.simpleTitle }</a>
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
					</table>
					
					<!-- 페이지 네이션 -->
					<ul class="pagination justify-content-center">
					
						<!-- [이전] -->
						<c:if test="${spi.spCurrentPage <= 1 }">
							<li class="page-item">
								<a class="page-link" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						
						<c:if test="${spi.spCurrentPage > 1 }">
							<c:url var="before" value="sReqListView.tc">
								<c:param name="spPage" value="${spi.spCurrentPage - 1 }" />
							</c:url>
							<li class="page-item">
								<a href="${before}" class="page-link" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
							
						<!-- 페이지 -->
						<c:forEach var="p" begin="${spi.spStartPage }" end="${spi.spEndPage }">
							<c:if test="${p eq spCurrentPage }">
								<li class="page-item active" aria-current="page">
									<a class="page-link">${p } <span class="sr-only">(current)</span></a>
								</li>
							</c:if>
							
							<c:if test="${p ne spCurrentPage }">
								<c:url var="pagination" value="sReqListView.tc">
									<c:param name="spPage" value="${p }" />
								</c:url>
								<li class="page-item">
									<a href="${pagination }" class="page-link">${p }</a>
								</li>
							</c:if>
						</c:forEach>
							
						<!-- [다음] -->
						<c:if test="${spi.spCurrentPage >= spi.spMaxPage }">
							<li class="page-item">
								<a class="page-link" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
							<c:if test="${spi.spCurrentPage < spi.spMaxPage }">
								<c:url var="after" value="sReqListView.tc">
									<c:param name="spPage" value="${spi.spCurrentPage + 1 }" />
								</c:url>
								<li class="page-item">
									<a href="${after}" class="page-link" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>&nbsp;
								</li>
						</c:if>
					</ul>
					
					<!-- 글쓰기 -->
					<div id="write" align="right">
						<c:if test="${ !empty loginUser }">
							<c:url var="simpleWrite" value="sReqInsertView.tc" />
							<button align="right" id="writeBtn" onclick="location.href='${simpleWrite}'">글쓰기</button>
						</c:if>
					</div>
					
					<div style="height: 50px;" id="searchBox">
						<form action="sReqSearch.tc" name="searchForm" method="get" align="center">
							<select id="searchCondition" name="searchCondition" class="selectpicker">
								<option value="all" <c:if test="${simpleSearch.searchCondition == 'all' }">selected</c:if>>전체</option>
								<option value="writer" <c:if test="${simpleSearch.searchCondition == 'writer' }">selected</c:if>>작성자</option>
								<option value="title" <c:if test="${simpleSearch.searchCondition == 'title' }">selected</c:if>>제목</option>
								<option value="content" <c:if test="${simpleSearch.searchCondition == 'content' }">selected</c:if>>내용</option>
							</select>
							<input class="form-control" type="search" name="searchValue" value="" id="searchValue">
							<button id="searchBtn">검색</button><br>
						</form>
					</div>
			</div>
		</section>
	</div>
	
	
</body>
</html>