<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<title>신고 리스트</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/css/main.css" type="text/css"/>
		<link rel="stylesheet"
         href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
      		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
      		crossorigin="anonymous">
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
        <script type="text/javascript" 
			src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
		<style>
		    a:link {
		        text-decoration: none;
		        /* color:black; */
		    }
		    a {
		        color: black;

		    }
		    ul>li {
		        font-color: black;
		    }
		    .reportTb>thead {
		    	text-align: center;
		    }
		</style>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">

					<!-- Logo -->
						<h1><a href="index.html">SharePot</a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="#">Home</a></li>
								<li>
                                    <a href="#">번역 의뢰</a>
                                    <ul>
										<li><a href="#">단순 의뢰</a></li>
										<li><a href="#">1:1 의뢰</a></li>
                                    </ul>
                                </li>
								<li><a href="#">번역 공유</a></li>
								<li><a href="#">스터디</a></li>
                                <li><a href="#">Q&amp;A</a></li>
							</ul>
						</nav>
            </section>

			<!-- Main -->
				<section id="main">
				    <div class="container">
				        <div class="row">
				            <div class="col-12">
				                <h1 align="center">신고 리스트</h1>
				                <br> 
				                <hr> 
				                <br>
				                <div class="container">
				                    <table class="table table-hover reportTb">
				                        <thead class="thead-light">
				                            <tr>
				                                <th style="width:10%;">NO</th>
				                                <th style="width:10%;">신고자</th>
				                                <th style="width:20%;">신고 당한 사용자</th>
				                                <th style="width:40%;">사유</th>
				                                <th style="width:20%;">관리</th>
				                            </tr>
				                        </thead>

				                        <tbody>
				                            <c:forEach items="${rlist }" var="r" varStatus="i">
				                                <tr>
				                                    <td>${r.reportNo }</td>
				                                    <td>${r.reporterMemberId }</td>
				                                    <td>${r.targetMemberId }</td>
				                                    <td>${r.reportContent }</td>
				                                    <td>
				                                    	<button type="button" class="btn btn-warning btn-sm">경고</button>&nbsp;
				                                    	<button type="button" class="btn btn-info btn-sm">반려</button>&nbsp;
			                                    		<input type="hidden" id="targetMemberId" name="targetMemberId" value="${r.targetMemberId }" />
			                                    		<button type="button" class="btn btn-secondary btn-sm" id="reportAdmin">승인</button>
				                                    </td>
				                                </tr>
				                            </c:forEach>
				                        </tbody>
				                    </table>
				                </div>
				                
				                <div class="container d-flex justify-content-center">
				                    <div class="row searchbox">
				                        <form action="reportSearch.tc" method="get">
				                            <table>
				                                <tr>
				                                    <td>
				                                        <div class="dropdown">
				                                            <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
				                                                <span id="search_concept">검색 조건</span>
				                                            </button>
				                                            <div class="dropdown-menu searchSelect">
				                                                <a class="dropdown-item" href="#reporter">신고자</a>
				                                                <a class="dropdown-item" href="#target">신고 당한 사용자</a>
				                                            </div>
				                                        </div>
				                                    </td>
				                                    <td>
				                                        <div class="input-group mb3 searchDiv">
				                                            <input type="text" class="form-control" name="qnaSearch" placeholder="검색어 입력" size="50" autocomplete="off">
				                                            <div class="input-group-append">
				                                                <button class="btn btn-secondary btn-filter" type="submit"><span class="fas fa-search"></span></button>
				                                            </div>
				                                            <input type="hidden" name="type" value="all" id="search_param">
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
				                        <c:if test="${rPi.currentPage <= 1 }">
				                        </c:if>
				                        <c:if test="${rPi. currentPage > 1 }">
				                            <c:url var="before" value="rANDblist.tc">
				                                <c:param name="page" value="${rPi.currentPage - 1 }" />
				                            </c:url>
				                            <li class="page-item">
				                                <a class="page-link" href="${before }"><</a>
				                            </li>
				                        </c:if>

				                        <!-- 페이지 -->
				                        <c:forEach var="rp" begin="${rPi.startPage }" end="${rPi.endPage }">
				                            <c:if test="${rp eq currentPage }">
				                                <li class="page-item active"><a class="page-linl" href="#">${qp }</a></li>
				                            </c:if>
				                            <c:if test="${rp ne currentPage }">
				                                <c:url var="pagination" value="rANDblist.tc">
				                                    <c:param name="page" value="${rp }" />
				                                </c:url>
				                                <li class="page-item">
				                                    <a class="page-link" href="${pagination }">${rp }</a>
				                                </li>
				                            </c:if>
				                        </c:forEach>

				                        <!-- [다음] -->
				                        <c:if test="${rPi.currentPage >= rPi.maxPage }">
				                        </c:if>
				                        <c:if test="${rPi. currentPage < rPi.maxPage }">
				                            <c:url var="after" value="rANDblist.tc">
				                                <c:param name="page" value="${rPi.currentPage + 1 }" />
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
       	        
	       	     $("#reportAdmin").click(function() {
	 				var target = 123;
	 	       	    console.log(target);
	 	       		/* $.ajax({
	 	       			url : "rupdate.tc",
	 	       			type : "GET",
	 	       			data : target,
	 	       			success : function(data) {
	 	       				alert("완료!");
	 	       	            window.opener.location.reload();
	 	       	            self.close();
	 	       			}
	 	       		}); */
        	    });
       		 });
       	    
       	    
       	</script>

	</body>
</html>