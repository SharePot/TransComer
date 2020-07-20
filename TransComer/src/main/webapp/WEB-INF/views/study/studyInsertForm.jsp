<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스터디 글 작성</title>
</head>
<body>

	<c:import url="../common/menuBar.jsp" />
	 <div id="page-wrapper">
	   <!-- Main -->
        <section id="main">
	
	<br style="clear:both">
	<h1 align="center">스터디 글쓰기</h1>
	
	<br><br>
	<form action="studyInsert.tc" method="post" enctype="multipart/form-data">
		<table align="center" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="studyTitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="memberId" value="${loginUser.memberId }" readonly></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
				<select id="studyCategory" name="studyCategory">
            <option value="GROUP">그룹</option>
            <option value="PERSONAL">개인</option>
            <option value="PROJECT">프로젝트</option>
            <option value="ETC">기타</option>
         </select>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50" name="studyContent"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">&nbsp; &nbsp;
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

	<br><br><br><br><br><br><br><br><br><br><br><br>
	</section>
		</div>
</body>
</html>