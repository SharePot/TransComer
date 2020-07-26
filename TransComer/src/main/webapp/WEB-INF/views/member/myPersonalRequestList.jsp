<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <title>나의 1:1 의뢰 목록</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <!-- 부트스트랩 4.5.0 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<body class="homepage is-preload">
    <div id="page-wrapper">
		
		<!-- Header -->
        <%-- <jsp:include page="../common/menuBar.jsp"></jsp:include> --%>
        <c:import url="../common/menuBar.jsp"/>

        <!-- Main -->
        <section id="main">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="d-flex justify-content-center">
                           <svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="h2 bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
                                <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z" />
                                <circle cx="3.5" cy="5.5" r=".5" />
                                <circle cx="3.5" cy="8" r=".5" />
                                <circle cx="3.5" cy="10.5" r=".5" />
                            </svg>&nbsp;&nbsp;&nbsp;&nbsp;
                            <span class="h3">나의 1:1 의뢰</span>
                            
                            
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-12">
                        <div class="container">
                           <!--탭 버튼 네비게이션 링크-->
                            <ul class="nav nav-tabs nav-justified" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#move1" style="text-decoration:none">1:1 의뢰 신청 내역</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#move2" style="text-decoration:none">1:1 의뢰 받은 내역</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                               <!--의뢰 신청 내역 탭-->
                                <div id="move1" class="tab-pane active" align="center"><br>
                                    <div id="moveInfo1" class="container tab-pane active">
                                        <div class="d-flex justify-content-center">
                                            <h3>1:1 의뢰 신청 내역</h3>
                                        </div>
                                    </div>
                                    <br>

                                    <table class="table table-hover">
                                        <thead class="thead-light">
                                            <tr class="text-center">
                                                <th scope="col">No</th>
                                                <th scope="col" class="text-center">신청날짜</th>
                                                <th scope="col" class="text-center">번역가</th>
                                                <th scope="col" class="text-center">의뢰내용</th>
                                                <th scope="col" class="text-center">금액</th>
                                                <th scope="col" class="text-center">의뢰 상태</th>
                                                <th scope="col" class="text-center">구매확정</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <!--반복되는 테이블 행/tr 영역-->
                                           <c:forEach var="doReqRep" items="${doList }">
	                                            <tr class="text-center">
	                                                <th scope="row">${doReqRep.pReqNo }</th>
	                                                <td>${doReqRep.pReqDate }</td>
	                                                <td>${doReqRep.pRepTranslator }</td>
	                                                <td>
	                                                	<c:url var="pReqRepDetail" value="pReqRepDetail.tc">
		                                                	<c:param name="pReqNo" value="${doReqRep.pReqNo }"></c:param>
		                                                	<c:param name="personalNo" value="${doReqRep.personalNo }"></c:param>
		                                                </c:url>
	                                                    <a href="${pReqRepDetail }" style="text-decoration: none;color: black;">${doReqRep.pReqContent }</a>
	                                                </td>
	                                                <td>${doReqRep.pReqPrice } P</td>
	                                                <td>
	                                                	<!--if : 결제가 미완된 의뢰-->
	                                                    <c:if test="${doReqRep.pReqAccept eq 'N' }">
	                                                    	<%-- <c:url var="pReqRepResultDetail" value="pReqRepResultDetail.tc">
	                                                   			<c:param name="pReqNo" value="${doReqRep.pReqNo }"></c:param>
	                                                   			<c:param name="personalNo" value="${doReqRep.personalNo }"></c:param>
	                                                   		</c:url> --%>
	                                                   		<a href="#" class="btn btn-warning" style="text-decoration: none;">결제하기</a>
	                                                    </c:if>
	                                                    <!--if : 승인 대기중인 상태-->
	                                                    <c:if test="${doReqRep.pReqAccept eq 'C' }">
	                                                    	<button class="btn btn-primary" disabled>승인 대기</button>
	                                                    </c:if>
	                                                    <!--if : 의뢰자가 반려했으면 반려표시-->
	                                                    <c:if test="${doReqRep.pReqAccept eq 'R' }">
	                                                    	<button class="btn btn-secondary" disabled>반려 됨</button>
	                                                    </c:if>
	                                                    <!--if : 승인 했지만 답변미완료 상태 -->
	                                                    <c:if test="${doReqRep.pReqAccept eq 'Y' }">
	                                                    	<button class="btn btn-info" disabled>승인후 답변 대기중</button>
	                                                    </c:if>
	                                                   <!--if : 승인 & 답변완료 상태이면-->
	                                                   <c:if test="${doReqRep.pReqAccept eq 'F' }">
	                                                   		<!-- 답변 결과 보는 url -->
	                                                   		<c:url var="pReqRepResultDetail" value="pReqRepResultDetail.tc">
	                                                   			<c:param name="pReqNo" value="${doReqRep.pReqNo }"></c:param>
	                                                   			<c:param name="personalNo" value="${doReqRep.personalNo }"></c:param>
	                                                   		</c:url>
	                                                   		<a href="${pReqRepResultDetail }" class="btn btn-success" style="text-decoration: none;">결과보기</a>
	                                                   </c:if>
	                                                </td>
	                                                <td>
	                                                	<!-- if : 결제가 미완된 의뢰  -->
	                                                    <c:if test="${doReqRep.pReqAccept eq 'N' }">
	                                                    	※ 결제 미완료
	                                                    </c:if>
	                                                	<!-- if 답변 대기중일 경우  -->
	                                                    <c:if test="${doReqRep.pReqAccept eq 'C' }">
	                                                    	승인 대기중
	                                                    </c:if>
	                                                    <!-- if 답변 대기중일 경우  -->
	                                                    <c:if test="${doReqRep.pReqAccept eq 'Y' }">
	                                                    	답변 대기중
	                                                    </c:if>
	                                                    <!--if : 답변완료 && 확정하지 않으면 확정하기 버튼-->
	                                                    <c:if test="${doReqRep.pReqAccept eq 'F'  && doReqRep.pReqCheckBuy eq 'N'}">
	                                                    	<!-- 확정 처리하는 url -->
	                                                   		<c:url var="pReqRepCheckBuyY" value="pReqRepCheckBuyY.tc">
	                                                   			<c:param name="pReqNo" value="${doReqRep.pReqNo }"></c:param>
	                                                   		</c:url>
	                                                    	<a href="${pReqRepCheckBuyY }" class="btn btn-primary" style="text-decoration: none;">확정하기</a>
	                                                    </c:if>
	                                                    <!--if 확정했으면 확정완료 표시-->
	                                                    <c:if test="${doReqRep.pReqCheckBuy eq 'Y' }">
	                                                    	
	                                                    	<!-- 후기를 쓰러가는 url -->
	                                                   		<c:url var="pDetail" value="pDetail.tc">
	                                                   			<c:param name="personalNo" value="${doReqRep.personalNo }"></c:param>
	                                                   			<c:param name="memberId" value="${doReqRep.pRepTranslator }"></c:param>
	                                                   		</c:url>
	                                                   		<button class="btn btn-dark" disabled>확정 완료</button>
	                                                    	<a href="${pDetail }" class="btn btn-danger" style="text-decoration: none;">리뷰쓰기</a>
	                                                    </c:if>
	                                                    	<!--if 의뢰자가 반려했으면 구매확정 불가-->
	                                                    <c:if test="${doReqRep.pReqAccept eq 'R' }">
		                                                    반려 의뢰
		                                                    <!--<a class="btn btn-warning">포인트 환급</a>-->
	                                                    </c:if>
	                                                </td>
	                                            </tr>
                                           </c:forEach>
                                        </tbody>
                                    </table>
                                    <br><br>
                                </div>
                                <!-- 의뢰 신청 내역 탭 끝 -->

                                <!--의뢰 받은 내역 탭 -------------------------------------------------->
                                <div id="move2" class="tab-pane fade" align="center"><br>
                                    <div id="moveInfo1" class="container tab-pane active">
                                        <div class="d-flex justify-content-center">
                                            <h3>1:1 의뢰 받은 내역</h3>
                                        </div>
                                    </div>
                                    <br>

                                    <table class="table table-hover">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">No</th>
                                                <th scope="col" class="text-center">날짜</th>
                                                <th scope="col" class="text-center">의뢰자</th>
                                                <th scope="col" class="text-center">의뢰내용</th>
                                                <th scope="col" class="text-center">금액</th>
                                                <th scope="col" class="text-center">처리</th>
                                                <th scope="col" class="text-center">구매확정</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <!--for 반복되는 데이터, 테이블 행 추가-->
                                           <c:forEach var="getReqRep" items="${getList }" varStatus="i">
	                                            <tr class="text-center">
	                                                <th scope="row">${getReqRep.pReqNo }</th>
	                                                <td>${getReqRep.pReqDate }</td>
	                                                <td>${getReqRep.memberId }</td>
	                                                <td>
	                                                	<c:url var="pReqRepDetail" value="pReqRepDetail.tc">
		                                                	<c:param name="pReqNo" value="${getReqRep.pReqNo }"></c:param>
		                                                	<c:param name="personalNo" value="${getReqRep.personalNo }"></c:param>
		                                                	<c:param name="memberId" value="${getReqRep.memberId }"></c:param>
		                                                </c:url>
	                                                	<a href="${pReqRepDetail }" style="text-decoration: none;color: black;">${getReqRep.pReqContent }</a>
	                                                </td>
	                                                <td>${getReqRep.pReqPrice } P</td>
	                                                <td>
	                                                	<!-- if : 의뢰자가 결제를 완료하지 않았을때 -->
	                                                	<c:if test="${getReqRep.pReqAccept eq 'N' }">
	                                                		의뢰자 결제 미완료
	                                                	</c:if>
	                                                	<!-- if : 승인/반려 아무것도 하지 않았을때 -->
	                                                	<c:if test="${getReqRep.pReqAccept eq 'C' }">
	                                                		<!-- 승인하기 url -->
	                                                		<c:url var="pReqRepAcceptY" value="pReqRepAcceptY.tc">
	                                                			<c:param name="pReqNo" value="${getReqRep.pReqNo }"></c:param>
	                                                			<c:param name="memberId" value="${getReqRep.memberId }"></c:param>
	                                                		</c:url>
		                                                    	<a href="${pReqRepAcceptY }" class="btn btn-primary" style="text-decoration: none;">승인하기</a>
		                                                    <!-- 반려하기 url -->
		                                                    <c:url var="pReqRepAcceptR" value="pReqRepAcceptR.tc">
	                                                			<c:param name="pReqNo" value="${getReqRep.pReqNo }"></c:param>
	                                                			<c:param name="memberId" value="${getReqRep.memberId }"></c:param>
	                                                		</c:url>
		                                                    	<a href="${pReqRepAcceptR }" class="btn btn-warning" style="text-decoration: none;">반려하기</a>
	                                                	</c:if>
	                                                	
	                                                	<!-- if : 반려 하였을 때 -->
	                                                	<c:if test="${getReqRep.pReqAccept eq 'R' }">
	                                                		<button class="btn btn-secondary" disabled>반려한 의뢰</button>
	                                                	</c:if>
	                                                	
	                                                	<!-- if : 승인 하였음 && 답변을 작성하지 않았을 때 -->
	                                                	<c:if test="${getReqRep.pReqAccept eq 'Y' }">
			                                                <c:url var="pReqResultWrite" value="pReqRepResultWrite.tc">
			                                                	<c:param name="pReqNo" value="${getReqRep.pReqNo }"></c:param>
			                                                	<c:param name="personalNo" value="${getReqRep.personalNo }"></c:param>
			                                                	<c:param name="memberId" value="${getReqRep.memberId }"></c:param>
			                                                </c:url>
		                                                    <a href="${pReqResultWrite }" class="btn btn-primary" style="text-decoration: none;">답변하기</a>
	                                                	</c:if>
	                                                	
	                                                	<!-- if : 승인 하였음 && 답변까지 완료 하였을 때 -->
	                                                	<c:if test="${getReqRep.pReqAccept eq 'F' }">
	                                                		답변완료
	                                                	</c:if>
	                                                	
	                                                </td>
	                                                <td>
	                                                	<!--if : 반려한 의뢰 일때 -->
	                                                    <c:if test="${getReqRep.pReqAccept eq 'R'}">
	                                                    	반려한 의뢰
	                                                    </c:if>
	                                                    <!--if : 답변완료 안함 && 확정완료 처리 안되있으면-->
	                                                    <c:if test="${getReqRep.pReqAccept eq 'Y' && getReqRep.pReqCheckBuy eq 'N'}">
	                                                    	답변 미작성
	                                                    </c:if>
	                                                    <!--if : 답변완료 && 확정완료 처리 안되있으면-->
	                                                    <c:if test="${getReqRep.pReqAccept eq 'F' && getReqRep.pReqCheckBuy eq 'N'}">
	                                                    	구매확정 대기
	                                                    </c:if>
	                                                    <!--if : 확정완료 처리되면-->
	                                                    <c:if test="${getReqRep.pReqCheckBuy eq 'Y' }">
	                                                    	확정완료
	                                                    </c:if>
	                                                </td>
	                                            </tr>
                                           </c:forEach>
                                        </tbody>
                                    </table>
					                <br><br>
                                </div>
                                <!-- 의뢰 받은내역 탭 끝 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <c:import url="../common/footer.jsp"/>
    </div>

</body>

</html>