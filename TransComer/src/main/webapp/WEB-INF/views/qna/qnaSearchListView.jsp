<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<title>QnA 게시판</title>
		<style>
		    a:link {
		        text-decoration: none;
		        /* color:black; */
		    }
		    a {
		        color: black !important ;

		    }
		    #notice {
		    	color:red !important;;
		    }
		    ul>li {
		        font-color: black;
		    }
		    td {
		    	text-align:center;
		    }
		</style>
	</head>
	<c:import url="../common/menuBar.jsp" />
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Header -->

			<!-- Main -->
				<section id="main">
				    <div class="container">
				        <div class="row">
				            <div class="col-12">
				                <h1 align="center" style="font-size:2.5em;">QnA 게시판</h1>
				                <br>
				                <div class="d-flex justify-content-center">
		                        	<button type="button" class="btn btn-primary" onclick="location.href='qlist.tc'">전체 리스트</button>
		                        </div> 
				                <hr>
				                <div align="right">
				                	<a href="qnaWriterView.tc" style="margin-right:10px;"><i class="fas fa-edit fa-2x"></i></a>
				                </div>
				                <br>
				                <div class="container">
				                    <table class="table table-hover qnaTb">
				                        <thead class="thead-light">
				                            <tr>
				                                <th style="width:10%; text-align:center;">글번호</th>
				                                <th style="width:40%; text-align:center;" >제목</th>
				                                <th style="width:10%; text-align:center;">작성자</th>
				                                <th style="width:10%; text-align:center;">작성일</th>
				                                <th style="width:10%; text-align:center;">조회</th>
				                                <th style="width:10%; text-align:center;">댓글</th>
				                            </tr>
				                        </thead>

				                        <tbody>
				                        <c:if test="${qlist ne null }">
				                        	<c:forEach items="${qlist }" var="q" varStatus="i">
				                                <tr>
				                                	<c:if test="${q.qnaCategory eq 'NOTICE' }">
				                                    <td style="color:red; text-align:center;">공지</td>
				                                    <td style="text-align:center;">
			                                            <c:url var="qdetail" value="qdetail.tc">
			                                                <c:param name="qnaNo" value="${q.qnaNo }" />
			                                                <c:param name="page" value="${qPi.currentPage }" />
			                                            </c:url>
			                                            <a id="notice" href="${qdetail }">${q.qnaTitle }</a>
				                                    </td>
				                                    <td style="text-align:center;">${q.memberId }</td>
				                                    <td style="text-align:center;">${q.qnaWriteDate }</td>
				                                    <td style="text-align:center;">${q.qnaCount }</td>
				                                    <td style="text-align:center;">${q.commentCount }</td>
				                                    </c:if>
				                                </tr>
				                            </c:forEach>
				                        	
				                            <c:forEach items="${qlist }" var="q" varStatus="i">
				                                <tr>
				                                	<c:if test="${q.qnaCategory eq 'ALL' }"></c:if>
				                                    <td style="text-align:center;">${q.qnaNo }</td>
				                                    <td style="text-align:center;">
				                                        <c:if test="${ !empty loginUser }">
				                                            <c:url var="qdetail" value="qdetail.tc">
				                                                <c:param name="qnaNo" value="${q.qnaNo }" />
				                                                <c:param name="page" value="${qPi.currentPage }" />
				                                            </c:url>
				                                            <a href="${qdetail }">${q.qnaTitle }</a>
				                                        </c:if>
				                                        <c:if test="${ empty loginUser }">
				                                            ${q.qnaTitle }
				                                        </c:if>
				                                    </td>
				                                    <td style="text-align:center;">${q.memberId }</td>
				                                    <td style="text-align:center;">${q.qnaWriteDate }</td>
				                                    <td style="text-align:center;">${q.qnaCount }</td>
				                                    <td style="text-align:center;">${q.commentCount }</td>
				                                </tr>
				                            </c:forEach>
				                         </c:if>
				                        </tbody>
				                    </table>
				                </div>
				                
				                <div class="container d-flex justify-content-center">
				                    <div class="row searchbox">
				                        <form action="qsearch.tc" method="get">
				                            <table>
				                                <tr>
				                                    <td>
				                                        <div class="dropdown">
				                                            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
				                                                <span id="search_concept">검색 조건</span>
				                                            </button>
				                                            <div class="dropdown-menu searchSelect">
				                                                <a class="dropdown-item" href="#title">제목</a>
				                                                <a class="dropdown-item" href="#content">내용</a>
				                                                <a class="dropdown-item" href="#writer">작성자</a>
				                                            </div>
				                                        </div>
				                                    </td>
				                                    <td>
				                                        <div class="input-group mb3 searchDiv">
				                                            <input type="text" class="form-control" name="searchValue" placeholder="검색어 입력" size="50" autocomplete="off">
				                                            <div class="input-group-append">
				                                                <button class="btn btn-secondary btn-filter" type="submit"><span class="fas fa-search"></span></button>
				                                            </div>
				                                            <input type="hidden" name="searchCondition" value="all" id="search_param">
				                                        </div>
				                                    </td>
				                                </tr>
				                            </table>
				                        </form>
				                	</div>
				                </div>
				                
				                <div class="container d-flex justify-content-center">
				                    <!-- 페이징 처리 -->
				                    <ul class="pagination">
				                        <!-- [이전] -->
				                        <c:if test="${qPi.currentPage <= 1 }">
				                        </c:if>
				                        <c:if test="${qPi. currentPage > 1 }">
				                            <c:url var="before" value="qsearch.tc?searchValue=${qsearch.searchvalue }&searchCondition=${qsearch.searchCondition }">
				                                <c:param name="page" value="${qPi.currentPage - 1 }" />
				                            </c:url>
				                            <li class="page-item">
				                                <a class="page-link" href="${before }"><</a>
				                            </li>
				                        </c:if>

				                        <!-- 페이지 -->
				                        <c:forEach var="qp" begin="${qPi.startPage }" end="${qPi.endPage }">
				                            <c:if test="${qp eq currentPage }">
				                                <li class="page-item active"><a class="page-linl" href="#">${qp }</a></li>
				                            </c:if>
				                            <c:if test="${qp ne currentPage }">
				                                <c:url var="pagination" value="qsearch.tc?searchValue=${qsearch.searchvalue }&searchCondition=${qsearch.searchCondition }">
				                                    <c:param name="page" value="${qp }" />
				                                </c:url>
				                                <li class="page-item">
				                                    <a class="page-link" href="${pagination }">${qp }</a>
				                                </li>
				                            </c:if>
				                        </c:forEach>

				                        <!-- [다음] -->
				                        <c:if test="${qPi.currentPage >= qPi.maxPage }">
				                        </c:if>
				                        <c:if test="${qPi. currentPage < qPi.maxPage }">
				                            <c:url var="after" value="qsearch.tc?searchValue=${qsearch.searchvalue }&searchCondition=${qsearch.searchCondition }">
				                                <c:param name="page" value="${qPi.currentPage + 1 }" />
				                            </c:url>
				                            <li class="page-item">
				                                <a class="page-link" href="${after }">></a>
				                            </li>
				                        </c:if>
				                    </ul>
				                </div>
				            </div>
				        </div>
				    </div>
				</section>

			<!-- Footer -->
				<section id="footer">
					<div class="container">
						<div class="row">
							<div class="col-8 col-12-medium">
							</div>
							<div class="col-4 col-12-medium">
							</div>
							<div class="col-12">
							</div>
						</div>
					</div>
				</section>

		</div>

		<!-- Scripts -->
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/jquery.dropotron.min.js"></script>
		<script src="/resources/js/browser.min.js"></script>
		<script src="/resources/js/breakpoints.min.js"></script>
		<script src="/resources/js/util.js"></script>
		<script src="/resources/js/main.js"></script>
		
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

	</body>
</html>