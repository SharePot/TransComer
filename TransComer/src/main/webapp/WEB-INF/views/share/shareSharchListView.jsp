<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>SharePot</title>
<style>
html {
	background-color: white
}

#contents {
	min-height: 400px;
	width: 80%;
	float: left;
}

#contents {
	width: auto;
	float: none;
	min-height: 200px;
	margin-bottom: 10px;
}

.p {
	padding-left: 10px;
	text-align: center;
	/*text-indent: 400px;*/
}

#p {
	text-indent: 440px;
	font-size: 15px;
}

#p1 {
	font-size: 25px;
}

a {
	text-decoration: none;
}

pagination {
	text-align: center;
}

#search {
	border: 1px solid gray;
	border-radius: 15px;
	/*border: none;
		border-top: 0px;
		border-right: 0px;
		border-left: 0px;*/
	/*border-bottom: 0px;*/
	width: 50%;
}

#selectBox {
	border-radius: 15px;
}
</style>
</head>
<body class="homepage is-preload">
<c:import url="../common/menuBar.jsp" />
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">

			<!-- Logo -->
			<h1>
				<a href="index.html">SharePot</a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li class="current"><a href="#">Home</a></li>
					<li><a href="#">번역 의뢰</a>
						<ul>
							<li><a href="#">단순 의뢰</a></li>
							<li><a href="#">1:1 의뢰</a></li>
						</ul></li>
					<li><a href="#">번역 공유</a></li>
					<li><a href="#">스터디</a></li>
					<li><a href="#">Q&amp;A</a></li>
				</ul>
			</nav>
		</section>


		<!-- Main -->
		<section id="main">
			<div>
				<p id="p1"
					style="font-size: 30px; text-align: center; font-weight: 900">
					번역본 공유 게시판</p>
			</div>
			<div id="contents">
				<div class="container">
					<!--select박스 memberweb보기-->
					<select id="lang"
						class="custom-select custom-select-sm-10 col-md-9"
						style="height: 8%; width: 13%; margin-right: 10px;">
						<option selected>언어</option>
						<option>C/C++</option>
						<option>Java</option>
						<option>Python</option>
						<option>기타</option>
					</select>
					<!--select박스 memberweb보기-->
					<select id="lang"
						class="custom-select custom-select-sm-10 col-md-9"
						style="height: 8%; width: 15%; margin-right: 10px;">
						<option selected>번역</option>
						<option>English</option>
						<option>Korean</option>
						<option>Chinese</option>
						<option>Japanese</option>

					</select>

					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>언어</th>
								<th>제목</th>
								<th>번역</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${slist }" var="sl">
								<tr>
									<td>${sl.shareNo}</td>
									<td>${sl.pLanguage}</td>
									<c:url value="sdetail.tc" var="detail">
										<c:param name="shareNo" value="${sl.shareNo}" />
									</c:url>
									<td><a href='${detail}'>${sl.shareTitle}</a></td>
									<td>${sl.tLanguage}</td>
									<td>${sl.memberId}</td>
									<td>${sl.sWriteDate}</td>
									<td>${sl.shareCount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<hr />
					<div class="container d-flex justify-content-center">
						<div class="row searchbox">
							<form action="ssearch.tc" method="get">
								<table>
									<tr>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn btn-secondary dropdown-toggle"
													data-toggle="dropdown">
													<span id="search_concept">검색 조건</span>
												</button>
												<div class="dropdown-menu searchSelect">
													<a class="dropdown-item" href="#title">제목</a> <a
														class="dropdown-item" href="#content">내용</a> <a
														class="dropdown-item" href="#writer">작성자</a>
												</div>
											</div>
										</td>
										<td>
											<div class="input-group mb3 searchDiv">
												<input type="text" class="form-control" name="searchValue"
													placeholder="검색어 입력" size="50" autocomplete="off">
												<div class="input-group-append">
													<button class="btn btn-secondary btn-filter" type="submit">
														<span class="fas fa-search"></span>
													</button>
												</div>
												<input type="hidden" name="searchCondition" value="all"
													id="search_param">
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
						<div class="d-flex justify-content-end">
							<!--<button type="button" class="btn btn-info" onclick="location.href='qWriterView.tc">글쓰기</button>-->
							<a class="btn btn-primary" href="shareWriterView.tc"
								style="font-size: 15px; padding: 10px; float: right;"
								height="50px;">신청서 작성</a>

						</div>
					</div>
					
					 <div class="container d-flex justify-content-center">
				                    <!-- 페이징 처리 -->
				                    <ul class="pagination">
				                        <!-- [이전] -->
				                        <c:if test="${sPi.currentPage <= 1 }">
				                        </c:if>
				                        <c:if test="${sPi. currentPage > 1 }">
				                            <c:url var="before" value="ssearch.tc?searchValue=${ssearch.searchvalue }&searchCondition=${ssearch.searchCondition }">
				                                <c:param name="page" value="${sPi.currentPage - 1 }" />
				                            </c:url>
				                            <li class="page-item">
				                                <a class="page-link" href="${before }"><</a>
				                            </li>
				                        </c:if>

				                        <!-- 페이지 -->
				                        <c:forEach var="sp" begin="${sPi.startPage }" end="${sPi.endPage }">
				                            <c:if test="${sp eq currentPage }">
				                                <li class="page-item active"><a class="page-linl" href="#">${sp }</a></li>
				                            </c:if>
				                            <c:if test="${sp ne currentPage }">
				                                <c:url var="pagination" value="ssearch.tc?searchValue=${ssearch.searchvalue }&searchCondition=${ssearch.searchCondition }">
				                                    <c:param name="page" value="${sp }" />
				                                </c:url>
				                                <li class="page-item">
				                                    <a class="page-link" href="${pagination }">${sp }</a>
				                                </li>
				                            </c:if>
				                        </c:forEach>

				                        <!-- [다음] -->
				                        <c:if test="${sPi.currentPage >= sPi.maxPage }">
				                        </c:if>
				                        <c:if test="${sPi. currentPage < sPi.maxPage }">
				                            <c:url var="after" value="ssearch.tc?searchValue=${ssearch.searchvalue }&searchCondition=${ssearch.searchCondition }">
				                                <c:param name="page" value="${sPi.currentPage + 1 }" />
				                            </c:url>
				                            <li class="page-item">
				                                <a class="page-link" href="${after }">></a>
				                            </li>
				                        </c:if>
				                    </ul>
				                </div>
					
					
					<!-- <div style="text-align: center;">
						 <select id="selectBox"
								class="custom-select custom-select-sm-10 col-md-9"
								style="height: 8%; width: 16%; margin-right:  10px;">
								<option selected>검색</option>
								<option value="1">링크</option>
								<option value="2">제목</option>
								<option value="3">내용</option>
								<option value="4">작성자</option>
							</select>
						<input  type="text" placeholder="검색어를 입력해주세요." style="width: 70%; margin-top: 10px;">
						<input id="search" type="text" placeholder="검색어를 입력해주세요."  style="padding:6px;">
					<a class="btn btn-primary" href="shareWriterView.tc" style="font-size: 15px; padding: 10px; float: right;" >신청서 작성</a>
					</div>
					<br> -->


					<div class="d-flex justify-content-center">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>

		</section>

		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</div>
	<script>
       	    $(document).ready(function(e) {
       	        $('.searchSelect').find('a').click(function(e) {
       	            e.preventDefault();
       	            var param = $(this).attr("href").replace("#", "");
       	            var concept = $(this).text();
       	            $('#search_concept').text(concept);
       	            $('.input-group #search_param').val(param);
       	        });
       	        $('.btn-filter').click(function(e) {
       	            if ($('.input-group #search_param').val() == "all") {
       	                alert("검색조건을 선택해주세요");
       	                e.preventDefault();
       	            }
       	        });
       	    });
       	</script>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>



