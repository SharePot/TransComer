<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 의뢰 번역 결과</title>
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
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-file-text-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M12 1H4a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zM5 4a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1H5zm-.5 2.5A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zM5 8a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1H5zm0 2a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1H5z" />
                                </svg>
                                1:1 의뢰 신청 결과
                            </h2>
                        </div>
                        <hr>
                        <form action="/" method="post" id="personalForm">
                            <h3>* 번역 신청 정보</h3>
                            <br>
                            <label>번역가</label>
                            <input type="text" id="personalWriter" name="personalWriter" readonly value="${pReqRep.pRepTranslator }">
                            <br><br>
                            <label>신청 개발언어</label>
                            <input type="text" id="pReqPLang" name="pReqPLang" readonly value="${pReqRep.pReqPLang }">
                            <br><br>
                            <label>신청 번역언어</label>
                            <input type="text" id="pReqTLang" name="pReqTLang" readonly value="${pReqRep.pReqTLang }">

                            <hr>
                            <h4>* 첨부파일</h4>
                            <!--첨부파일 갯수만큼 for 반복-->
                            <img src="https://img.wkorea.com/w/2020/06/style_5edf522a85fed-700x467.jpg" style="width: 100%;">

                            <hr>
                            <h4>* 세부요청 사항</h4>
                            <div class="card">
                                <div class="card-body">
                                    ${pReqRep.pReqDetail }
                                </div>
                            </div>
                            <hr>
                            <h4>* 번역 의뢰 내용</h4>
                            <div class="wrap">
                                <textarea id="pReqContent" style="height:300px; margin-bottom:10px;" readonly>${pReqRep.pReqContent }</textarea>
                                글자수 :&nbsp;<span id="counter"></span>
                            </div>
                            <h2 id="price" class="float-right">가격 : ${pReqRep.pReqPrice }</h2>
                            <br>
                            <p class="float-right">(100자 당 가격 : ${personal.personalPrice } 원)</p>
                            <hr>
                            <p class="h5 font-weight-bold">* 번역 결과</p>
                            <div class="card">
                                <div class="card-body">
                                    ${pReqRep.pRepResult }
                                </div>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-center">
                                <a href="myReqRepList.tc" class="btn btn-primary" style="text-decoration: none">목록가기</a>
                            </div>
                        </form>
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
    <script>
        $(document).ready(function() {
            // 의뢰 내용 총 글자수를 세어 출력
            var pReqContent = $("#pReqContent").val();
            $(this).height(((pReqContent.split('\n').length + 1) * 1.5) + 'em');
            $('#counter').html(pReqContent.length + '&nbsp자');
        });
    </script>
</body>
</html>