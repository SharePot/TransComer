<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>나의 1:1 의뢰 내역</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

<!-- Scripts -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<!--템플릿 css-->
<link rel="stylesheet" href="assets/css/main.css" />
</head>

<body class="homepage is-preload">
    <div id="page-wrapper">

        <!-- Header -->
        <section id="header">

            <!-- Logo -->
            <h1><a href="index.html">SharePot</a></h1>

            <!-- Nav -->
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
        </section>

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
                                        <center>
                                            <h3>1:1 의뢰 신청 내역</h3>
                                        </center>
                                    </div>
                                    <br>

                                    <table class="table">
                                        <thead class="thead-hover">
                                            <tr class="text-center">
                                                <th scope="col">No</th>
                                                <th scope="col" class="text-center">날짜</th>
                                                <th scope="col" class="text-center">번역가</th>
                                                <th scope="col" class="text-center">의뢰내용(제목)</th>
                                                <th scope="col" class="text-center">금액</th>
                                                <th scope="col" class="text-center">답변 상태</th>
                                                <th scope="col" class="text-center">구매확정</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="text-center">
                                                <th scope="row">1</th>
                                                <td>2020-04-17</td>
                                                <td>홍길동</td>
                                                <td>중국어 개발자료 번역 부탁드립니다.</td>
                                                <td>10,000P</td>
                                                <td>답변완료</td>
                                                <td>확정완료</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">2</th>
                                                <td>2020-05-06</td>
                                                <td>임꺽정</td>
                                                <td>영어 번역 부탁드려요.</td>
                                                <td>5,000P</td>
                                                <td>미처리</td>
                                                <td>
                                                    <button type="button" class="btn btn-primary" type="submit">확정하기</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">3</th>
                                                <td>2020-06-21</td>
                                                <td>유관순</td>
                                                <td>영어 번역 의뢰 드립니다.</td>
                                                <td>10,000P</td>
                                                <td>미처리</td>
                                                <td>
                                                    <button type="button" class="btn btn-primary" type="submit">확정하기</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <!--의뢰 받은 내역 탭-->
                                <div id="move2" class="tab-pane fade" align="center"><br>
                                    <div id="moveInfo1" class="container tab-pane active">
                                        <center>
                                            <h3>1:1 의뢰 받은 내역</h3>
                                        </center>
                                    </div>
                                    <br>

                                    <table class="table">
                                        <thead class="thead-hover">
                                            <tr>
                                                <th scope="col">No</th>
                                                <th scope="col" class="text-center">날짜</th>
                                                <th scope="col" class="text-center">의뢰자</th>
                                                <th scope="col" class="text-center">의뢰내용(제목)</th>
                                                <th scope="col" class="text-center">금액</th>
                                                <th scope="col" class="text-center">처리</th>
                                                <th scope="col" class="text-center">구매확정</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="text-center">
                                                <th scope="row">1</th>
                                                <td>2020-04-17</td>
                                                <td>이용자</td>
                                                <td>중국어 개발자료 번역 부탁드립니다.</td>
                                                <td>10,000P</td>
                                                <td>
                                                    <button type="button" class="btn btn-primary">답변하기</button>
                                                    <button type="button" class="btn btn-warning">반려하기</button>
                                                </td>
                                                <td>확정완료</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">2</th>
                                                <td>2020-05-06</td>
                                                <td>사용자</td>
                                                <td>영어 번역 부탁드려요.</td>
                                                <td>5,000P</td>
                                                <td>
                                                    <button type="button" class="btn btn-primary" type="submit">답변하기</button>
                                                    <button type="button" class="btn btn-warning" type="submit">반려하기</button>
                                                </td>
                                                <td>미확정</td>
                                                <!--확정하기 버튼 만들기-->
                                            </tr>
                                            <tr>
                                                <th scope="row">3</th>
                                                <td>2020-06-21</td>
                                                <td>오용자</td>
                                                <td>영어 번역 의뢰 드립니다.</td>
                                                <td>10,000P</td>
                                                <td>
                                                    <button type="button" class="btn btn-primary">답변하기</button>
                                                    <button type="button" class="btn btn-warning">반려하기</button>
                                                </td>
                                                <td>미확정</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <br><br><br><br>
                <!--페이징 -->
                <div class="justify-content-center" style="text-align: center;">
                    <ul class="pagination justify-content-center" style="clear: both;">
                        <%-- ${pageData.pageNavi} --%>
                    </ul>
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

    

</body>
</html>