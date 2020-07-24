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
        
        #content {
            border-radius: 5px;
    		border: solid 1px #dddddd;
    		width: 100%;
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
        
        .starR {
  			background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
 			 background-size: auto 100%;
 			 width: 30px;
 			 height: 30px;
 			 display: inline-block;
 			 text-indent: -9999px;
 			 cursor: pointer;
		}
		
		.starR.on {
			background-position:0 0;
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
                                <br>- 글 번호 :  ${personal.personalNo}
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
                                <div id="reviewDiv">
								<!-- 	<table class="table table-borderless" id="rTable">
										
									</table> -->
								</div>
                                
								
								<hr>
								<p>${personalReqRep.pRepTranslator }</p>
								<!-- 리뷰 등록  -->
                                <div class="col-sm-12 col-md-12">
								<input type="hidden" name="pRepTranslator" value="${personal.memberId}">
								<input type="hidden" name="memberId" value="${personal.memberId}"> 
                                	<c:if test="${ !empty loginUser }">
                                	<%-- <c:if test="${ loginUser.memberId eq personalReqRep.memberId }"> --%>
                               		<%-- <c:if test="${ personalReqRep.pReqCheckBuy != null  }"> --%>
										<div class="starRev">
											<span class="starR">1</span>
											<span class="starR">2</span>
											<span class="starR">3</span>
											<span class="starR">4</span>
											<span class="starR">5</span>
										</div>
										<b id="starScore"></b><b>점</b>
										<br><br>
	                                    	<input type="hidden" id="revTargetMemberId" name="revTargetMemberId" value="${personal.memberId }">
	                                        <input type="hidden" id="revPersonalNo" name="personalNo" value="${personal.personalNo }" />
	                                        <textarea id="content" rows="4" cols="60" placeholder="후기를 입력해주세요." maxlength="100"></textarea>
	                                        <!-- <textarea id="Q_Contents" class="DOC_TEXT" name="revContent" rows="4" cols="60" placeholder="구매하신 상품의 후기를 입력해주세요 최대 50자"></textarea> -->
	                                        <span style="color:#aaa; float:right;" id="counter">(0 / 최대 100자)</span>
	                            
											<br><br>
											<input type="submit" id="submit" class="btn" style="background:blue;" value="등록">
	                                        <input type="reset" class="btn" value="취소">
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
                                    <img class="profile" src="/resources/uploadFiles/${profile.profileFilePath}">
                                </div>
                            </center>
                            <br>
                            <header>
                                <h3 style="text-align:center">${personal.memberId }</h3>
                                <%-- <b>${profile.memberId}</b> --%>
                            </header>
                            <hr>
                            <p>${profile.introduce }</p>
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
    	
    	
    	/* 리뷰 */
    	
    	$(function(){
         // 초기 페이지 로딩 시 댓글 불러오기
         getReviewList(); //이게 실행되면 밑에 댓글들 나옴 (ajax가 실행됨)
         
         /* setInterval(function() {
        	 getReviewList();
         }, 10000); //10초 마다 불러옴 */
         
         
         // 댓글 등록 Ajax
         $("#submit").on("click", function() {
			
        	 var starRage = $("#starScore").html(); // 별점
        	 var revContent = $("#content").val(); // 댓글의 내용
        	 var revTargetMemberId = $("#revTargetMemberId").val();
        	 var rPersonalNo = ${personal.personalNo}; // 어느 게시글의 댓글인지 알려줌
        	 //var revTargetMemberId = ${personal.memberId};
        	 
        	 alert("starRage : "+starRage);
        	 alert("revContent : "+revContent);
        	 alert("rPersonalNo : "+rPersonalNo);
        	 alert("revTargetMemberId : "+revTargetMemberId);
        	 
        	 
        	 $.ajax({
        		 url : "pReview.tc",
        		 data : {
        			 starRage:starRage,
        			 revContent:revContent,
        			 personalNo:rPersonalNo,
        			 revTargetMemberId:revTargetMemberId
        		},
        		/*  data : {revContent:revContent, personalNo:rPersonalNo, memberId:revTargetMemberId}, */
        		 type : "post",
        		 success : function(data) { //data를 String으로 받아옴, 단순 결과값만 받아오는 거기때문에 String
                     if(data == "success") { //결과값이 success이면
                    	 getReviewList(); //목록을 가져오도록
                    	 $("#content").val(""); 
                    	}
        		 	}
        		 });
        	 });
         });
    	
    	
    	// 리뷰 리스트 불러오기
    	function getReviewList() {
    		var personalNo = ${personal.personalNo};
    		$.ajax({
    			url : "pReviewList.tc", 
    			data : {personalNo:personalNo},
    			dataType:"json", //응답이 오는 data는(밑에꺼) json형태 이다.
    			success:function(data){	//controller에서 json으로 받아오는 코드 만들어줌
    				$reviewDiv = $("#reviewDiv");
    				$reviewDiv.html("");
    				
    				/* var $table;
    				var $memberId;
    				var $revContent;
    				var $revWriteDate; */
    				
    				if( data.length > 0 ) { 
    					for( var i in data) {
    						/* $table = $("<table style='border: solid 1px #dddddd; border-radius: 10px;'>"); */
    						
    						/* $table = $("<table>");
    						$tr1 = $("<tr>");
    						$tr2 = $("<tr>");
    						$memberId = $("<td style='color:black'>").text(data[i].memberId);
    						$report = $("<button class='btn-sm'>신고</button>");
    						$revWriteDate = $("<td style='text-align:right;'>").text(data[i].revWriteDate);
    						$revContent = $("<td colspan='3'>").text(decodeURI(decodeURIComponent(data[i].revContent)).replace(/\+/g,' '));
    						
    						 $reviewDiv.append($table);
    						 $table.append($tr1);
    						 $tr1.append($memberId);
    						 $tr1.append($revWriteDate).append($report);
    						 //$tr1.append($report);
    						 $table.append($tr2);
    						 $tr2.append($revContent); */
    						 
    						 $table = $("<table>");
     						$tr1 = $("<tr>");
     						$tr2 = $("<tr>");
     						$memberId = $("<td style='color:black'>").text(data[i].memberId);
     						$revWriteDate = $("<td style='text-align:right;'>"+data[i].revWriteDate+"&nbsp;&nbsp;&nbsp;<button class='btn-sm'>신고</button>");
     						$revContent = $("<td colspan='3'>").text(decodeURI(decodeURIComponent(data[i].revContent)).replace(/\+/g,' '));
     						
     						 $reviewDiv.append($table);
     						 $table.append($tr1);
     						 $tr1.append($memberId);
     						 $tr1.append($revWriteDate);
     						 //$tr1.append($report);
     						 $table.append($tr2);
     						 $tr2.append($revContent);
    						 
    						 
    						 console.log("댓글 내용 : " + decodeURIComponent(data[i].revContent));
    						 console.log("댓글 내용 : " + data[i].revContent);
    					}
    				}else{	// 데이터가 없을 때
    					$table = $("<table>");
    					$tr =  $("<tr>");
    					$revContent = $("<td colspan='2'>").text("등록된 댓글이 없습니다.");
    					
    					$reviewDiv.append($table);
    					$table.append($tr);
    					$tr.append($revContent);
    				}
    			}
    		});
		}
    	
    	// 리뷰 글자 수 세기
    	 $(function() {
             $('#content').keyup(function(e) {
                 var pReqContent = $(this).val();
                 $(this).height(((pReqContent.split('\n').length + 1) * 1.5) + 'em');
                 $('#counter').html(pReqContent.length + '&nbsp/ 최대 100자');
             });
             $('#pReqContent').keyup();
         });
    	
    	 
    	 // 별점주기
    	    $('.starRev span').click(function(e) {
    	    	$(this).parent().children('span').removeClass('on');
    	        $(this).addClass('on').prevAll('span').addClass('on');
    	        
    	        var lastStar = $(this).html();
    	        $('#starScore').html(lastStar);
    	    });   
         
    </script>
    
    
</body></html>
