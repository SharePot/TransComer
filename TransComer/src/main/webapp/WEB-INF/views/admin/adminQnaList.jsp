<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE HTML>
<html lang="ko">
	<head>
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

			<!-- Header -->

			<!-- Main -->
				<section id="main">
				    <div class="container">
				        <div class="row">
				            <div class="col-12">
				                <h1 align="center">문의글 목록</h1>
				                <br> 
				                <hr>
				                <br>
				                <div class="container">
				                    <table class="table table-hover qnaTb">
				                        <thead class="thead-light">
				                            <tr>
				                                <th style="width:15%; text-align:center;">NO</th>
				                                <th style="width:15%; text-align:center;">문의자</th>
				                                <th style="width:50%; text-align:center;">제목</th>
				                                <th style="width:20%; text-align:center;">관리</th>
				                            </tr>
				                        </thead>

				                        <tbody>
				                            <c:forEach items="${qalist }" var="qa" varStatus="i">
				                                <tr>
				                                    <td style="text-align:center;">${qa.qnaNo }</td>
				                                    <td style="text-align:center;">${qa.memberId }</td>
				                                    <td style="text-align:center;">${qa.qnaTitle }</td>
				                                    <td style="text-align:center;">
				                                    	<c:url var="qdetail" value="qdetail.tc">
			                                                <c:param name="qnaNo" value="${qa.qnaNo }" />
			                                                <c:param name="page" value="${qPi.currentPage }" />
			                                            </c:url>
			                                            <button type="button" class="btn btn-primary" onclick="location.href='${qdetail }'">확인하기</button>
				                                    </td>
				                                </tr>
				                            </c:forEach>
				                        </tbody>
				                    </table>
				                </div>
				                
				                <div class="container d-flex justify-content-center">
				                    <!-- 페이징 처리 -->
				                    <ul class="pagination">
				                        <!-- [이전] -->
				                        <c:if test="${qPi.currentPage <= 1 }">
				                        </c:if>
				                        <c:if test="${qPi. currentPage > 1 }">
				                            <c:url var="before" value="qAdminlist.tc">
				                                <c:param name="page" value="${qPi.currentPage - 1 }" />
				                            </c:url>
				                            <li class="page-item">
				                                <a class="page-link" href="${before }"><</a>
				                            </li>
				                        </c:if>

				                        <!-- 페이지 -->
				                        <c:forEach var="qp" begin="${qPi.startPage }" end="${qPi.endPage }">
				                            <c:if test="${qp eq currentPage }">
				                                <li class="page-item active"><a class="page-link" href="#">${qp }</a></li>
				                            </c:if>
				                            <c:if test="${qp ne currentPage }">
				                                <c:url var="pagination" value="qAdminlist.tc">
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
				                            <c:url var="after" value="qlist.tc">
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
		</div>

		<!-- Scripts -->
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/jquery.dropotron.min.js"></script>
		<script src="/resources/js/browser.min.js"></script>
		<script src="/resources/js/breakpoints.min.js"></script>
		<script src="/resources/js/util.js"></script>
		<script src="/resources/js/main.js"></script>

		<script>
			
			
		</script>

</body>
</html>