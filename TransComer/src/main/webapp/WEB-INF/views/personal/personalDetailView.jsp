<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>SharePot</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <style>
        .imgbox {
            width: 150px;
            height: 150px;
            border-radius: 70%;
            overflow: hidden;
        }

        .imgbox2 {
            width: 50px;
            height: 50px;
            border-radius: 70%;
            overflow: hidden;
            /*justify-content: center;*/
        }
        
        .thumbnailImage{
            width: 100%;
            height: 100%;
        }

        .profile {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        #buy {
            width: 80%;
            border-radius: 5px;
            margin: 0 10%;
            background: #fff;
        }

        #box {
            display: inline-block;
            padding: 30px 0 0 0;
        }

        #point1 {
            font-size: 30px;
            color: lightskyblue;
        }

        #point2 {
            font-size: 30px;
            color: orange;
        }

        #point3 {
            font-size: 20px;
            color: black;
        }
    </style>
</head>

<body class="homepage is-preload">
<c:import url="../common/menuBar.jsp"/>
    <div id="page-wrapper">

        <!-- Main -->
        <section id="main">
            <div class="container">
                <center>
                    <h2>상세보기</h2>
                </center>
                <hr>
                <div class="row">
                    <div class="col-8 col-6-medium col-12-small">
                        <img class="thumbnailImage" src="/resources/pUploadFiles/${personal.personalFilePath}">
                    </div>

                    <div class="col-4 col-6-medium col-12-small">
                        <section class="box" style=" border: 0px;">
                            <header>
                                <h3 style=" max-height: : 100%">${personal.personalTitle }</h3>
                            </header>
                            <b style="float:right">${personal.personalPrice }원 ~</b>
                            <br>
                            <hr>
                            <p>- 작업일정 : ${personal.personalSchedule } 일
                                <br>- 사용가능 언어 : ${personal.personalTLang }
                                <br>- 사용가능 개발언어: ${personal.personalPLang }
                            </p>
                            <footer>
                            	<!-- 작성자가 아니면 구매하기 버튼, 작성자이면 수정/삭제 버튼  -->
                            	<c:if test="${loginUser.memberId != personal.memberId }">
                            		<c:if test="${ !empty loginUser }">
                            			<button type="button" class="btn btn-warning btn-lg btn-block" onclick="location.href = 'pRequestView.tc?personalNo=${personal.personalNo}'">의뢰하기</button>
                            		</c:if>
                            		<!-- 로그인이 안 되어있는 경우 -->
                            		<c:if test="${ empty loginUser }">
                            		<button type="button" class="btn btn-warning btn-lg btn-block" onclick="requestPersonal()" >의뢰하기</button>
                            		</c:if>
								</c:if>
                                <c:if test="${loginUser.memberId eq personal.memberId }">
	                                <c:url var="pUpdate" value="pWriterUpdateView.tc">
										<c:param name="personalNo" value="${personal.personalNo }" />
									</c:url>
									<c:url var="pDelete" value="pWriterDelete.tc">
										<c:param name="personalNo" value="${personal.personalNo }" />
									</c:url>
									<center>
		                                <button class="btn btn-primary" style="margin:0 10px; width:35%;" onclick="location.href = '${pUpdate }'"> 수정 </button>
		                               	<%-- <button class="btn btn-secondary" style="margin:0 10px; width:35%;" onclick="location.href = '${pDelete }'"> 삭제 </button> --%>
		                               	<button class="btn btn-secondary" style="margin:0 10px; width:35%;" onclick="deletePersonal()"> 삭제 </button>
		                           	</center>
								</c:if>
                            </footer>
                        </section>
                    </div>
                </div>

                <br>
                <hr><br>
                <div class="row">
                    <div class="col-8 col-6-medium col-12-small">
                        <ul class="nav nav-tabs nav-justified" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#move1" style="text-decoration:none">상세정보</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#move2" style="text-decoration:none">후기</a>
                            </li>
                        </ul>

                        <div class="tab-content">
                         <!-- 서비스 소개 탭 -->
                            <div id="move1" class="container tab-pane active" align="center"><br>
                                <div id="moveInfo1" class="container tab-pane active">
                                    <center><h3>서비스 소개</h3></center>
                                </div>
                                <hr>
                                <div id="moveExplain1" class="container tab-pane active">
                                    ${personal.personalContent}
                                </div>
                            </div>

							<!-- 리뷰/후기 탭 -->
                            <div id="move2" class="container tab-pane fade" align="center"><br>
                                <div id="moveInfo2" class="tab-pane active">
                                    <center>
                                        <h3>서비스 후기</h3>
                                    </center>
                                    <br>
                                    <!-- 별점 -->
                                    <div style="background: white; height:100px; padding:20px 0; border:0.3px solid lightgray">
                                        <h2>4.0</h2>
                                        <h3 style="color:orange">★★★★☆</h3>
                                    </div>
                                </div>
                                
                                <hr>
                                <!-- 리뷰 목록 -->
								<table class="table table-borderless">
									<tr>
										<td rowspan="2" style="width: 50px">
											<div class="imgbox2">
												<img class="profile" src="">
											</div>
										</td>
										<td style="font-style: bold; color: darkblue">${r.memberId}</td>
									</tr>
									<tr>
										<td>${r.revContent }</td>
									</tr>
								</table>
								
								
								<hr>
								<!-- 리뷰 등록  -->
                                <div class="col-sm-12 col-md-12">
                               		<c:if test="${ !empty loginUser }">
	                                    <form action="pReview.tc">
	                                    	<input type="hidden" id="revTargetMemberId" name="revTargetMemberId" value="${personal.memberId }">
	                                        <input type="hidden" name="personalNo" value="${personal.personalNo }" />
	                                        <textarea id="Q_Contents" class="DOC_TEXT" name="revContent" rows="4" cols="60" placeholder="구매하신 상품의 후기를 입력해주세요 최대 50자"></textarea>
	                                        <br>
	                                        <span style="color:#aaa;" id="counter">(0 / 최대 50자)</span>
	
	                                        <%-- <input type="hidden" name="" value="${}"> --%>
	
	                                        <input type="submit" class="btn btn-success" value="등록">
	                                        <input type="reset" class="btn" value="취소">
	                                    </form>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>


					<!-- 프로필 -->
                    <div class="col-4 col-6-medium col-12-small">
                        <section class="box" style=" border: 0px;">
                            <center>
                                <div class="imgbox" style="background: ">
                                    <img class="profile" src="/imges/girl.png">
                                </div>
                            </center>
                            <br>
                            <header>
                                <h3 style="text-align:center">${personal.memberId }</h3>
                            </header>
                            <hr>
                            <p> 숙명여대 법학부&국제통상학과 졸업
                                <br>대표이사 비서& 무역회사 근무 3년
                                <br>국제통번역협회 자격증 1급
                                <br>Business English Translator Lev 1
                                <br>TOEIC 910 JLPT 2급
                                <br>사용가능 개발언어: JAVA</p>
                            <footer>
                                <ul class="actions">
                                    <li>
                                        <a href="#" class="button alt">쪽지 보내기</a>
                                    </li>
                                </ul>
                            </footer>
                        </section>
                    </div>
                </div>

                <br><br>


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
    <!--템플릿 css-->
    <link rel="stylesheet" href="resources/css/main.css" />
    
    <script>
    	function deletePersonal() {
    		if (confirm("정말 삭제하시겠습니까??") == true){  
    				self.location.href = "pWriterDelete.tc?personalNo=${personal.personalNo }";
    			}else{   
    			   return false;
    			}
		}
    	
    	function requestPersonal() {
    		if (confirm("로그인 후에 이용가능합니다.") == true){  
				self.location.href = "loginPage.tc";
			}else{   
			   return false;
			}
    	}
    	
    	
    </script>
    
    

</body></html>
