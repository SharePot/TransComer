<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 스터디 글 수정</title>
</head>


<body>
<c:import url="../common/menuBar.jsp" />
	 <div id="page-wrapper">
	   <!-- Main -->
        <section id="main">
	<h1 align="center">스터디 수정페이지</h1>
	
	<br><br>
	
	<form action="studyUpdate.tc" method="post" enctype="multipart/form-data">
		<input type="hidden" name="studyNo" value="${study.studyNo }">
		
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
				<c:forEach items="${flist }" var="f">
             		${f.fileName}<br>
             		<input type="file" name="reloadFile" class="form-control-file border" />
           		</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="hidden" name="memberId" value="${loginUser.memberId }" />
				<input type="submit" value="수정">&nbsp; &nbsp;
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	
	<p align="center">
		<c:url var="home" value="home.tc"/>
		<a href="${ home }">시작페이지로 이동</a>&nbsp;
		<c:url var="list" value="studyList.tc"/>
		<a href="${list }">목록 전체보기</a>
	</p>
<%-- 	<p align="center">
		<c:url var="home" value="home.kh"/>
		<a href="${ home }">Home</a>&nbsp;
		<c:url var="studyList" value="studyList.tc"/>
		<a href="${ studyList }">목록 </a>&nbsp;
		<!-- web에서 패킷이 전송될 때 그 패킷의 구조를 보면 header와 body로 나누어져 있습니다. 
		header에 다양한 정보가 포함되어있는데 예를들어 user-agent(브라우저) referer(이전페이지) 들이 있습니다.-->
		<c:url var="back" value="${header.referer }"/>
		<a href="${back }">이전</a>
	</p> --%>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	</section>
	</div>
</body>
</html>