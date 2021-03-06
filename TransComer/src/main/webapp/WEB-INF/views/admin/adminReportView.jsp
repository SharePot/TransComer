<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<title>신고 및 블랙 리스트</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script type="text/javascript" 
			src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" href="/resources/css/main.css" type="text/css"/>
		<link rel="stylesheet"
         href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
      		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
      		crossorigin="anonymous">
      	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
		
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
	<c:import url="../common/menuBar.jsp" />
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Main -->
				<section id="main">
					<div class="container">
					    <ul class="nav nav-tabs nav-justified" role="tablist">
					        <li class="nav-item">
					            <a class="nav-link active" data-toggle="tab" href="#reportList">신고 리스트</a>
					        </li>
					        <li class="nav-item">
					            <a class="nav-link" data-toggle="tab" href="#blackList">블랙 리스트</a>
					        </li>
					    </ul>
				    </div>

				    <!-- Tab panes -->
				    <div class="tab-content">
				        <div id="reportList" class="container tab-pane active"><br>
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
				                                                <input type="hidden" class="reportNo" name="reportNo" value="${r.reportNo }" />
				                                                <button type="button" class="btn btn-warning btn-sm reportWarning">경고</button>&nbsp;
				                                                <input type="hidden" class="targetMemberId" name="targetMemberId" value="${r.targetMemberId }" />
				                                                <input type="hidden" class="reportNo" name="reportNo" value="${r.reportNo }" />
				                                                <button type="button" class="btn btn-info btn-sm reportRefusal">반려</button>&nbsp;
				                                                <input type="hidden" class="targetMemberId" name="targetMemberId" value="${r.targetMemberId }" />
				                                                <button type="button" class="btn btn-secondary btn-sm reportAdmin">승인</button>
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
				                                <c:if test="${rPi.currentPage <= 1 }">
				                                </c:if>
				                                <c:if test="${rPi.currentPage > 1 }">
				                                    <c:url var="before" value="rANDblist.tc">
				                                        <c:param name="rpage" value="${rPi.currentPage - 1 }" />
				                                    </c:url>
				                                    <li class="page-item">
				                                        <a class="page-link" href="${before }">
				                                            <</a>
				                                    </li>
				                                </c:if>

				                                <!-- 페이지 -->
				                                <c:forEach var="rp" begin="${rPi.startPage }" end="${rPi.endPage }">
				                                    <c:if test="${rp eq currentPage }">
				                                        <li class="page-item active"><a class="page-linl" href="#">${rp }</a></li>
				                                    </c:if>
				                                    <c:if test="${rp ne currentPage }">
				                                        <c:url var="pagination" value="rANDblist.tc">
				                                            <c:param name="rpage" value="${rp }" />
				                                        </c:url>
				                                        <li class="page-item">
				                                            <a class="page-link" href="${pagination }">${rp }</a>
				                                        </li>
				                                    </c:if>
				                                </c:forEach>

				                                <!-- [다음] -->
				                                <c:if test="${rPi.currentPage >= rPi.maxPage }">
				                                </c:if>
				                                <c:if test="${rPi.currentPage < rPi.maxPage }">
				                                    <c:url var="after" value="rANDblist.tc">
				                                        <c:param name="rpage" value="${rPi.currentPage + 1 }" />
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
				        </div>
				        
				        <div id="blackList" class="container tab-pane fade"><br>
				            <div class="container">
				                <div class="row">
				                    <div class="col-12">
				                        <h1 align="center">블랙 리스트</h1>
				                        <br>
				                        <hr>
				                        <br>
				                        <div class="container">
				                            <table class="table table-hover blackTb">
				                                <thead class="thead-light">
				                                    <tr>
				                                        <th style="width:10%;">NO</th>
				                                        <th style="width:20%;">아이디</th>
				                                        <th style="width:15%;">이름</th>
				                                        <th style="width:25%;">이메일</th>
				                                        <th style="width:20%;">등록날짜</th>
				                                        <th style="width:10%;">관리</th>
				                                    </tr>
				                                </thead>

				                                <tbody>
				                                    <c:forEach items="${blist }" var="b" varStatus="i">
				                                        <tr>
				                                            <td>${b.memberNo }</td>
				                                            <td>${b.memberId }</td>
				                                            <td>${b.memberName }</td>
				                                            <td>${b.email }</td>
				                                            <td>2020-07-14</td>
				                                            <td>
				                                                <input type="hidden" class="memberId" name="memberId" value="${b.memberId }" />
				                                                <button type="button" class="btn btn-dark btn-sm noBlackList">해제</button>
				                                                <input type="hidden" class="memberNo" name="memberNo" value="${b.memberNo }" />
				                                            </td>
				                                        </tr>
				                                    </c:forEach>
				                                </tbody>
				                            </table>
				                        </div>

				                        <div class="container d-flex justify-content-center">
				                            <div class="row searchbox">
				                                <form action="blackSearch.tc" method="get">
				                                    <table>
				                                        <tr>
				                                            <td>
				                                                <div class="dropdown">
				                                                    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
				                                                        <span id="search_Bconcept">검색 조건</span>
				                                                    </button>
				                                                    <div class="dropdown-menu searchBSelect">
				                                                        <a class="dropdown-item" href="#memberId">아이디</a>
				                                                        <a class="dropdown-item" href="#memberName">이름</a>
				                                                    </div>
				                                                </div>
				                                            </td>
				                                            <td>
				                                                <div class="input-group mb3 searchDiv">
				                                                    <input type="text" class="form-control" name="searchValue" placeholder="검색어 입력" size="50" autocomplete="off">
				                                                    <div class="input-group-append">
				                                                        <button class="btn btn-secondary btn-Bfilter" type="submit"><span class="fas fa-search"></span></button>
				                                                    </div>
				                                                    <input type="hidden" name="searchCondition" value="all" id="search_Bparam">
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
				                                <c:if test="${bPi.currentPage <= 1 }">
				                                </c:if>
				                                <c:if test="${bPi.currentPage > 1 }">
				                                    <c:url var="before" value="rANDblist.tc">
				                                        <c:param name="bpage" value="${bPi.currentPage - 1 }" />
				                                    </c:url>
				                                    <li class="page-item">
				                                        <a class="page-link" href="${before }">
				                                            <</a>
				                                    </li>
				                                </c:if>

				                                <!-- 페이지 -->
				                                <c:forEach var="bp" begin="${bPi.startPage }" end="${bPi.endPage }">
				                                    <c:if test="${bp eq currentPage }">
				                                        <li class="page-item active"><a class="page-linl" href="#">${bp }</a></li>
				                                    </c:if>
				                                    <c:if test="${bp ne currentPage }">
				                                        <c:url var="pagination" value="rANDblist.tc">
				                                            <c:param name="bpage" value="${bp }" />
				                                        </c:url>
				                                        <li class="page-item">
				                                            <a class="page-link" href="${pagination }">${bp }</a>
				                                        </li>
				                                    </c:if>
				                                </c:forEach>

				                                <!-- [다음] -->
				                                <c:if test="${bPi.currentPage >= bPi.maxPage }">
				                                </c:if>
				                                <c:if test="${bPi.currentPage < bPi.maxPage }">
				                                    <c:url var="after" value="rANDblist.tc">
				                                        <c:param name="bpage" value="${bPi.currentPage + 1 }" />
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
				        </div>
				    </div>
				</section>
		<!-- Footer -->
        <c:import url="../common/footer.jsp"/>

		</div>

		<script>
			/* 신고리스트 검색창 처리 jquery */
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
			
			/* 블랙리스트 검색창 처리 jquery */
			$(document).ready(function(e) {
				$('.searchBSelect').find('a').click(function(e) {
					e.preventDefault();
					var param = $(this).attr("href").replace("#", "");
					var concept = $(this).text();
					$('#search_Bconcept').text(concept);
					$('.input-group #search_Bparam').val(param);
				});
				$('.btn-Bfilter').click(function(e) {
					if ($('.input-group #search_Bparam').val() == "all") {
						alert("검색조건을 선택해주세요");
						e.preventDefault();
					}
				});
			});
			
			
			/* 신고승인 버튼 처리 ajax */
			$(".reportAdmin").click(function() {
				var targetMemberId = $(this).prev().val();
				
				$.ajax({
					url : "rupdate.tc",
					type : "GET",
					datatype : 'json',
					data : {"targetMemberId" : targetMemberId},
					success : function(data) {
						alert("신고 승인 완료!");
						location.href = "rANDblist.tc";
					},
					error : function(data) {
						alert("신고 승인 실패!")
						location.href = "rANDblist.tc";
					}
				});
			});
			
			/* 신고반려 버튼 처리 ajax */
			$(".reportRefusal").click(function() {
				var reportNo= $(this).prev().val();
				
				$.ajax({
					url : "rdelete.tc",
					type : "GET",
					datatype : 'json',
					data : {"reportNo" : reportNo},
					success : function(data) {
						alert("신고 반려 완료!");
						location.href = "rANDblist.tc";
					},
					error : function(data) {
						alert("신고 반려 실패!")
						location.href = "rANDblist.tc";
					}
				});
			});
			
			/* 블랙리스트 해제 버튼 처리 ajax */
			$(".noBlackList").click(function() {
				var memberNo= $(this).next().val();
				var memberId= $(this).prev().val();
				
				$.ajax({
					url : "bupdate.tc",
					type : "GET",
					datatype : 'json',
					data : {"memberNo" : memberNo,
							memberId : memberId},
					success : function(data) {
						alert("블랙리스트 해제 완료!");
						location.href = "rANDblist.tc";
					},
					error : function(data) {
						alert("블랙리스트 해제 실패!")
						location.href = "rANDblist.tc";
					}
				});
			});
			
			
			$(".reportWarning").click(function() {
				
				var memberId = $(this).next().val();
				var reportNo = $(this).prev().val();
				console.log(memberId);
				console.log(reportNo);
				
				$.ajax({
					url : "rWarning.tc",
					type : "GET",
					data : {reportNo : reportNo,
							memberId : memberId},
					success : function(data) {
						alert("회원에게 경고를 주었습니다.");
						location.href = "rANDblist.tc";
					},
					error : function(data) {
						alert("경고 실패!");
						location.href = "rANDlist.tc";
					}
				});
				
			});
			
			
		</script>

</body>
</html>