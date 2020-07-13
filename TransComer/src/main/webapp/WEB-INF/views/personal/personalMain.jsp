<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>1:1 의뢰 메인</title>
    <style>
        .imgbox {
            width: 150px;
            height: 150px;
            border-radius: 70%;
            overflow: hidden;
            /*justify-content: center;*/
        }

        .profile {
            width: 100%;
            height: 100%;
            object-fit: cover;
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
                    <li class="current"><a href="index.html">Home</a></li>
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

                        <!-- Portfolio -->
                        <section>
                            <!-- 검색 -->
                            
                            
                           <!--  <button onclick="location.href='pWriterView.tc';">글쓰기</button> -->
                            <!--  로그인한 사람만 가능 -->
                            <c:if test="${ !empty loginUser }">
								<button onclick="location.href='pWriterView.tc';">글쓰기</button>
							</c:if>


                            <header class="major">
                                <h2>1:1 의뢰</h2>
                            </header>
                            <div class="row">
                            	<c:forEach var="p" items="${list }">
                                <div class="col-4 col-6-medium col-12-small">
                                    <section class="box">
                                        <center>
                                            <div class="imgbox" style="background: #BDBDBD;">
                                                <img class="profile" src="/imges/girl.png">
                                            </div>
                                        </center>
                                        <br>
                                        <header>
                                            <h3></h3>
                                        </header>
                                        <!-- 글 제목 -->
                                        <b>${p.personalTitle }</b>
                                        <hr>
                                        <p>사용가능 언어 : ${p.personalTLang}
                                        <br>사용가능 개발언어: ${p.personalPLang}</p>
                                        <footer>
                                            <ul class="actions">
                                                <li><a href="#" class="button alt">자세히 보기</a></li>
                                            </ul>
                                        </footer>
                                    </section>
                                </div>
                                </c:forEach>

                            </div> 


                            <br><br><br><br>
                            <div class="justify-content-center" style="text-align:center;">
                                <ul class="pagination justify-content-center" style="clear:both;">
                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                </ul>
                            </div>


                            <!--<br><br><br><br>
                            <div class="justify-content-center" style="text-align: center;">
                                <ul class="pagination justify-content-center" style="clear: both;">
                                    ${pageData.pageNavi}
                                </ul>
                            </div>-->

                        </section>
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/jquery.dropotron.min.js"></script>
    <script src="resources/js/browser.min.js"></script>
    <script src="resources/js/breakpoints.min.js"></script>
    <script src="resources/js/util.js"></script>
    <script src="resources/js/main.js"></script>
    <!--템플릿 css-->
    <link rel="stylesheet" href="resources/css/main.css" />

</body>
</html>