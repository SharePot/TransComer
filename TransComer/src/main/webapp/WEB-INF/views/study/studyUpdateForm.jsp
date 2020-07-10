<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 작성</title>
</head>
<body>
	<c:import url="../common/menuBar.jsp" />
	<br style="clear:both">
	<h1 align="center">스터디 수정페이지</h1>
	
	<br><br>
	
	<form action="studyUpdate.tc" method="post" enctype="multipart/form-data">
		<input type="hidden" name="studyNo" value="${study.studyNo }">
		<input type="hidden" name="studyFilePath" value="${study.studyFilePath }">
		
		<table align="center" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="studyTitle" value="${study.studyTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
				<input type="text" name="studyWriter" value="${study.memberId }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
				 <c:set var="studyContent" value="${fn:replace(study.studyContent,'<br>','') }"/>
				<textarea rows="7" cols="50" name="studyContent">${studyContent }</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
				<input type="file" name="reloadFile">
				<c:if test="${! empty study.studyFilePath }">
					<a href="${contextPath }/resources/studyUploadFiles/${study.studyFilePath }">
					<%-- ${contextPath } context root가져오는  내장객체 쓰는거임 --%>
					${study.studyFilePath }
					</a>
				</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="수정">&nbsp; &nbsp;
				</td>
			</tr>
		</table>
	</form>
	
	<p align="center">
		<c:url var="home" value="home.kh"/>
		<a href="${ home }">Home</a>&nbsp;
		<c:url var="studyList" value="studyList.tc"/>
		<a href="${ studyList }">목록 </a>&nbsp;
		<!-- web에서 패킷이 전송될 때 그 패킷의 구조를 보면 header와 body로 나누어져 있습니다. 
		header에 다양한 정보가 포함되어있는데 예를들어 user-agent(브라우저) referer(이전페이지) 들이 있습니다.-->
		<c:url var="back" value="${header.referer }"/>
		<a href="${back }">이전</a>
	</p>
	<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>