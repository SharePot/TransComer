<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
    <title>SharePot</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <style>
        #personalForm {
            margin-left: 15%;
            margin-right: 15%;
        }

        #personalForm input {
            width: 50%;
            display: inline-block;
            margin-left: 20%;
        }

        #personalForm label {
            float: left;
            width: 30%;
            margin-top: 10px; 
            color: gray;
        }
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
                        <center>
                            <h2>1:1 의뢰 신청</h2>
                        </center>
                        <hr>
                        <form action="pReqInsert.tc" method="post" id="personalForm" enctype="Multipart/form-data">
                            <h3>* 번역가 정보</h3>
                            <br>
                            <label>번역가</label>
                            <input type="text" id="memberId" name="memberId" placeholder="번역가 이름" readonly value="${personal.memberId }">
                            <br><br>
                            <label>개발언어</label>
                            <input type="text" id="personalPLang" name="personalPLang" placeholder="번역가의 개발언어" readonly value="${personal.personalPLang} ">
                            <br><br>
                            <label>사용언어</label>
                            <input type="text" id="personalTLang" name="personalTLang" placeholder="번역가의 사용언어" readonly value="${personal.personalTLang}">
                            <br><br>
                            <label>번역 작업 소요 일정</label>
                            <input type="text" id="personalSchedule" name="personalSchedule" placeholder="번역가의 작업시간" readonly value="${personal.personalSchedule}">
                            <br><br>
                            <label>번역 가격(100자 당)</label>
                            <input type="text" id="personalPrice" name="personalPrice" placeholder="번역가가 설정한 가격" readonly value="${personal.personalPrice}">
                            <br><br>

                            <hr>
                            <h3>* 번역신청 내용 작성</h3>
                            <br>
                            <label>신청 개발언어</label>
                            <input type="text" id="pReqPLang" name="pReqPLang" placeholder="의뢰 개발언어">
                            <br><br>
                            <label>신청 번역언어</label>
                            <input type="text" id="pReqTLang" name="pReqTLang" placeholder="번역을 원하는 언어">
                            <br><br>

                            <hr>
                            <h4>첨부파일(최대 5개까지 첨부)</h4>
                            <br>
                            <input type="file" name="uploadFile" style="margin:0;"/>
                            <!--파일 여러개 넣기-->
                            <input multiple="multiple" type="file" name="reqUploadFile[]" style="margin:0;"/>
                            <br><br>

                            <hr>
                            <h4>번역 의뢰 내용</h4>
                            <br>
                            <div class="wrap">
                                <textarea id="pReqContent" placeholder="번역을 원하는 내용을 입력하세요" style="height:300px; margin-bottom:10px;"></textarea>
                                현재 글자수 :&nbsp;<span id="counter">###</span>
                            </div>
                            <br>
                            <h4 id="price" style="float:right;">현재가격 : <input readonly id="req_Price" name="pReqPrice" value="${PersonalReqRep.pReqPrice}"></h4>
                            <br>
                            <p style="float:right; font-size:13px;">(100자 당 가격 : ${personal.personalPrice }원)</p>
                            <br><br>

                            <hr>
                            <h4>세부요청 사항</h4>
                            <br>
                            <textarea id="pReqCommnet" placeholder="요청사항을 입력해주세요" style="height:100px;"></textarea>

                            <br><br>
                            <center>
                                <button type="button" class="btn btn-primary btn-lg" type="submit"> 신청하기 </button>
                            </center>
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
    
    <!--의뢰 내용 글자수 세기-->
    <script>
        $(function() {
            $('#pReqContent').keyup(function(e) {
                var pReqContent = $(this).val();
                $(this).height(((pReqContent.split('\n').length + 1) * 1.5) + 'em');
                $('#counter').html(pReqContent.length + '&nbsp자');
            });
            $('#pReqContent').keyup();
        });
    </script>

    <script>
	    $(function() {
	        $('#pReqContent').keyup(function(e) {
	            var pReqContent = $(this).val();
	            var personalPrice = "${personal.personalPrice}";
	            $(this).height(((pReqContent.split('\n').length + 1) * 1.5) + 'em');
	            $('#price').html('현재가격 : ' + parseInt((pReqContent.length / 100) + 1) * personalPrice + '원');
	        });
	        $('#pReqContent').keyup();
	    });
    </script>


</body></html>