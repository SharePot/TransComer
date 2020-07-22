<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/studyListView.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> SharePot - 스터디 게시판 </title>
</head>

<c:import url="../common/menuBar.jsp" />
<body>

<div id="page-wrapper">
		<section id="main">
		<div id="boardWrapper">
 <h2 align="center">스터디 게시판</h2>
   <br><br><br>
   
    
   
   <table align="center" border="1">
      <tr>
         <th>번호</th>
         <th>카테고리</th>
         <th>제목</th>
         <th>작성자</th>
         <th>날짜</th>
         <th>조회수</th>
      </tr>
      <c:forEach var="study" items="${list }">
         <tr>
		         <td class="studyNo">${study.studyNo }</td>
		         <td>
			         <c:set var="category" value="${study.studyCategory}" />
			         <c:if test="${category eq 'PROJECT'}">
			       		  프로젝트
			         </c:if>
			         <c:if test="${category eq 'GROUP'}">
			       		  그룹
			         </c:if>
			         <c:if test="${category eq 'PERSONAL'}">
			       		  개인
			         </c:if>
			         <c:if test="${category eq 'ETC'}">
			       		  개인
			         </c:if>
			      </td>
		<td id="commentCount">
			<c:if test="${ !empty loginUser }">
				<c:url var="studyDetail" value="studyDetail.tc">
					<c:param name="studyNo" value="${study.studyNo }" />
					<c:param name="page" value="${pi.studyCurrentPage }" />					
				</c:url>					
				<a href="${studyDetail }">${study.studyTitle } (${study.commentCount })</a>
			</c:if>
			<c:if test="${ empty loginUser }">
				${study.studyTitle }
			</c:if>
		</td>

         <td >${study.memberId }</td>
         <td >${study.studyWriteDate }</td>
         <td>${study.studyCount }</td>
      </tr>
      </c:forEach>
      
      
      <!-- 페이징 처리 -->
		      <tr align="center" height="20">
		         <td colspan="6">
				   <!-- [이전] -->
				<c:if test="${pi.studyCurrentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${pi. studyCurrentPage > 1 }">
					<c:url var="before" value="studyList.tc">
						<c:param name="page" value="${pi.studyCurrentPage - 1 }" />
					</c:url>
					<a href="${before }">[이전]</a> &nbsp;
				</c:if>
				
				
			<!-- 페이지 -->
			<c:forEach var="p" begin="${pi.studyStartPage }" end="${pi.studyEndPage }">
				<c:if test="${p eq studyCurrentPage }">
					<font color="red" size="4"><b>[${p }]</b></font>
				</c:if>
				<c:if test="${p ne studyCurrentPage }">
					<c:url var="pagination" value="studyList.tc">
						<c:param name="page" value="${p }" />
					</c:url>
					<a href="${pagination }">${p }</a> &nbsp;
				</c:if>
			</c:forEach>

					
				
				
				
		       <!-- [다음] -->
		<c:if test="${pi.studyCurrentPage >= pi.studyMaxPage }">
			[다음] &nbsp;
		</c:if>
		<c:if test="${pi. studyCurrentPage < pi.studyMaxPage }">
			<c:url var="after" value="studyList.tc">
				<c:param name="page" value="${pi.studyCurrentPage + 1 }" />
			</c:url>
			<a href="${after }">[다음]</a> &nbsp;
		</c:if>

         		 
         </td>
      </tr>
   </table>
      <br>
      <div id="write" align="right" >
        <c:if test="${ !empty loginUser }">
         <button align="right"  onclick="location.href='studyWriterView.tc'">글쓰기</button>
      </c:if>
      </div>
      <br>
      
   
      <form action="studySearch.tc" name="searchForm" method="get" id="searchForm" >
         <div id="searchArea" align="center">
         <select id="studySearchCondition" name="studySearchCondition">
            <option value="all" <c:if test="${search.studySearchCondition == 'all' }">selected</c:if>>전체</option>
            <option value="writer" <c:if test="${search.studySearchCondition == 'writer' }">selected</c:if>>작성자</option>
            <option value="title" <c:if test="${search.studySearchCondition == 'title' }">selected</c:if>>제목</option>
            <option value="content" <c:if test="${search.studySearchCondition == 'content' }">selected</c:if>>내용</option>
         </select><input type="search" id="search" name="studySearchValue" value="" >&nbsp;&nbsp;<button id="button" >검색</button><br>
     </div>
      </form>
  
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