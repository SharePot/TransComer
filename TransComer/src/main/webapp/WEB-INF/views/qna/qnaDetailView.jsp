<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<title>Qna 상세보기</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script type="text/javascript" 
			src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" href="/resources/css/main.css" type="text/css"/>
		<link rel="stylesheet"
         href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
      		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
      		crossorigin="anonymous">
      	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
        
            
		<style type="text/css">
			/* #contentTr{
				height:450px;
			}
			
			#subject{
				width:100%;
			}
			
			#content{
				height:450px;
				width:100%;
			}
			
			textArea{
				height:100%;
				width:100%;
			}
			tr {
				width:150px;
			} */
		</style>
	</head>
	<c:import url="../common/menuBar.jsp" />
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<%-- <section id="header">

				    <!-- Logo -->
				    <h1><a href="index.html">SharePot</a></h1>

				    <!-- Nav -->
				    <nav id="nav">
						<ul>
							<li class="current"><a href="#">Home</a></li>
							<li><c:url var="sList" value="sReqListView.tc" /> <c:url
									var="pList" value="plist.tc" /> <c:url var="study"
									value="studyList.tc" /> <a href="#">번역 의뢰</a>
								<ul>
									<li><a href="${sList }">단순의뢰</a></li>
									<li><a href="${pList }">1:1 의뢰</a></li>
								</ul></li>
							<li><a href="#">번역 공유</a></li>
							<li><a href="${study }">스터디</a></li>
							<li><a href="qlist.tc">Q&amp;A</a></li>
						</ul>
					</nav>
				</section> --%>

				<!-- Main -->
				<section id="main">
				    <div class="container d-flex justify-content-center" style="width:800px;">
				        <div class="row" style="width:700px;">
				            <div class="col-12" style="padding:30px 0px 0px 0px;">
				                <!--메인 내용 구역 1-->
				                <div class="row">
				                    <div class="col-md-9">
				                        <h1 class="text-dark" style="margin-top:10px;">${qna.qnaTitle }</h1>
				                    </div>

				                    <div class="col-md-3" align="right">
				                        <h6 class="text-muted" style="margin-right:40px; margin-top:10px;">No.${qna.qnaNo }</h6>
				                        <h6 class="text-muted" style="margin-right:20px;">${qna.qnaWriteDate }</h6>
				                    </div>
				                </div>

				                <hr style="width:700px; margin:5px 0px 5px 0px;">
				                <div class="row">
				                    <div class="col-md-9">
				                        <h4 class="text-dark" style="margin-left:10px;">${qna.memberId }</h4>
				                    </div>
				                    <div class="col-md-3" style="margin-top:5px;">
				                        <i class="fas fa-comment" style="font-size:25px; margin-left:30px;"></i>
				                        ${qna.commentCount }
				                        <i class="fas fa-eye" style="font-size:25px;"></i>
				                        ${qna.qnaCount }

				                    </div>
				                </div>

				                <br>
				                <div class="card">
				                    <img class="card-img-top" src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile7.uf.tistory.com%2Fimage%2F24283C3858F778CA2EFABE" alt="Card image">
				                    <div class="card-body">
				                        <h5>${qna.qnaContent }</h5>
				                    </div>
				                </div>
				                <br>
				                <div align="right">
				                	<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='qlist.tc'">목록</button>&nbsp;
				                	<c:if test="${qna.memberId eq loginUser.memberId }">
				                		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='qupview.tc?qnaNo=${qna.qnaNo }'">수정</button>&nbsp;
				                		<button type="button" class="btn btn-warning btn-sm" onclick="return question();">삭제</button>
				                	</c:if>
				                </div>
				                <hr style="width:700px;">
				            </div>
				            <br>
				        </div>
				        
				        <Script>
				        	/* 게시글 삭제 ajax */
				            function question() {
				                var result = window.confirm("정말로 삭제 하시겠습니까?");
				                if (result) {
				                	var qnaNo = ${qna.qnaNo }
				                	var memberId = "${loginUser.memberId}"
				                	$.ajax ({
				                		url : "qdelete.tc",
				    					type : "GET",
				    					datatype : 'json',
				    					data : {
				    						"qnaNo" : qnaNo,
				    						"memberId" : memberId
				    					},
				    					success : function(data) {
				    						location.href = "qlist.tc";
				    					}
				                	});
				                } else {
				                    return false;
				                }
				            }
				        </Script>
				    </div>
				    
				    <!-- 댓글 부분 -->
				    <input type="hidden" id="loginId" value="${loginUser.memberId }">
				    <input type="hidden" id="writerId" value="${qna.memberId }">
				    <!-- <div class="container d-flex justify-content-center">
				        <table align="center" border="1" cellspacing="0" id="commentTable" style="width:800px;">
				            <tr>
				                <td style="width:150px; padding:0;" >
				                     공개여부 : <input type="radio" name="commentYN" class="commentYN" value="Y" checked="checked">공개
                                        <input type="radio" class="commentYN" name="commentYN" value="N">비공개
				                    <label>공개여부&nbsp; : &nbsp;&nbsp;</label>
				                    <select id="commentYN" name="commentYN">
				                        <option value="Y">공개</option>
				                        <option value="N">비공개</option>
				                    </select>
				                </td>
				                <td style="width:520px;">
				                	<input type="text" id="content" class="form-control" placeholder="댓글 내용을 입력해 주세요">
				                    <input type="hidden" id="commentCondition" name="commentCondition" value="qna">
				                    </td>
				                <td style="width:130px;">
				                    <button type="button" class="btn btn-primary" id="submitQnaComment">등록하기</button>
				                </td>
				            </tr>
				        </table>
					</div> -->
					
					<div class="container">
				        <table align="center" border="1" cellspacing="0" id="commentTable" style="margin:10px;">
				            <tr>
				                <td>
				                    <label>공개여부&nbsp; : &nbsp;&nbsp;</label>
				                    <select id="commentYN" name="commentYN">
				                        <option value="Y">공개</option>
				                        <option value="N">비공개</option>
				                    </select>
				                </td>
				                <td>
				                	<input type="text" id="content" class="form-control" placeholder="댓글 내용을 입력해 주세요">
				                    <input type="hidden" id="commentCondition" name="commentCondition" value="qna">
				                    </td>
				                <td>
				                    <button type="button" class="btn btn-primary" id="submitQnaComment">등록하기</button>
				                </td>
				            </tr>
				        </table>
					</div>
					
					<div class="container">
				        <table id="qnaTable" align="center" width="500" border="1" cellspacing="0" heigh="1000">
				            <thead>
				                <tr>
				                    <td colspan="2"><b id="count"></b></td>
				                    <input type="hidden" id="commentCondition" name="commentCondition" value="qna">
				                </tr>
				                <tr>
				                    <th width="10%">댓글번호</th>
				                    <th>작성자</th>
				                    <th width="40%">내용</th>
				                    <th width="15%">작성 날짜</th>
				                    <th width="8%">수정</th>
				                    <th width="8%">삭제</th>
				                </tr>
				            </thead>
				            <tbody>

				            </tbody>
				            <tfoot>
				            </tfoot>
				        </table>
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
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/jquery.dropotron.min.js"></script>
		<script src="/resources/js/browser.min.js"></script>
		<script src="/resources/js/breakpoints.min.js"></script>
		<script src="/resources/js/util.js"></script>
		<script src="/resources/js/main.js"></script>
		
		<script>
		    $(function() {
		        // 초기 페이지 로딩 시 댓글 불러오기
		        var cPage;
		        getCommentList(cPage); //이게 실행되면 밑에 댓글들 나옴 (ajax가 실행됨)

		        /*     setInterval(function() {
		           	 getCommentList();
		             }, 10000); //10초 마다 불러옴 */

		        // 댓글 등록 ajax
		        $("#submitQnaComment").on("click", function() {

		            var content = $("#content").val(); // 댓글의 내용
		            var refQnaNo = ${qna.qnaNo }; // 어느 게시글의 댓글인지 알려줌
		            var commentYN = $("#commentYN").val();
		            var commentCondition = $("#commentCondition").val();
		            
		            console.log(refQnaNo);
		            $.ajax({
		                url: "insertComment.tc",
		                data: {
		                    commentContent: content,
		                    qnaNo: refQnaNo,
		                    commentYN: commentYN,
		                    commentCondition: commentCondition
		                },
		                type: "post",
		                success: function(data) { //data를 String으로 받아옴, 단순 결과값만 받아오는 거기때문에 String
		                    if (data == "success") { //결과값이 success이면
		                        getCommentList(); //목록을 가져오도록
		                        $("#content").val("");
		                    }
		                }
		            });
		        });
		    });
		    
		    //댓글 삭제
		    function deleteComment(obj, commentNo) {
		        var result = window.confirm("정말로 댓글을 삭제 하시겠습니까?");
		        console.log(commentNo);
		        if (result) {
		            $.ajax({
		                url: "deleteComment.tc",
		                type: "post",
		                data: {
		                    commentNo: commentNo
		                },
		                //  dataType:"json", //응답이 오는 data는(밑에꺼) json형태 이다.
		                success: function(data) {
		                    if (data == "success") {
		                        getCommentList();
		                        console.log("삭제 완료");
		                    }
		                }
		            })
		        } else {
		            console.log("취소");
		        };
		    };

		    //댓글 수정창 
		    function modifyComment(obj, commentNo) {
		        console.log(obj);
		        $(obj).parents("tr").children().eq(3).show();
		        $(obj).parents("tr").children().eq(5).show();
		        $(obj).parents("tr").children().eq(8).show();
		        $(obj).parents("tr").children().eq(2).hide();
		        $(obj).parent().hide();
		        $(obj).parents("tr").children().eq(7).hide();
		    }

		    //댓글 수정 입력
		    function modifyConformComment(obj, commentNo) {
		        var result = window.confirm("정말로 댓글을 수정 하시겠습니까?");
		        if(result) {
		        	var commentContent = decodeURIComponent($(obj).parents("tr").children().eq(3).children("input").val());
			        $.ajax({
			            url: "updateComment.tc",
			            type: "post",
			            data: {
			                commentNo: commentNo,
			                commentContent: commentContent
			            },
			            //  dataType:"json", //응답이 오는 data는(밑에꺼) json형태 이다.
			            success: function(data) {
			                if (data == "success") {
			                    getCommentList();
			                    console.log("수정 완료");
			                    alert("댓글이 수정되었습니다.");
			                } 
			            }
			        });
		        } else {
		        	getCommentList();
		        	alert("취소되었습니다.")
		        }
		       
		    };

		    // 댓글 리스트 불러오는 ajax 함수
		    function getCommentList(cPage) {
		        var qnaNo = ${qna.qnaNo };
			    var shareNo = 0;
		        var studyNo = 0;
		        var commentCondition = "qna";
		        $.ajax({
	                  url: "commentList.tc",
	                  data: {
	                      studyNo: studyNo,
	                      shareNo: shareNo,
	                      qnaNo: qnaNo,
	                      commentCondition: commentCondition
	                  },
	                  dataType: "json", //응답이 오는 data는(밑에꺼) json형태 이다.
	                  success: function(data) { //controller에서 json으로 받아오는 코드 만들어줌
	                      $tableBody = $("#qnaTable tbody");
	                      $tableBody.html("");

	                      var $tr;
	                      var $commentNo;
	                      var $memberId;
	                      var $commentContent;
	                      var $commentWriteDate;
	                      var $deleteButton;
	                      var $modifyButton;
	                      
	                      var currentPage;
	                      var startPage;
	                      var endPage;
	                      var maxPage;
	                      
	                      var pageLimit=5;
	                      
	                      if ( cPage == null ) {
	                    	  cPage = 1;
	                      } 
	                   	
	                  	  currentPage = cPage;
	                  	  
	                      $("#count").text("댓글 (" + data.length + ")"); //리스트의 길이를 댓글의 갯수로 확인할 수있다.
	                      if (data.length > 0) {
	                    	  maxPage = parseInt((data.length / 5) + 0.8);
	                    	  startPage = ((parseInt((currentPage / pageLimit) + 0.8)) - 1) * pageLimit + 1;
		       				  endPage = startPage + pageLimit - 1;
	                    	  
	                          for (var i = (currentPage*5)-5; i < currentPage*5; i++) {
	                        	  
	                             if (data.length == i) {
	                        		 break;
	                        	 }
	                        	  
	                              $tr = $("<tr class='trClass'>");
	                              var commentNoRead = data[i].commentNo;
	                              var commentContentRead = decodeURIComponent(data[i].commentContent);
	                              $commentNo = $("<td width='100' id='commentNo'>").text(data[i].commentNo);
	                              $memberId = $("<td width='100'>").text(data[i].memberId);
	                              //내용(복호화)
	                              $commentContent = $("<td>").text(decodeURIComponent(data[i].commentContent.replace(/\+/g, " ")));
	                              $commentNewInput = $("<input type='text' class='form-control'>");
	                              $commentNewInput.val(commentContentRead);
	                              $commentNewContent = $("<td style='display:none;'>").append($commentNewInput);
	                              //(위코드)td를 선택해서 댓글 내용 넣고 역슬래시면 공백으로 만들어줌
	                              $commentWriteDate = $("<td width='200'>").text(data[i].commentWriteDate);
	                              $loginId = $("#loginId").val();
	                              $writerId = $("writerId").val();
	                              $modifyButton = $("<td>").html("<button class='btn btn-info' id='modifyComment' onclick='modifyComment(this," + commentNoRead + ");'>수정</button>")
	                              $modifyConformButton = $("<td style='display:none;'>").html("<button class='btn btn-warning' id='modifyConformComment' onclick='modifyConformComment(this," + commentNoRead + ");'>완료</button>")
	                              $deleteButton = $("<td>").html("<button class='btn btn-danger' id='deleteComment' onclick='deleteComment(this," + commentNoRead + ");'>삭제</button>");
	                              $cancelButton = $("<td style='display:none;'>").html("<button class='btn btn-danger' id='cancelComment' onclick='getCommentList()'>취소</button>");


	                              if ($loginId == data[i].memberId || $loginId == $writerId) {
	                                  $tr.append($commentNo);
	                                  $tr.append($memberId);
	                                  $tr.append($commentContent);
	                                  $tr.append($commentNewContent);
	                                  $tr.append($commentWriteDate);

	                                  if (data[i].memberId == $loginId) {
	                                      $tr.append($modifyConformButton);
	                                      $tr.append($modifyButton);
	                                      $tr.append($deleteButton);
	                                      $tr.append($cancelButton);
	                                  }
	                                  $tableBody.append($tr); //(위에 코드 써있는) 파란색 댓글목록의 tablebody부분에 넣어줌
	                              }
	                          }
							
	                          $tableFoot = $("#qnaTable tfoot");
	                          $tableFoot.html("");
	                          $tr2 = $("<tr align='center' height='20'>");
	                          $td2 = $("<td colspan='6'>");
	                          var before="< &nbsp;";
	                          var after=">";
	                          
	                          if(currentPage <= 1) {
	                        	 $td2.append(before);
	                          } else if (currentPage > 1) {
	                        	  $before = $("<a href='javascript:getCommentList(" + (currentPage-1) + ")'><</a> &nbsp;");
	                        	  $td2.append($before);
	                          }
	                           
	                          
		                        for (var i = startPage; i <= maxPage; i++) {
		                        	if (i == currentPage) {
		                        		$link = $("<font color='red' size='4'><b>[" + i + "]</b></font> &nbsp;");
		                        		$td2.append($link);
		                        	} else if ( i != currentPage ) {
		                        		$link = $("<a href='javascript:getCommentList(" + i + ")'>" + i + "</a> &nbsp;")
		                        		$td2.append($link);
		                        	}
		                        }
	                          
	                              
		                        if (currentPage >= maxPage) {
		                        	$td2.append(after);
		                        } else if (currentPage < maxPage) {
		                        	$after = $("<a href='javascript:getCommentList(" + (currentPage+1) + ")'>></a>");
		                        	$td2.append($after);
		                        }
								
								$tr2.append($td2);
								
								$tableFoot.append($tr2);
	                            
	                          } else { //데이터가 없을때
	                          $tr = $("<tr>");
	                          $rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");

	                          $tr.append($commentContent);
	                          $tableBody.append($tr);
	                      }
	                  }
	              });
		    }
		</script>

	</body>
</html>