<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 회원 전체 리스트</title>
<style>
	#mainWrapper {
		width: 80%;
		margin: 0 auto;
	}
	#title{
font-size:30px !important;
}

#searchBtn {
	height: 62px !important;
	background: skyblue !important;
	line-height: 0px !important;
}

.searchValue {
	height: 62px !important;
	width: 400px !important;
	display: inline !important;
}

.searchCondition {
	width: 150px !important ;
	display: inline;
}
a {
	text-decoration-line: none !important;
}

</style>
</head>
<body>
<c:import url="../common/menuBar.jsp" />
	<section id="main">
		<div id="mainWrapper">
		 <h1 align="center" id="title">전체 회원 목록</h1><br>
		   
		   <h3 align="center">
		      총 회원 수 : ${pi.listCount }
		   </h3><br>
		   
		   <table align="center" border="1" cellspacing="0" width="700" id="tb">
		      <tr>
		         <th>NO</th>
		         <th>아이디</th>
		         <th>이름</th>
		         <th>이메일</th>
		         <th>은행명</th>
		         <th>계좌주</th>
		         <th>계좌번호</th>
		         <th>블랙리스트</th>
		         <th>프리미엄 여부</th>
		         <!-- <th>프로필 등록 여부</th> member 테이블 변경 후에 넣을게여-->
		      </tr>
		      <c:forEach var="member" items="${list }">
		         <tr>
				 	<td >${member.memberNo }</td>
			        <td >
			         	<c:url var="memberDetail" value="memberDetail.tc">
							<c:param name="memberId" value="${member.memberId }" />
						</c:url>					
						<a href="${memberDetail}">${member.memberId }</a>
			        </td>
			        <td >${member.memberName }</td>
			        <td >${member.email }</td>
			        <c:if test="${member.account eq null }">
				        <td></td>
				        <td></td>
				        <td></td>
			        </c:if>
			        <c:if test="${member.account ne null }">
			        	<c:forTokens var="accountInfo" items="${member.account }" delims="," varStatus="status">
							<c:if test="${status.index eq 0 }">
								<td><input type="text" name="bank"  value="${accountInfo }" readonly size="6"></td>
							</c:if>
							<c:if test="${status.index eq 1 }">
								<td><input type="text" name="accountOwner" readonly value="${accountInfo }"></td>
							</c:if>
							<c:if test="${status.index eq 2}">
								<td><input type="text" name="account" readonly  value="${accountInfo }"></td>
							</c:if>
						</c:forTokens>
					</c:if>
			        <td >
			        	<c:if test="${member.status eq 'BLACKLIST' }">
			         		X
			         	</c:if>
			         	<c:if test="${member.status ne 'BLACKLIST' }">
			         		O
			         	</c:if>
			        </td>
			        <td >
			        	<c:if test="${member.status eq 'PREMIUM' }">
			         		O
			         	</c:if>
			         	<c:if test="${member.status ne 'PREMIUM' }">
			         		X
			         	</c:if>
			        </td>
				        <%-- <td>
				        	<c:if test="${pf.profileStatus eq 'OPEN' }">
				        		공개
				        	</c:if>
				        	<c:if test="${pf.profileStatus eq 'PRIVATE' }">
				        		비공개
				        	</c:if>
				        	<c:if test="${pf.profileStatus eq 'NONE'}">
				        		미등록
				        	</c:if>
				        </td> --%>
		      	</tr>
		      </c:forEach>
		        </table>
		       <!-- 페이징 처리 -->
				<ul class="pagination justify-content-center">
					<!-- [이전] -->
					<c:if test="${pi.currentPage <= 1 }">
						<li class="page-item">
							<a class="page-link" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
						
					<c:if test="${pi.currentPage > 1 }">
						<c:url var="before" value="memberList.tc">
							<c:param name="page" value="${pi.currentPage - 1 }" />
								<c:param name="memberId" value="${loginUser.memberId }" />
						</c:url>
						<li class="page-item">
							<a href="${before}" class="page-link" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if> 
					<!-- 페이지 --> 
					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq currentPage }">
							<li class="page-item active" aria-current="page">
								<a class="page-link">${p } <span class="sr-only">(current)</span></a>
							</li>
						</c:if>
							
						<c:if test="${p ne currentPage }">
							<c:url var="pagination" value="memberList.tc">
								<c:param name="page" value="${p }" />
								<c:param name="memberId" value="${loginUser.memberId }" />
							</c:url>
							<li class="page-item">
								<a href="${pagination }" class="page-link">${p }</a>
							</li>
						</c:if>
					</c:forEach>
						
					<!-- [다음] -->
					<c:if test="${pi.currentPage >= pi.maxPage }">
						<li class="page-item">
							<a class="page-link" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<c:url var="after" value="List.tc">
							<c:param name="page" value="${pi.currentPage + 1 }" />
						</c:url>
						<li class="page-item">
							<a href="${after}" class="page-link" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>&nbsp;
						</li>
					</c:if>
				</ul> 
		      
		 
		         <div style="height: 50px;" id="searchBox">
      <form id="searchForm"action="memberSearch.tc" name="searchForm" method="get" align="center">
         <select id="memberSearchCondition" name="memberSearchCondition" class="searchCondition">
            <option id="status" value="status" <c:if test="${search.memberSearchCondition == 'status' }">selected</c:if>>상태</option>
            <option value="memberId" <c:if test="${search.memberSearchCondition == 'memberId' }">selected</c:if>>아이디</option>
            <option value="name" <c:if test="${search.memberSearchCondition == 'name' }">selected</c:if>>이름</option>
         </select>&nbsp;&nbsp;
	         <input type="text" list="browsers" id="textSearch" name="memberSearchValue" class="searchValue">
	         <datalist id="browsers">
	         <option value="BLACKLIST" <c:if test="${search.memberSearchValue == 'BLACKLIST' }">selected</c:if>>블랙리스트</option>
	         <option value="PREMIUM" <c:if test="${search.memberSearchValue == 'PREMIUM' }">selected</c:if>>프리미엄</option>
	         <option value="ADMIN" <c:if test="${search.memberSearchValue == 'ADMIN' }">selected</c:if>>관리자</option>
	         <option value="DROP" <c:if test="${search.memberSearchValue == 'DROP' }">selected</c:if>>탈퇴회원</option>
	         <option value="PRIMARY" <c:if test="${search.memberSearchValue == 'PRIMARY' }">selected</c:if>>일반회원</option>
	       </datalist>	&nbsp;&nbsp;
         <button id="searchBtn">검색</button><br>
      </form>
      </div>
   </div>
		  <!--  
		   <a onclick="test()">test</a> -->
		   
	</section>
	
	
	<script>
		function test() {
			var test = $("#test").val();
			console.log(test);
		}
	</script>
	
</body>
</html>