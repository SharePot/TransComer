<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 번역 결과 작성</title>
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
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                </svg>
                                1:1 의뢰 신청 번역 결과 작성
                            </h2>
                        </div>
                        <hr>
                        <!-- 번역 정보 -->
                        <form action="pReqRepResultUpdate.tc" method="post" id="personalForm">
                        	<input type="hidden" id="personalWriter" name="memberId" readonly value="${pReqRep.memberId }">
                        	<input type="hidden" id="personalNo" name="personalNo" readonly value="${pReqRep.personalNo }">
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
                            <c:forEach var="file" items="${flist }">
                               <img src="resources/${file.memberId }/uploadFiles/${file.fileName }" style="width: 100%;">
                               <br>
                            </c:forEach>

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
                            <!-- 번역 결과 글 번호 -->
                            <input type="hidden" name="pReqNo" value="${pReqRep.pReqNo }">
                            <textarea rows="20" required name="pRepResult" id="pRepResult"></textarea>
                            <hr>
                            <div class="d-flex justify-content-center">
                                <button onclick="return check_input();" class="btn btn-primary">결과 등록하기</button>
                                &nbsp;&nbsp;&nbsp;
                                <a href="myReqRepList.tc" class="btn btn-secondary" style="text-decoration: none">취소하기</a>
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
        $(document).ready(function() {
            // 의뢰 내용 총 글자수를 세어 출력
            var pReqContent = $("#pReqContent").val();
            $(this).height(((pReqContent.split('\n').length + 1) * 1.5) + 'em');
            $('#counter').html(pReqContent.length + '&nbsp자');
        });
        
		    // 모든 입력사항을 입력했는지 확인하는 스크립트
			function check_input(){
				var result = $("#pRepResult").val();
				if(result !=""){
					checkResultWrite();
				} else{
					alert("번역 결과 내용을 입력해주세요.");
					return false;
				}
			}
			// 작성한 결과 내용 글을 등록할 것인지 묻는 함수
            function checkResultWrite(){
                var check = window.confirm("번역 결과를 등록하시겠습니까?");
                if (check) {
                    return true;
                } else {
                    return false;
                }
            }
        
    </script>
</body>
</html>