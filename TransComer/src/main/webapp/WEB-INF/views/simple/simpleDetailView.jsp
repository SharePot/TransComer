<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/simpleDetailView.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<title>SharePot - 단순의뢰 게시판</title>
</head>
<body class="homepage is-preload">
    <c:import url="../common/menuBar.jsp" />
    <div id="page-wrapper">

        <!-- Main -->
        <section id="main">

            <div id="contentSection">

                <p id="titleInfo">&#91; ${sReq.simplePLang } &#47; ${sReq.simpleTLang } &#93; ${sReq.simpleTitle }</p>
                <p id="contentInfo">${sReq.simpleWriter } ${sReq.simpleDate } ${sReq.simpleCount }</p>
                <p id="modyInfo">
                        <c:url var="sList" value="sReqListView.tc">
                            <c:param name="spPage" value="${spCurrentPage }" />
                        </c:url>
                        <c:url var="sReqUpdate" value="sReqUpdateView.tc">
                            <c:param name="simpleNo" value="${sReq.simpleNo }" />
                        </c:url>
                        <c:url var="sReqDelete" value="sReqDelete.tc">
                            <c:param name="simpleNo" value="${sReq.simpleNo }" />
                        </c:url>
                        <c:if test="${ loginUser.memberId eq sReq.simpleWriter && sReq.simpleAStatus eq 'N'}">
                            <a href="${sReqUpdate }">수정</a> &nbsp;
                            <a href="${sReqDelete }" id="deleteSReq">삭제</a> &nbsp;
                        </c:if>
                        <a href="${sList }">목록</a>
                </p>

                <div id="contentWrapper">
                    <p id="content">${sReq.simpleContent }</p>
                </div>
	                <div id="replySection"> 
	                
	                </div>
	                <div id="replyPage"></div>
					<input type="hidden" id="loginId" value="${loginUser.memberId }">
					<input type="hidden" id="simpleWriter" value="${sReq.simpleWriter }">
					<input type="hidden" id="simpleAStatus" value="${sReq.simpleAStatus }">
					<input type="hidden" id="simpleTitle" value="${sReq.simpleTitle }">
					<input type="hidden" id="simpleTitle" value="${sReq.simpleTitle }">
					<input type="hidden" id="adoptCount">
					<c:if test="${!empty sessionScope.loginUser }">
	                    <table id="replyTb">
			            	<tr>
			                	<td id="rContentWrapper">
			                    	<textarea rows="4" id="simpleReplyContent"></textarea>
			                        <button class="btn btn-primary" id="rSubmit">등록</button>
			                    </td>
			               	</tr>
	                    </table>
					</c:if>


            </div>

        </section>

    </div>

	<script>
	
	$("#deleteSReq").click(function() {
		
		var result = window.confirm("게시글을 삭제하시겠습니까?")
		if (result) {
			alert("삭제가 완료되었습니다.")
			return true;
		} else {
			return false;
		}
		
	});
	
	$(function(){
  	  // 초기 페이지 로딩 시 댓글 불러오기
  	  getSimpleResList();
  	  var cPage;
  	// 댓글 등록 ajax
  	  $("#rSubmit").on("click", function() {
  	  	
  	  	var simpleReplyContent = $("#simpleReplyContent").val(); // 댓글의 내용
  	  	var sReqNo = ${sReq.simpleNo }; // 어느 게시글의 댓글인지 알려줌
  	  	
  	  	$.ajax({
  	  		url : "insertRes.tc",
  	  		data : {simpleReplyContent:simpleReplyContent,
  	  				sReqNo:sReqNo},
  	  		type : "post",
  	  		success : function(data) {
  	  			if(data == "success") {
  	  				getSimpleResList();
  	  				$("#simpleReplyContent").val("");
  	  			}
  	  		}
  	  	});
  	  });

    });
	
	// 채택된 답변수 가져오기
	function getAdoptCount(memberId) {
		var memId = memberId;
		var count = "";
		
		$.ajax({
			url : "sCount.tc",
			async: false,
			data:{memberId : memId},
			success : function(data) {
				count = data;
			}
		})
		return count;
		
	}

 		// 답변 조회
		function getSimpleResList(cPage) {
			var sReqNo = ${sReq.simpleNo };
			
			$.ajax({
						url : "sResList.tc",
						data : {simpleNo : sReqNo},
						dataType : "json",
						success : function(data) {

							$divSection = $("#replySection");
							$divSection.html("");
							
							var currentPage;
		                    var startPage;
		                    var endPage;
		                    var maxPage;
		                      
		                    var pageLimit = 5;
		                      
		                    if ( cPage == null ) {
		                    	cPage = 1;
		                    } 
		                    
		                    currentPage = cPage;
							
		                    // $("#count").text("댓글 (" + data.length + ")");
							if (data.length > 0) {
								
								 maxPage = parseInt((data.length / 5) + 0.8);
		                    	 startPage = ((parseInt((currentPage / pageLimit) + 0.8)) - 1) * pageLimit + 1;
			       				 endPage = startPage + pageLimit - 1;
		                    	  
			       				  
			       				  console.log(cPage);
			       				  console.log(maxPage);
			       				  console.log(startPage);
			       				  console.log(endPage);
			       				  console.log(data.length);
			       				  
		                          for (var i = (currentPage * 5) - 5; i < currentPage * 5; i++) {
		                        	  
		                             if (data.length == i) {
		                        		 break;
		                        	 }
									
										$responseWriter = $("<input type='hidden' id='responseWriter' value=" + data[i].simpleReplyWriter + ">");
										$simpleReplyNo = $("<input type='hidden' id='simpleReplyNo' value=" + data[i].simpleReplyNo + ">");
										$loginId = $("#loginId").val();
										$adoptCount = $("#adoptCount").val();
										$simpleWriter = $("#simpleWriter").val();
										$simpleAStatus = $("#simpleAStatus").val();
										$replyWrapperDiv = $("<div id='replyWrapper'>");
											$rContentSectionDiv = $("<div id='rContentSection'>");
												$table = $("<table id='test2'>");
													$trOne = $("<tr>");
														$tdOne = $("<td colspan='2'>");
															$replyWriter = $("<p id='replyWriter'>").text(data[i].simpleReplyWriter);
															$replyInfo = $("<p id='replyInfo'>").text("님의 답변");
															$replyInfoA = $("<p id='replyInfo'>").text("님의 답변이 채택되었습니다.");
													$trTwo = $("<tr>");
														$adoptTd = $("<td id='adopt'>");
															$adoptCountOne = $("<p class='adoptCount'>").text("책택된 답변수 : ");
															$adoptCountTwo = $("<p class='adoptCount'>").text(getAdoptCount(data[i].simpleReplyWriter));
														$etcTd = $("<td id='etc'>");
															$replyDate = $("<p id='replyDate'>").text(data[i].simpleReplyDate);
															$reportBtn = $("<a href='#' id='reportBtn' onclick='reportBtn(this)'>").text(" 신고");
															$updateWindow = $("<a href='#' id='updateWindow' onclick='updateWindow(this, " + data[i].simpleReplyNo +")'>").text(" 수정");
															$updateBtn = $("<a id='updateBtn' style='display:none;' onclick='updateBtn(this, " + data[i].simpleReplyNo +");'>").text("등록");
															$updateResetBtn = $("<a id='updateResetBtn' style='display:none;' onclick='getSimpleResList()'>").text("취소");
															$deleteBtn = $("<a href='#' id='deleteBtn' onclick='deleteBtn(this, " + data[i].simpleReplyNo +")'>").text(" 삭제");
															$adoptBtn = $("<a href='#' id='adoptBtn' onclick='adoptBtn(this," + data[i].simpleReplyNo +");'>").text(" 채택하기");
													$trThree = $("<tr>");
														$tdTwo = $("<td colspan='2' >");
															$replyContent = $("<p id='replyContent'>").text(decodeURIComponent(data[i].simpleReplyContent.replace(/\+/g, " ")));
														$tdThree = $("<td colspan='2' style='display:none;'><textarea id='updateText' style='width: 100%;'>" + decodeURIComponent(data[i].simpleReplyContent.replace(/\+/g, " ")) + "</textarea>");
															
															
										$divSection.append($replyWrapperDiv);
										$replyWrapperDiv.append($rContentSectionDiv);
										$rContentSectionDiv.append($table);
										$table.append($trOne);
										$trOne.append($tdOne);
										$tdOne.append($replyWriter);
										$replyWriter.after($replyInfo);
										
										$trOne.after($trTwo);
										$trTwo.append($adoptTd);
										$adoptTd.append($adoptCountOne);
										$adoptCountOne.after($adoptCountTwo);
										$adoptTd.after($etcTd);
										$etcTd.append($replyDate);
	
										if(data[i].simpleReplyWriter == $loginId){ 
					                    	$replyDate.after($updateWindow);
					                    	$updateWindow.after($deleteBtn);
					                    	$replyDate.after($updateBtn);
					                    	$updateBtn.after($updateResetBtn);
					                     } else if ($simpleWriter == $loginId) {
					                    	$replyDate.after($reportBtn);
					                    	$reportBtn.after($adoptBtn);
					                    	$adoptBtn.after($responseWriter);
					                     } 
										
										if ($simpleAStatus == 'Y') {
					                    	 $adoptBtn.detach();
					                     }
										
										if (data[i].simpleReplyStatus == 'Y') {
											$updateWindow.detach();
											$deleteBtn.detach();
											$replyInfo.detach();
											$replyWriter.after($replyInfoA);
										}
										
											$trTwo.after($trThree);
											$trThree.append($tdTwo);
											$tdTwo.append($replyContent);
											$tdTwo.after($tdThree);
											
											$replyWrapperDiv.after($simpleReplyNo);
											
											
											var t = $("#replyWriter");
											var target = data[i].simpleReplyWriter;
											// console.log(target);
											console.log(t);
											
										} // for 문 
										
										/* 댓글 페이징 부분 */
										$replyPage = $("#replyPage");
										$replyPage.html("");
										$rTable = $("<table>");
										
										$replyTr = $("<tr align='center'>")
										$replyTd = $("<td>");
										var before="< &nbsp;";
				                        var after="&nbsp; >";
				                        
				                        if (currentPage <= 1) { // 현재페이지가 1과 같거나 작다면
				                        	$replyTd.append(before);
				                        } else if (currentPage > 1) { // 현재페이지가 1보다 크다면
				                        	$before = $("<a href='javascript:getSimpleResList(" + (currentPage - 1) + ")'><&nbsp;</a> &nbsp;");
				                        	$replyTd.append($before);
				                        }
				                        
				                        // i를 시작페이지부터 최대페이지보다 작거나 같을때까지 증감
				                        for (var i = startPage; i <= maxPage; i++) {
				                        	if (i == currentPage) { // 현재페이지가 i와 같을 때
				                        		$link = $("<font color = 'red' size = '4'><b>[" + i + "]</b></font> &nbsp;");
				                        		$replyTd.append($link);
				                        	} else if (i != currentPage) { // 같지 않다면
				                        		$link = $("<a href='javascript:getSimpleResList(" + i + ")'>" + i + "</a> &nbsp;");
				                        		$replyTd.append($link);
				                        	}
				                        }
				                        
				                        // 현재페이지가 최대페이지보다 크거나 같다면
				                        if (currentPage >= maxPage) {
				                        	$replyTd.append(after);
				                        } else if (currentPage < maxPage) { // 작다면
				                        	$after = $("<a href='javascript:getSimpleResList(" + (currentPage + 1) + ")'>&nbsp;></a>");
				                        	$replyTd.append($after);
				                        } 
				                        
				                        $replyPage.append($rTable);
										$rTable.append($replyTr);
										$replyTr.append($replyTd);
										

							} else {
								$tr = $("<tr>");
								$simpleReplyContent = $("<td colspan='3' style='text-align: center;'>")
										.text("등록된 댓글이 없습니다.");

								$tr.append($simpleReplyContent);
								$divSection.append($tr);
							}
							
						}

					}); // ajax 시작
			
		} // function 시작
 		
 		// 댓글 삭제
		function deleteBtn(obj, simpleReplyNo) {
			
			var result = window.confirm("답변을 삭제하시겠습니까?");
	  		if (result) {
	  				
			  	$.ajax({
					url : "deleteRes.tc",
					data : {simpleReplyNo : simpleReplyNo},
					type : "post",
					success : function(data) {
							
							getSimpleResList();
							alert("삭제가 완료되었습니다.")
					}
				});
			  		
	  		}
	  		
	  	};
	  	
	  	// 댓글 수정 창
	  	function updateWindow(obj, simpleReplyNo) {
           	$(obj).parents("table").children().eq(2).children().eq(0).hide();
	  		$(obj).parents("table").children().eq(2).children().eq(1).show();
           	$(obj).prevAll().show();
           	$(obj).hide();
           	$(obj).next().hide();
	  		
	  	}
	  	
	  	// 댓글 수정
	  	function updateBtn(obj, simpleReplyNo) {
	  		
	  		var simpleReplyReContent = $(obj).parents("table").find("textarea").val();
	  		
	  		$.ajax({
	  			url : "updateRes.tc",
	  			data : {simpleReplyNo : simpleReplyNo,
	  					simpleReplyContent : simpleReplyReContent},
	  			type : "post",
	  			success : function (data) {
	  				getSimpleResList();
	  				alert("수정이 완료되었습니다.")
	  			}
	  		
	  		});
	  	}
	  	
	  	// 답변 채택
	  	function adoptBtn(obj, simpleReplyNo) {
	  		
	  		var sReqNo = ${sReq.simpleNo };
	  		var simpleTitle = $("#simpleTitle").val();
	  		var simpleReplyWriter = $("#responseWriter").val();
	  		var result = window.confirm("답변을 채택하시겠습니까?")
	  		if (result) {
		  		$.ajax ({
		  			url : "adoptReply.tc",
		  			data : {simpleReplyNo : simpleReplyNo, sReqNo : sReqNo, simpleReplyWriter : simpleReplyWriter, simpleTitle:simpleTitle},
		  			type : "post",
		  			success : function (data) {
		  				alert("답변을 채택하였습니다.");
		  				getSimpleResList();
		  				$("#adoptBtn").hide();
		  			}
		  		});
		  		
		  		
	  		}
	  		
	  		location.reload(true);
	  		
	  	}
	  	
	  	function reportBtn(obj) {
	  		var test = $(obj).parents("table").children().eq(0).children().eq(0).children().eq(0).text();
	  		console.log(test);
	  		var name ="SharePot - 신고하기";
	  		var option = "width = 600, height = 415, top = 100, left = 200, location = no, toolbars = no";
	  		window.open("reportForm.tc?target=" + test, name, option);
	  	}
	  	
	</script>
	
</body>
<link rel="stylesheet" href="assets/css/main.css" />
</html>