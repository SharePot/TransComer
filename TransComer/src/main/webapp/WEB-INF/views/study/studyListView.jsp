<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/simpleListView.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 스터디 게시판</title>
</head>

<c:import url="../common/menuBar.jsp" />
<body>
	<div id="page-wrapper">
		<section id="main">
		<br>
			<div id="boardWrapper">
				<center><h1>스터디 게시판</h1></center><br><br><br>
				<table border="1" class="table table-hover">
					<tr>
						<th scope="col" id="no">번호</th>
						<th scope="col" id="lang">카테고리</th>
						<th scope="col" id="title">제목</th>
						<th scope="col" id="writer">작성자</th>
						<th scope="col" id="date">날짜</th>
						<th scope="col" id="count">조회수</th>
					</tr>
					<c:forEach var="study" items="${list }">
						<tr>
							<td class="studyNo">${study.studyNo }</td>
							<td>
								<c:set var="category" value="${study.studyCategory}" />
								<c:if test="${category eq 'PROJECT'}">프로젝트</c:if>
								<c:if test="${category eq 'GROUP'}">그룹</c:if>
								<c:if test="${category eq 'PERSONAL'}">개인</c:if> 
			         			<c:if test="${category eq 'ETC'}">개인</c:if>
			         		</td>
							<td id="commentCount">
								<c:if test="${ !empty loginUser }">
									<c:url var="studyDetail" value="studyDetail.tc">
										<c:param name="studyNo" value="${study.studyNo }" />
										<c:param name="page" value="${pi.studyCurrentPage }" />
									</c:url>
									<a href="${studyDetail }" id="simpleTitle">${study.studyTitle }(${study.commentCount })</a>
								</c:if>
								<c:if test="${ empty loginUser }">${study.studyTitle }</c:if>
							</td>
							<td>${study.memberId }</td>
							<td>${study.studyWriteDate }</td>
							<td>${study.studyCount }</td>
						</tr>
					</c:forEach>
				</table>

					<!-- 페이징 처리 -->
				<ul class="pagination justify-content-center">
					<!-- [이전] -->
					<c:if test="${pi.studyCurrentPage <= 1 }">
						<li class="page-item">
							<a class="page-link" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
						
					<c:if test="${pi. studyCurrentPage > 1 }">
						<c:url var="before" value="studyList.tc">
							<c:param name="page" value="${pi.studyCurrentPage - 1 }" />
						</c:url>
						<li class="page-item">
							<a href="${before}" class="page-link" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if> 
					<!-- 페이지 --> 
					<c:forEach var="p" begin="${pi.studyStartPage }" end="${pi.studyEndPage }">
						<c:if test="${p eq studyCurrentPage }">
							<li class="page-item active" aria-current="page">
								<a class="page-link">${p } <span class="sr-only">(current)</span></a>
							</li>
						</c:if>
							
						<c:if test="${p ne studyCurrentPage }">
							<c:url var="pagination" value="studyList.tc">
								<c:param name="page" value="${p }" />
							</c:url>
							<li class="page-item">
								<a href="${pagination }" class="page-link">${p }</a>
							</li>
						</c:if>
					</c:forEach>
						
					<!-- [다음] -->
					<c:if test="${pi.studyCurrentPage >= pi.studyMaxPage }">
						<li class="page-item">
							<a class="page-link" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${pi. studyCurrentPage < pi.studyMaxPage }">
						<c:url var="after" value="studyList.tc">
							<c:param name="page" value="${pi.studyCurrentPage + 1 }" />
						</c:url>
						<li class="page-item">
							<a href="${after}" class="page-link" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>&nbsp;
						</li>
					</c:if>
				</ul>

				<!-- 글쓰기 -->
				<div id="write" align="right">
					<c:if test="${ !empty loginUser }">
						<button align="right" id="writeBtn" onclick="location.href='studyWriterView.tc'">글쓰기</button>
					</c:if>
				</div>

				<div style="height: 50px;" id="searchBox">
					<form action="studySearch.tc" name="searchForm" method="get" id="searchForm" align="center">
						<select id="searchCondition" name="studySearchCondition">
							<option value="all"
								<c:if test="${search.studySearchCondition == 'all' }">selected</c:if>>전체</option>
							<option value="writer"
								<c:if test="${search.studySearchCondition == 'writer' }">selected</c:if>>작성자</option>
							<option value="title"
								<c:if test="${search.studySearchCondition == 'title' }">selected</c:if>>제목</option>
							<option value="content"
								<c:if test="${search.studySearchCondition == 'content' }">selected</c:if>>내용</option>
						</select>&nbsp;&nbsp;
						<input class="form-control" type="search" id="searchValue" name="studySearchValue" value="">
						&nbsp;&nbsp;<button id="searchBtn">검색</button>
					</form>
				</div>
			</div>
		</section>
	</div>

	<!--  <script>
  $( document ).ready(function() {
	        
	   		var studyNoList = [];
	   		$(".studyNo").each(function(i){
	   			studyNoList.push($(this).html());
	   			});
	   		
	   		var list=
	   		{
	   			 "commentCondition":"study",
	   				"studyNoList":studyNoList,
	   				"qnaNo":0,
	   				"shareNo":0
	   		};
	   		
	   		
	   		console.log(studyNoList);
	   		console.log(list); 
	   		 
	         $.ajax({
	            url:"commentList.tc",
	            data:{list:list},
	            dataType:"json",
	            success:function(data){ 
	            	if( data.length > 0 ) {
	            		console.log(data[i])
	            		   for ( var i in data ) {
	            		  $td = $("#commentCount");
	    	              $td.append("("+data[i]+")");
	            	}
	            }
	             
	         }
   })
   })
   </script>  -->
</body>
</html>