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
								<td>k</td>
								<td>${sReq.simpleWriter }</td>
								<td>${sReq.simpleCount }</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
		</section>
	</div>
</body>
</html>