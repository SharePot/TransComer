<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셰어팟 소개</title>

<!--해당 페이지 스타일-->
<link rel="stylesheet" href="resources/css/homepageinfo.css" />

</head>
<body class="homepage is-preload">
    <div id="page-wrapper">

        <!-- Header -->
        <%-- <jsp:include page="../common/menuBar.jsp"></jsp:include> --%>
        <c:import url="WEB-INF/views/common/menuBar.jsp"/>

        <!-- Main -->
        <section id="main">
            <!-- 홈페이지 상단으로 가는 버튼-->
            <div class="d-flex justify-content-end">
                <p class="h1" id="topbar">
                    <a href="#main">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-up-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm3.354 8.354a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 6.207V11a.5.5 0 0 1-1 0V6.207L5.354 8.354z" />
                        </svg>
                    </a>
                </p>
            </div>
            <!--컨테이너-->
            <div class="container">
                <!--로우-->
                <div class="row" id="bottom">
                    <!--메인 내용 구역 1-->
                    <div class="col-12">
                        <div class="d-flex justify-content-center">
                            <span class="h1">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-door-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.5 10.995V14.5a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5h-4a.5.5 0 0 1-.5-.5V11c0-.25-.25-.5-.5-.5H7c-.25 0-.5.25-.5.495z" />
                                    <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                </svg>
                                홈페이지 소개
                            </span>
                        </div>
                        <br>
                        <div class="card col-12">
                            <div class="card-body">
                                <blockquote class="blockquote mb-0">
                                    <span style="font-style: normal">
                                        <span class="h4 font-weight-bold">셰어팟은</span>
                                        <br><br>
                                        개발지식, 외국어 능력을 보유한 사람들이 모여
                                        서로 지식, 재능을 공유하여 가치를 창출하는 공간 입니다.
                                    </span>
                                </blockquote>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <!--메인 내용 구역 2(지워도 됨, 자유롭게 추가)-->
                    <div class="col-12">
                        <div class="d-flex justify-content-center">
                            <span class="h2">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-info-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                    <path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z" />
                                    <circle cx="8" cy="4.5" r="1" />
                                </svg>
                                &nbsp;
                                ABOUT
                            </span>
                        </div>
                        <br>
                        <div>
                            <!--페이지 내부 이동-->
                            <ul class="nav nav-fill nav-tabs justify-content-center">
                                <li class="nav-item">
                                    <a class="nav-link font-weight-bold btn-outline-danger" href="#about" style="text-decoration: none;">셰어팟이란?</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link font-weight-bold btn-outline-danger" href="#translate" style="text-decoration: none;">번역 의뢰</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link font-weight-bold btn-outline-danger" href="#share" style="text-decoration: none;">번역 자료 공유</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link font-weight-bold btn-outline-danger" href="#community" style="text-decoration: none;">정보 공유</a>
                                </li>
                            </ul>
                        </div>
                    <br>
                    </div>
                    <!--페이지 설명 링크 실제 컨텐츠-->
                    <!--셰어팟이란-->
                    <div class="col-12" id="about">
                        <div class="d-flex justify-content-center">
                            <!--아이콘-->
                            <!--제목-->
                            <span class="h2">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-people-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z" />
                                </svg>&nbsp;
                                셰어팟이란?
                            </span>
                        </div>
                        <br>
                    </div>

                    <div class="card col-12">
                        <div class="card-body">
                            셰어팟은 회원들이 각자가 가진 지식, 재능의 공유로 개발자가 국내에 국한 되지 않고,
                            <br><br>
                            <span class="h5 font-weight-bold">전 세계 개발 자료를 활용</span>하는데 보템이 되기 위해 만들어졌습니다.
                            <br><br>
                            셰어팟에서는 개발 관련 자료 중 번역이 필요한 부분을 자신의 상황에 맞게
                            <span class="h5 font-weight-bold">단순/실시간/1:1 의뢰</span> 중선택하여 번역가에게 의뢰할 수 있습니다.
                            <br><br>
                            본인이 외국어에 자신이 있는 경우, 의뢰인의 요청을 받아 들여 번역을 하고 일정의 포인트를 지급 받을 수 있습니다.
                            <br><br>
                            <span class="h5 font-weight-bold">번역 결과물을 공유</span>하여 포인트를 지급 받을 수 있고, 셰어팟 회원은 이 공유된 결과물을 열람 할 수 있습니다.
                            <br><br>
                            필요한 스터디 파티원을 구할 수 있고, 개발/번역가들끼리 서로 소통하여, 질의 응답을 통해 또다른 가치를 창출 할 수 있습니다.
                            <br><br>
                        </div>
                    </div>

                    <!--번역의뢰-->
                    <div class="col-12" id="translate">
                        <div class="d-flex justify-content-center">
                            <!--아이콘-->
                            <!--제목-->
                            <span class="h2">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-globe2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M1.018 7.5h2.49c.037-1.07.189-2.087.437-3.008a9.124 9.124 0 0 1-1.565-.667A6.964 6.964 0 0 0 1.018 7.5zM3.05 3.049c.362.184.763.349 1.198.49.142-.384.304-.744.481-1.078a6.7 6.7 0 0 1 .597-.933A7.01 7.01 0 0 0 3.051 3.05zM8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm-.5 1.077c-.67.204-1.335.82-1.887 1.855-.143.268-.276.56-.395.872.705.157 1.473.257 2.282.287V1.077zm0 4.014c-.91-.03-1.783-.145-2.591-.332a12.344 12.344 0 0 0-.4 2.741H7.5V5.091zm1 2.409V5.091c.91-.03 1.783-.145 2.591-.332.223.827.364 1.754.4 2.741H8.5zm-1 1H4.51c.035.987.176 1.914.399 2.741A13.596 13.596 0 0 1 7.5 10.91V8.5zm1 2.409V8.5h2.99a12.343 12.343 0 0 1-.399 2.741A13.596 13.596 0 0 0 8.5 10.91zm-1 1c-.81.03-1.577.13-2.282.287.12.312.252.604.395.872.552 1.035 1.218 1.65 1.887 1.855V11.91zm-2.173 2.563a6.695 6.695 0 0 1-.597-.933 8.857 8.857 0 0 1-.481-1.078 8.356 8.356 0 0 0-1.198.49 7.01 7.01 0 0 0 2.276 1.52zM2.38 12.175c.47-.258.995-.482 1.565-.667A13.36 13.36 0 0 1 3.508 8.5h-2.49a6.964 6.964 0 0 0 1.362 3.675zm8.293 2.297a7.01 7.01 0 0 0 2.275-1.521 8.353 8.353 0 0 0-1.197-.49 8.859 8.859 0 0 1-.481 1.078 6.688 6.688 0 0 1-.597.933zm.11-2.276A12.63 12.63 0 0 0 8.5 11.91v3.014c.67-.204 1.335-.82 1.887-1.855.143-.268.276-.56.395-.872zm1.272-.688c.57.185 1.095.409 1.565.667A6.964 6.964 0 0 0 14.982 8.5h-2.49a13.355 13.355 0 0 1-.437 3.008zm.437-4.008h2.49a6.963 6.963 0 0 0-1.362-3.675c-.47.258-.995.482-1.565.667.248.92.4 1.938.437 3.008zm-.74-3.96a8.854 8.854 0 0 0-.482-1.079 6.692 6.692 0 0 0-.597-.933c.857.355 1.63.875 2.275 1.521a8.368 8.368 0 0 1-1.197.49zm-.97.264c-.705.157-1.473.257-2.282.287V1.077c.67.204 1.335.82 1.887 1.855.143.268.276.56.395.872z" />
                                </svg>&nbsp;
                                번역 의뢰
                            </span>
                        </div>
                        <br>
                    </div>
                    <br>
                    <div class="card col-12">
                        <div class="card-body">
                            <span class="h4 font-weight-bold">* 단순 의뢰</span>
                            <br>
                            - <span class="font-weight-bold">적은 양의 개발 자료 번역</span>이 필요한 경우,
                            게시판에 글을 게재하여 댓글로 답변을 받을 수 있습니다.
                            <br>
                            - 포인트 없이 이용이 가능합니다. 다만, 번역가가 지정되지 않기 때문에 정확한 답을 받지 못할 수 있습니다.
                            <br>
                            - 본인의 답변이 채택되면 100Point를 지급 받습니다.
                            <br><br>

                            <span class="h4 font-weight-bold">* 1:1 의뢰</span>
                            <br>
                            - 번역 의뢰 양이 많은 경우, 번역가 프로필을 조회하여 본인 조건에 가장 적합한
                            <span class="font-weight-bold">번역가를 선택하여 번역을 의뢰</span> 할 수 있습니다.
                            <br>
                            - 프로필에 <span class="font-weight-bold">후기와 별점</span>이 포함되어 있기 때문에, 신뢰도가 높습니다.
                            <br>
                            - 기본금액이 있고, 의뢰 문서 양에 따라 가격이 책정됩니다.
                            <br>
                            - 번역가는 본인이 원하는 페이를 직접 설정 할 수 있습니다.
                            <br><br>

                            <span class="h4 font-weight-bold">* 실시간 의뢰</span>
                            <br>
                            - 긴급한 의뢰건인 경우, 현재 접속한 회원들의 간단한 프로필을 조회하여 실시간으로 의뢰 할 수 있습니다.
                            <br>
                            - 실시간 의뢰건인 경우, 번역가는 다른 번역건에 비해 높은 포인트를 받을 수 있습니다.
                            <br><br>
                        </div>
                    </div>

                    <!--번역 자료 공유-->
                    <div class="col-12" id="share">
                        <div class="d-flex justify-content-center">
                            <!--아이콘-->
                            <!--제목-->
                            <span class="h2">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cloud-arrow-up-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M8 2a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 6.095 0 7.555 0 9.318 0 11.366 1.708 13 3.781 13h8.906C14.502 13 16 11.57 16 9.773c0-1.636-1.242-2.969-2.834-3.194C12.923 3.999 10.69 2 8 2zm2.354 5.146l-2-2a.5.5 0 0 0-.708 0l-2 2a.5.5 0 1 0 .708.708L7.5 6.707V10.5a.5.5 0 0 0 1 0V6.707l1.146 1.147a.5.5 0 0 0 .708-.708z" />
                                </svg>&nbsp;
                                번역 자료 공유
                            </span>
                        </div>
                        <br>
                    </div>
                    <br>
                    <div class="card col-12">
                        <div class="card-body">
                            번역가는 본인이 번역한 결과물을 의뢰자 동의하에 <span class="h5 font-weight-bold">셰어팟에 공유</span>할 수 있습니다.
                            <br><br>
                            관리자가 자료를 확인하고, 컨펌하면 최종적으로 일정기간동안 셰어팟에 번역 자료가 공유됩니다.
                            <br><br>

                            셰어팟 회원은 <span class="h5 font-weight-bold">공유 게시판 자료를 조회</span> 할 수 있습니다.
                            <br><br>
                            인터넷 서치를 할 때 보다, 좀 더 구체적이고 정확한 정보를 얻을 수 있습니다.
                            <br><br>
                        </div>
                    </div>

                    <!--정보 공유-->
                    <div class="col-12" id="community">
                        <div class="d-flex justify-content-center">
                            <!--아이콘-->
                            <!--제목-->
                            <span class="h2">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-folder-symlink-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2l.04.87a1.99 1.99 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3zM2.19 3c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672a1 1 0 0 1 .707.293L7.586 3H2.19zm9.608 5.271l-3.182 1.97c-.27.166-.616-.036-.616-.372V9.1s-2.571-.3-4 2.4c.571-4.8 3.143-4.8 4-4.8v-.769c0-.336.346-.538.616-.371l3.182 1.969c.27.166.27.576 0 .742z" />
                                </svg>&nbsp;
                                정보 공유
                            </span>
                        </div>
                        <br>
                    </div>
                    <br>
                    <div class="card col-12">
                        <div class="card-body">
                            <span class="h5 font-weight-bold">스터디 게시판</span>에서 번역,
                            개발 관련 <span class="h5 font-weight-bold">과외나 스터디</span>를 모집할 수 있습니다.
                            <br><br>
                            <span class="h5 font-weight-bold">QNA 게시판</span>에서 회원끼리
                            <span class="h5 font-weight-bold">자유롭게 질의응답</span>을 통해,
                            번역/개발 관련 지식을 공유하고, 가치를 창출 할 수 있습니다.
                            <br><br>
                            관리자에게 <span class="h5 font-weight-bold">요청사항</span>이나 궁금 사항이 있는 경우
                            QNA게시판을 통해 질문하고 답변을 받을 수 있습니다.
                            <br><br>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
        </section>

        <!-- Footer -->
       	<c:import url="WEB-INF/views/common/footer.jsp"/>
    </div>

</body>
</html>