<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
    <title>SharePot Main</title>
    <meta charset="utf-8" />
	<link rel="stylesheet" href="assets/css/main.css" />

    <style>
        .imgbox {
            width: 150px;
            height: 150px;
            border-radius: 70%;
            overflow: hidden;
            top: -100px;
            /*justify-content: center;*/
        }

        .profile {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        #medal {
            position: relative;
            /*top: 0px;*/
            left: -63px;
            margin-top: 0px;
        }
    </style>

</head>

<body class="homepage is-preload">
    <div id="page-wrapper">
    <c:import url="../common/menuBar.jsp" />

	<section id="main" style="background:white;">
            <!-- Banner -->
            <section id="banner">
                <header>
                   <!-- <h2>Howdy. This is Dopetrope.</h2>
                    <p>A responsive template by HTML5 UP</p>-->
                </header>
            </section>

            <!-- Intro -->
            <section id="intro" class="container">
                <br><br>
                <header class="major">
                    <h2 style="color:orange; background:white;">STAR LANKING</h2>
                </header>
                <div class="row">
                    <div class="col-4 col-12-medium">
                        <section class="first">
                            <div style="height:0px;">
                                <img id="medal" src="/resources/css/images//first1.png"></div>
                            <center>
                                <div class="imgbox" style="background: #BDBDBD;">
                                    <img class="profile" src="/resources/css/images//girl.png">
                                </div>
                            </center>
                            <br>
                            <header>
                                <h2>USER1</h2>
                            </header>
                            <p>사용 언어 : 영어
                                <br>사용 개발언어: JAVA
                                <br>평균 평점 : 4.5점
                            </p>
                            <br>
                            <a href="#" class="button" style="background : orange">문의하기</a>
                        </section>
                    </div>
                    <div class="col-4 col-12-medium">
                        <section class="middle">
                            <div style="height:0px;">
                                <img id="medal" src="/resources/css/images//second2.png"></div>
                            <center>
                                <div class="imgbox" style="background: #BDBDBD;">
                                    <img class="profile" src="/resources/css/images//girl.png">
                                </div>
                            </center>
                            <br>
                            <header>
                                <h2>USER2</h2>
                            </header>
                            <p>사용 언어 : 영어
                                <br>사용 개발언어: JAVA
                                <br>평균 평점 : 4.5점
                            </p>
                            <br>
                            <a href="#" class="button" style="background : orange">문의하기</a>
                        </section>
                    </div>
                    <div class="col-4 col-12-medium">
                        <section class="last">
                            <div style="height:0px;">
                                <img id="medal" src="/resources/css/images//third2.png"></div>
                            <center>
                                <div class="imgbox" style="background: #BDBDBD;">
                                    <img class="profile" src="/resources/css/images//girl.png">
                                </div>
                            </center>
                            <br>
                            <header>
                                <h2>USER3</h2>
                            </header>
                            <p>사용 언어 : 영어
                                <br>사용 개발언어: JAVA
                                <br>평균 평점 : 4.5점
                            </p>
                            <br>
                            <a href="#" class="button" style="background : orange">문의하기</a>
                        </section>
                    </div>
                </div>
            </section>



        </section>






        <!-- Main -->
        <section id="intro2">
            <div class="container">
                <br><br>
                <header class="major">
                    <h2 style="color:gold;">ADOPTION LANKING</h2>
                </header>
                <div class="row">
                    <div class="col-4 col-12-medium">
                        <section class="first">
                            <div style="height:0px;">
                                <img id="medal" src="/resources/css/images//first1.png"></div>
                            <center>
                                <div class="imgbox" style="background: #BDBDBD;">
                                    <img class="profile" src="/resources/css/images//girl.png">
                                </div>
                            </center>
                            <br>
                            <header>
                                <h2>USER1</h2>
                            </header>
                            <p>사용 언어 : 영어
                                <br>사용 개발언어: JAVA
                                <br>누적 채택수 : 50개
                            </p>
                            <br>
                            <a href="#" class="button" style="background : gold">문의하기</a>
                        </section>
                    </div>
                    <div class="col-4 col-12-medium">
                        <section class="middle">
                            <div style="height:0px;">
                                <img id="medal" src="/resources/css/images//second2.png"></div>
                            <center>
                                <div class="imgbox" style="background: #BDBDBD;">
                                    <img class="profile" src="/resources/css/images//girl.png">
                                </div>
                            </center>
                            <br>
                            <header>
                                <h2>USER2</h2>
                            </header>
                            <p>사용 언어 : 영어
                                <br>사용 개발언어: JAVA
                                <br>누적 채택수 : 50개
                            </p>
                            <br>
                            <a href="#" class="button" style="background : gold">문의하기</a>
                        </section>
                    </div>
                    <div class="col-4 col-12-medium">
                        <section class="last">
                            <div style="height:0px;">
                                <img id="medal" src="/resources/css/images//third2.png"></div>
                            <center>
                                <div class="imgbox" style="background: #BDBDBD;">
                                    <img class="profile" src="/resources/css/images//girl.png">
                                </div>
                            </center>
                            <br>
                            <header>
                                <h2>USER3</h2>
                            </header>
                            <p>사용 언어 : 영어
                                <br>사용 개발언어: JAVA
                                <br>누적 채택수 : 50개
                            </p>
                            <br>
                            <a href="#" class="button" style="background : gold">문의하기</a>
                        </section>
                    </div>
                </div>
            </div>
        </section>
        </section>
        <br>


        <!-- Footer -->
        <c:import url="footer.jsp"/>

    </div>

</body></html>