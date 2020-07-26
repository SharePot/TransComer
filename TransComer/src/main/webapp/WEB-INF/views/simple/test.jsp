<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>SharePot</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/rank.css" />
</head>
<c:import url="../common/menuBar.jsp" />
<body id="page-wrapper">
	<section id="main">
		<div id="rankSection">
			<h1 id="rankTitle">HOT RANKING</h1>
				<table id="rankWrapper">
			                
			                <tr>
			                    <td colspan="4">
			                        <h3>채택 랭킹</h3>
			                    </td>
			                </tr>
			                <tr>
								<c:forEach var="rank" items="${rAc }" begin="0" end="3" varStatus="status">
				                    <td class="testTd">
				                        
				                        <div class="imgBox">
				                            <img src="/resources/uploadFiles/${rank.profile.profileFilePath }" class="img">
				                        </div>
				                        <label>${status.count} ${rank.member.memberId }</label><br>
	                                    <label>총 채택 수 : ${rank.member.adoptCount }</label>
				                        <br>
				                        <button class="btn btn-secondary btn-sm">문의하기</button>
				                        
				                        
				                    </td>
								</c:forEach>
			                </tr>
			                <tr>
			                    <td colspan="4">
			                        <h3>평점 랭킹</h3>
			                    </td>
			                </tr>
	                        <tr>
	                        	<c:forEach var="star" items="${star }" begin="0" end="3" varStatus="status">
	                        		<td class="testTd">
		                                <div class="imgBox">
				                            <img src="/resources/uploadFiles/${star.profile.profileFilePath } class="img">
				                        </div>
				                        <label>${status.count} ${star.review.revTargetMemberId }</label><br>
	                                    <label>사용 가능 언어: </label><br>
	                                    <label>누적 번역 수: </label><br>
	                                    <label>평점: </label>
				                        <br>
				                        <button class="btn btn-secondary btn-sm">문의하기</button>
	                            	</td>
				                    <input type="hidden" id="avgMTest" value="${rank.review.revTargetMemberId }">
				                    <input type="hidden" id="avgSTest" value="${rank.review.starRage }">
	                            </c:forEach>
	                        </tr>
			                
			            </table>
		</div>
		
		<script>
		
		
		
		</script>

	</section>
</body>
</html>