<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>1:1 의뢰 메인</title>
    <style>
    	section {
    		border: 0px !important; 		
    	}
    
        .imgbox {
            width: 100%;
            min-height: 150px;
            overflow: hidden;
            background: white;
            /*border-radius: 70%;*/
            /*justify-content: center;*/
        }

        .profile {
            width: 100%;
            height: width;
            object-fit: cover;
        }
        
        #searchBox {
        	width : 60%;
        }
        
        #pagenav a {
        	text-decoration:none !important;
        	color: black;
        }
        s
    </style>
</head>

<body class="homepage is-preload">
<c:import url="../common/menuBar.jsp"/>
    <div id="page-wrapper">

        <!-- Main -->
        <section id="main">
            <div class="container">
                <div class="row">
                    <div class="col-12">

                        <!-- Portfolio -->
                        <section>
                            <!-- 검색 -->
                            <br>
							<div class="d-flex justify-content-center">
								<form action="pSearch.tc" method="get">
									<div class="form-row">
										<div class="form-group col-4">
											<select class="custom-select" id="searchCondition" name="searchCondition">
												<!-- <option value="all" selected>전체</option> -->
												<option value="title" <c:if test="${search.searchCondition == 'title' }">selected</c:if>> 제목</option>
												<option value="writer" <c:if test="${search.searchCondition == 'writer' }">selected</c:if>>번역가</option>
												<option value="tLang" <c:if test="${search.searchCondition == 'tLang' }">selected</c:if>>사용 언어</option>
												<option value="pLang" <c:if test="${search.searchCondition == 'pLang' }">selected</c:if>>개발 언어</option>
											</select>
										</div>
										<div class="form-group col-6">
											<input type="search" name="searchValue" class="form-control" placeholder="검색어 입력" value="${search.searchValue }">
										</div>
										<div class="form-group col-2">
											<div class="input-group-append">
												<button class="btn btn-outline-secondary" type="submit" id="button-addon" style="background: black;">search</button>
											</div>
										</div>
									</div>
								</form>
							</div>

							<div class="d-flex justify-content-end">
								<!--  로그인한 사람만 글쓰기 가능 -->
	                            <c:if test="${ !empty loginUser }">
	                            	<c:url var="pWriterView" value="pWriterView.tc">
	                                	<c:param name="memberId" value="${loginUser.memberId }"></c:param>
	                                </c:url>
	                               	<a href="${pWriterView }" class="btn btn-danger btn-lg" style="text-decoration: none;">글쓰기</a>
								</c:if>
							</div>


                            <header class="major">
                                <h2>1:1 의뢰</h2>
                            </header>
                            <div class="row">
                            	<c:forEach var="p" items="${list }">
                                <div class="col-4 col-6-medium col-12-small">
                                    <section class="box">
                                        <div class="d-flex justify-content-center">
                                            <div class="imgbox">
                                                <img class="profile" src="/resources/pUploadFiles/${p.personalFilePath}">
                                            </div>
                                        </div>
                                        <br>
                                        <header>
                                            <h4>${p.personalTitle }</h4>
                                        </header>
                                        <!-- 글 제목 -->
                                        <b>${p.memberId }</b>
                                        <hr>
                                        <p>사용가능 언어 : ${p.personalTLang}
                                        <br>사용가능 개발언어: ${p.personalPLang}</p>
                                        <footer>
                                            <ul class="actions">
                                                <li>
		                                        	<c:url var="pDetail" value="pDetail.tc">
		                                            	<c:param name="personalNo" value="${p.personalNo}"></c:param>
		                                            	<c:param name="memberId" value="${p.memberId}"></c:param>
		                                            </c:url>
                                                	<a href="${pDetail }" class="button alt" style="background-color:lightblue;">자세히 보기</a>
                                                </li>
                                            </ul>
                                        </footer>
                                    </section>
                                </div>
                                </c:forEach>

                            </div> 


							<br><br><br><br>
							<!-- 페이징 처리 -->
							 <div class="justify-content-center" id="pagenav" style="text-align:center;">
                                <ul class="pagination justify-content-center" style="clear:both;">
                                <!-- [이전] -->
                                <c:if test="${pi.currentPage <= 1 }">
                                	<li class="page-item"><a class="page-link" href="${before }">&laquo;</a></li>
                                </c:if>
                                <c:if test="${pi.currentPage > 1 }">
                                	<c:url var="before" value="plist.tc">
                                		<c:param name="page" value="${pi.currentPage - 1 }" />
				              		</c:url>
				               		<li class="page-item"><a class="page-link" href="${before }">&laquo;</a></li>
				            	</c:if>
				            	
				            	<!-- 페이지 -->
				         		<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				            		<c:if test="${p eq currentPage }">
				            			<li class="page-item"><a class="page-link" href="${pagination }">${p }</a></li>
				           			</c:if>
				           			<c:if test="${p ne currentPage }">
				               			<c:url var="pagination" value="plist.tc">
				                  			<c:param name="page" value="${p }" />
				               			</c:url>
				               			<li class="page-item"><a class="page-link" href="${pagination }">${p }</a></li>
				            		</c:if>
				         		</c:forEach>
				         		
				         		<!-- [다음] -->
				      			<c:if test="${pi.currentPage >= pi.maxPage }">
				         			<li class="page-item"><a class="page-link" href="${after }">&raquo;</a></li>
				      			</c:if>
				      			<c:if test="${pi.currentPage < pi.maxPage }">
				         			<c:url var="after" value="plist.tc">
				            			<c:param name="page" value="${pi.currentPage + 1 }" />
				         			</c:url>
				         				<li class="page-item"><a class="page-link" href="${after }">&raquo;</a></li>
				      			</c:if>
				            	
				            	</ul>
				            </div>
				            
                        </section>
                    </div>

                </div>
            </div>
        </section>

        <!-- Footer -->
        <c:import url="../common/footer.jsp"/>

    </div>

</body>
</html>