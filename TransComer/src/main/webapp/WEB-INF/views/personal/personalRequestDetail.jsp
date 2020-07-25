<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 요청글 상세보기</title>
<!--부트스트랩 4.5.0-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- 페이지 용 제작 -->
<link rel="stylesheet" href="resources/css/personalReqRep.css" />
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
                            <h2>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-file-text" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4 1h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H4z" />
                                    <path fill-rule="evenodd" d="M4.5 10.5A.5.5 0 0 1 5 10h3a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 8h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 4h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z" />
                                </svg>
                                1:1 의뢰 신청 내용
                            </h2>
                        </div>
                        <hr>
                        <form action="/" method="post" id="personalForm">
                            <h3>* 번역가 정보</h3>
                            <br>
                            <label>번역가</label>
                            <input type="text" id="personalWriter" name="personalWriter" readonly value="${personal.memberId }">
                            <br><br>
                            <label>개발언어</label>
                            <input type="text" id="personalPLang" name="personalPLang" readonly value="${personal.personalPLang }">
                            <br><br>
                            <label>사용언어</label>
                            <input type="text" id="personalTLang" name="personalTLang" readonly value="${personal.personalTLang }">
                            <br><br>
                            <label>번역 작업 소요 시간</label>
                            <input type="text" id="personalSchedule" name="personalSchedule" readonly value="승인일로부터 [ ${personal.personalSchedule } ] 일 후">
                            <br><br>
                            <label>번역 가격(100자 당)</label>
                            <input type="text" id="personalPrice" name="personalPrice" readonly value="${personal.personalPrice }">
                            <br><br>

                            <hr>
                            <h3>* 번역신청 내용 작성</h3>
                            <br>
                            <label>신청 개발언어</label>
                            <input type="text" id="pReqPLang" name="pReqPLang" readonly value="${pReqRep.pReqPLang }">
                            <br><br>
                            <label>신청 번역언어</label>
                            <input type="text" id="pReqTLang" name="pReqTLang" readonly value="${pReqRep.pReqTLang }">
                            <br><br>

                            <hr>
                            <h4>첨부파일</h4>
                            <br>
                            <!--첨부파일 갯수만큼 for 반복-->
                            <c:forEach var="file" items="${flist }">
                            	<img src="resources/${file.memberId }/uploadFiles/${file.fileName }" style="width: 100%;">
                            	<br>
                            </c:forEach>

                            <hr>
                            <h4>번역 의뢰 내용</h4>
                            <br>
                            <div class="wrap">
                                <textarea id="pReqContent" style="height:300px; margin-bottom:10px;" readonly>${pReqRep.pReqContent }</textarea>
                                글자수 :&nbsp;<span id="counter"></span>
                            </div>
                            <br>
                            <h2 id="price" class="float-right">가격 : ${pReqRep.pReqPrice }</h2>
                            <br><br>
                            <!--style="float:right;"-->
                            <p class="float-right">(100자 당 가격 : ${personal.personalPrice } 원)</p>
                            <br>
                            <hr>
                            <h4>세부요청 사항</h4>
                            <div class="card">
                                <div class="card-body">
                                    ${pReqRep.pReqDetail }
                                </div>
                            </div>
                            <br><br>
                            <div class="d-flex justify-content-center">
                                <!--번역가, 의뢰자는 상세페이지에서 목록으로 돌아가기를 누른다-->
                                <a href="myReqRepList.tc" class="btn btn-primary" style="text-decoration: none;">목록으로</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>


        <!-- Footer -->
        <c:import url="../common/footer.jsp"/>

    </div>

    <!-- Scripts -->
    <script>
        // 문서가 시작되었을때, 신청글의 글자수와 가격을 측정하여 출력
        $(document).ready(function() {
            // 의뢰 내용 총 글자수를 세어 출력
            var pReqContent = $("#pReqContent").val();
            $(this).height(((pReqContent.split('\n').length + 1) * 1.5) + 'em');
            $('#counter').html(pReqContent.length + '&nbsp자');
        });
    </script>
</body>
</html>