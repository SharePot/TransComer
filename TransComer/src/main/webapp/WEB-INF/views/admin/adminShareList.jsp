<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>번역공유 신청 목록</title>

<!-- 부트스트랩 4.5.0 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!--해당 템플릿의 css-->
<link rel="stylesheet" href="assets/css/main.css" />
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
                        <!--메인 내용 구역 1-->
                        <br>
                        <!--페이지 제목, 아이콘-->
                        <div class="d-flex justify-content-center">
                            <!--아이콘 -->
                            <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-folder" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M9.828 4a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 6.173 2H2.5a1 1 0 0 0-1 .981L1.546 4h-1L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3v1z" />
                                <path fill-rule="evenodd" d="M13.81 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zM2.19 3A2 2 0 0 0 .198 5.181l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3H2.19z" />
                            </svg>&nbsp;&nbsp;&nbsp;&nbsp;
                            <!--페이지 내용 제목-->
                            <span class="h3">번역자료 공유 신청 목록</span>
                        </div>
                        <hr>
                    </div>
                    <div class="col-12">
                        <!--번역 공유 신청 리스트 테이블-->
                        <table class="table table-hover">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col" class="text-center" style="width: 1rem;">NO</th>
                                    <th scope="col" class="text-center" style="width: 10em;">신청자</th>
                                    <th scope="col" class="text-center" style="width: 8rem;">개발언어</th>
                                    <th scope="col" class="text-center" style="width: 8rem;">사용언어</th>
                                    <th scope="col" class="text-center">제목</th>
                                    <th scope="col" class="text-center" style="width: 10rem;">관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--반복되는 테이블 데이터 출력부분-->
                                <c:forEach var="share" items="${shareList }">
	                                <tr class="text-center">
	                                    <th scope="row">${share.shareNo }</th>
	                                    <td>${share.memberId }</td>
	                                    <td>${share.pLanguage }</td>
	                                    <td>${share.tLanguage }</td>
	                                    <td>${share.shareTitle }</td>
	                                    <td>
	                                        <!--if 문으로 해당 글의 승인/반려/미처리 상태를 체크하여 표시-->
	                                        <c:if test="${share.shareYN eq 'N' }">
		                                        <c:url var="adminSelectShareOne" value="adminSelectShareOne.tc">
		                                        	<!-- 쿼리 스트링: ?뒤에오는것 -->
		                                        	<c:param name="shareNo" value="${share.shareNo }"></c:param>
		                                        </c:url>
		                                        <a href="${adminSelectShareOne }" class="btn btn-primary" style="color: white; text-decoration: none;">승인 / 반려</a>
	                                        </c:if>
	                                        <c:if test="${share.shareYN eq 'Y' }">
		                                        <button class="btn btn-success">승인 완료</button>
	                                        </c:if>
	                                        <c:if test="${share.shareYN eq 'R' }">
		                                        <button class="btn btn-secondary" disabled>반려</button>
	                                        </c:if>
	                                    </td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--row 끝-->
                <br><br>
            </div>
            <!--container 끝-->

            <!--페이지 네이션-->
            <div class="justify-content-center" style="text-align: center;">
                <ul class="pagination justify-content-center" style="clear: both;">
                	<!-- 페이징 -->
                </ul>
            </div>

            <br>
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
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.dropotron.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>

</body>
</html>