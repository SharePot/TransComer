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
        #WriterForm {
            margin-left: 15%;
            margin-right: 15%;
        }

        #WriterForm input {
            width: 70%;
            display: inline-block;
            margin-left: 20%;
        }

        #WriterForm label {
            float: left;
            width: 10%;
            margin-top: 10px;
            color: gray;
        }

        #WriterForm select {
            width: 24.5%;
            display: inline-block;
        }

        #introduce {
            width: 70%;
            /*height: 300px;*/
            border: 1px solid gray;
            display: inline-block;
            margin: 0 15%;
        }

        .imgBox {
            width: 30%;
            height: 100%;
            display: inline-block;
            /*margin: 13% 5%;*/
            padding: 10% 0;
        }
        
        #profileImage {
            width: 80%;
            height: auto;
            object-fit: cover;
            border-radius: 70%;
            overflow: hidden;
            position: relative;
            margin: 10% 10%;
        }

        .card-body {
            display: inline-block;
            width: 70%;
            height: auto;
            float: right;
        }
        select {
            display: inline-block;
            width: 30px;
        }
    </style>
</head>

<body class="homepage is-preload">
<c:import url="../common/menuBar.jsp"/>
    <div id="page-wrapper">

        <!-- Header -->
        <!-- <section id="header">

            Logo
            <h1><a href="index.html">SharePot</a></h1>

            Nav
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
        </section> -->

        <!-- Main -->
        <section id="main">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <center>
                            <h2>' ${loginUser.memberId } ' 님의 번역가 등록</h2>
                        </center>
                        <hr>
                        <div class="card" id="introduce">
                            <div class="imgBox">
                                <img src="" id="profileImage" alt="" />
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">자기소개</h5>
                                <hr>
                                <p class="card-text"> </p>
                            </div>
                        </div>
                        <form action="pWriterInsert.tc" method="post" id="WriterForm" enctype="Multipart/form-data">
                            <div id="profileContent">
                                <br>
                                <label>글제목</label>
                                <input type="text" name="personalTitle" placeholder="제목을 입력해주세요" value="">
                                <br><br>
                                <label>글내용</label>
                                <textarea type="text" name="personalContent" placeholder="내용을 입력해주세요" style=" width: 70%; display: inline-block; margin-left: 20%;"></textarea>
                                <br><br>
                                <label>작업 일정</label>
                                <input type="text" name="personalSchedule" style="width:120px" placeholder="최대 소요 기간" value="">&nbsp;일
                                <br><br>
                                <label>개발 언어</label>
                                    <select name='pLang1' class="pLang_first" style="margin-left: 20%; width:20%;">
                                        <option value='' selected>-- 필수 선택--</option>
                                        <option>JAVA</option>
                                        <option>Javascript</option>
                                        <option>C</option>
                                        <option>C++</option>
                                        <option>C#</option>
                                        <option>Python</option>
                                        <option>PHP</option>
                                        <option>Ruby</option>
                                        <option value=''>없음</option>
                                    </select>

                                    <select name='pLang2' class="pLang_second" style="margin-top:10px; width:20%;">
                                        <option value='' selected>-- 선택 --</option>
                                        <option>JAVA</option>
                                        <option>Javascript</option>
                                        <option>C</option>
                                        <option>C++</option>
                                        <option>C#</option>
                                        <option>Python</option>
                                        <option>PHP</option>
                                        <option>Ruby</option>
                                        <option value=''>없음</option>
                                    </select>

                                    <select name='pLang3' class="pLang_third" style="margin-top:10px; width:20%;">
                                        <option value='' selected>-- 선택 --</option>
                                        <option>JAVA</option>
                                        <option>Javascript</option>
                                        <option>C</option>
                                        <option>C++</option>
                                        <option>C#</option>
                                        <option>Python</option>
                                        <option>PHP</option>
                                        <option>Ruby</option>
                                        <option value=''>없음</option>
                                    </select>
                                

                                <br><br>
                                <label>사용 언어</label>
                                <select name='tLang1' class="tLang_first" style="margin-left: 20%; width:20%;">
                                        <option value='' selected>-- 필수 선택--</option>
                                        <option>영어</option>
                                        <option>중국어</option>
                                        <option>일본어</option>
                                        <option>프랑스어</option>
                                        <option>이탈리아어</option>
                                        <option>스페인어</option>
                                        <option>러시아어</option>
                                        <option value=''>없음</option>
                                    </select>
                                 <select name='tLang2' class="pLang_second" style="margin-top:10px; width:20%;">
                                        <option value='' selected>-- 선택 --</option>
                                        <option>영어</option>
                                        <option>중국어</option>
                                        <option>일본어</option>
                                        <option>프랑스어</option>
                                        <option>이탈리아어</option>
                                        <option>스페인어</option>
                                        <option>러시아어</option>
                                        <option value=''>없음</option>
                                    </select>
                                 <select name='tLang3' class="pLang_third" style="margin-top:10px; width:20%;">
                                        <option value='' selected>-- 선택 --</option>
                                        <option>영어</option>
                                        <option>중국어</option>
                                        <option>일본어</option>
                                        <option>프랑스어</option>
                                        <option>이탈리아어</option>
                                        <option>스페인어</option>
                                        <option>러시아어</option>
                                        <option value=''>없음</option>
                                    </select>
                                </div>
                                <br><br>
                                <label>가격</label>
                                <input type="text" id="personalPrice" name="personalPrice" style="width:120px" placeholder="" value="">&nbsp;P/100자 당
        
                            <hr>
                            <p style="font-size: 10pt;">- 마이페이지에서 파워번역가를 등록하면 상단에 번역게시물을 띄워드립니다.
                                <br>- 번역 결과 공개 신청을 하면 3000포인트를 지급해드립니다.
                                <br>- 단, 의뢰자가 공개를 허용하지 않는다면 번역은 공개되지 않습니다.</p>
	

                            <br><br>
                            <input type="hidden" value=${loginUser.memberId } name="memberId">
                            <center>
                            	<input type="submit" value="등록">&nbsp;&nbsp;
								<input type="reset" value="취소">
                                <!-- <button type="button" class="btn btn-primary" type="submit" style="margin:0 20px; width:100px;"> 등록 </button>
                                <button type="button" class="btn btn-secondary" type="reset" style="margin:0 20px; width:100px;"> 취소 </button> -->
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
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"> -->

    <!-- <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/jquery.dropotron.min.js"></script>
    <script src="resources/js/browser.min.js"></script>
    <script src="resources/js/breakpoints.min.js"></script>
    <script src="resources/js/util.js"></script>
    <script src="resources/js/main.js"></script> -->
    <!--템플릿 css-->
     <link rel="stylesheet" href="resources/css/main.css" />

</body></html>