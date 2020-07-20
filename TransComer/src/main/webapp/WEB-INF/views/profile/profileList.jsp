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
		        			<c:url var="pfDetail" value="profileDetail.tc">
								<c:param name="memberNo" value="${pf.memberNo }" />
							</c:url>
		        			<td><a href="${pfDetail }">${pf.memberId }</a></td>
		        			<td>
		        				<c:if test="${pf.profileStatus eq 'OPEN'}">
		        					공개
		        				</c:if>
		        				<c:if test="${pf.profileStatus eq 'PRIVATE'}">
		        					미공개
		        				</c:if>
		        			</td>
		        		</tr>
	        		</c:forEach>
	        	</table>
			</div>
		</section>
	</div>            
</body>
</html>