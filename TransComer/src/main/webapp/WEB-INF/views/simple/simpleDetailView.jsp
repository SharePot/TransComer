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
<title>SharePot - 단순의뢰 게시글 조회</title>
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
                            <a href="${sReqDelete }">삭제</a> &nbsp;
                        </c:if>
                        <a href="${sList }">목록</a>
                </p>

                <div id="contentWrapper">
                    <p id="content">${sReq.simpleContent }</p>
                    <p id="letterCount">자</p>
                </div>
	                <div id="replySection"> 
	                
	                </div>
					<input type="hidden" id="loginId" value="${loginUser.memberId }">
					<input type="hidden" id="simpleWriter" value="${sReq.simpleWriter }">
					<input type="hidden" id="simpleAStatus" value="${sReq.simpleAStatus }">
                    <table id="replyTb">

                        <tr>
                            <td id="rContentWrapper"><textarea cols="75" rows="4" type="text" id="simpleReplyContent"></textarea></td>
                            <td id="rSubmitWrapper"><button class="btn btn-primary" id="rSubmit">등록</button></td>
                        </tr>

                    </table>


            </div>

        </section>

    </div>

	<script>
	
	$(function(){
  	  // 초기 페이지 로딩 시 댓글 불러오기
  	  getSimpleResList();

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

 		// 답변 조회
		function getSimpleResList() {
			var sReqNo = ${sReq.simpleNo };
			$.ajax({
						url : "sResList.tc",
						data : {simpleNo : sReqNo},
						dataType : "json",
						success : function(data) {
							$divSection = $("#replySection");
							$divSection.html("");
							
							if (data.length > 0) {
								for ( var i in data) {
										$responseWriter = $("<input type='hidden' id='responseWriter' value=" + data[i].simpleReplyWriter + ">");
										$simpleReplyNo = $("<input type='hidden' id='simpleReplyNo' value=" + data[i].simpleReplyNo + ">");
										$loginId = $("#loginId").val();
										$simpleWriter = $("#simpleWriter").val();
										$simpleAStatus = $("#simpleAStatus").val();
										$replyWrapperDiv = $("<div id='replyWrapper'>");
											$rContentSectionDiv = $("<div id='rContentSection'>");
												$table = $("<table id='test2'>");
													$trOne = $("<tr>");
														$tdOne = $("<td colspan='2'>");
															$replyWriter = $("<p id='replyWriter'>").text(data[i].simpleReplyWriter);
															$replyInfo = $("<p id='replyInfo'>").text("님의 답변");
													$trTwo = $("<tr>");
														$adoptTd = $("<td id='adopt'>");
															$adoptCountOne = $("<p class='adoptCount'>").text("책택된 답변수 : ");
															$adoptCountTwo = $("<p class='adoptCount'>").text(data[i].adopCount);
														$etcTd = $("<td id='etc'>");
															$replyDate = $("<p id='replyDate'>").text(data[i].simpleReplyDate);
															$reportBtn = $("<a href='#' id='reportBtn'>").text("신고");
															$updateWindow = $("<a href='#' id='updateWindow' onclick='updateWindow(this, " + data[i].simpleReplyNo +")'>").text("수정");
															$updateBtn = $("<button id='updateBtn' style='display:none;' onclick='updateBtn(this, " + data[i].simpleReplyNo +");'>").text("등록");
															$updateResetBtn = $("<button id='updateResetBtn' style='display:none;' onclick='getSimpleResList()'>").text("취소");
															$deleteBtn = $("<a href='#' id='deleteBtn' onclick='deleteBtn()'>").text("삭제");
															$adoptBtn = $("<a href='#' id='adoptBtn' onclick='adoptBtn(this," + data[i].simpleReplyNo +");'>").text("채택");
													$trThree = $("<tr>");
														$tdTwo = $("<td colspan='2' >");
															$replyContent = $("<p id='replyContent'>").text(decodeURIComponent(data[i].simpleReplyContent.replace(/\+/g, " ")));
														$tdThree = $("<td colspan='2' style='display:none;'><textarea>" + decodeURIComponent(data[i].simpleReplyContent.replace(/\+/g, " ")) + "</textarea>");
															
															
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
					                     } 
										
										if ($simpleAStatus == 'Y') {
					                    	 $adoptBtn.detach();
					                     }
										
										if (data[i].simpleReplyStatus == 'Y') {
											$updateWindow.detach();
											$deleteBtn.detach();
										}
										
										$trTwo.after($trThree);
										$trThree.append($tdTwo);
										$tdTwo.append($replyContent);
										$tdTwo.after($tdThree);
										
										$replyWrapperDiv.after($simpleReplyNo);
										$simpleReplyNo.after($responseWriter);

								}

							} else {
								$tr = $("<tr>");
								$simpleReplyContent = $("<td colspan='3' style='text-align: center;'>")
										.text("등록된 댓글이 없습니다.");

								$tr.append($simpleReplyContent);
								$divSection.append($tr);
							}
							
						}

					});
			
		}
 		
 		// 댓글 삭제
		function deleteBtn() {
			
			var result = window.confirm("답변을 삭제하시겠습니까?");
	  		var simpleReplyNo = $("#simpleReplyNo").val();
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
	  		var simpleReplyWriter = $("#responseWriter").val();
	  		var result = window.confirm("답변을 채택하시겠습니까?")
	  		if (result) {
		  		$.ajax ({
		  			url : "adoptReply.tc",
		  			data : {simpleReplyNo : simpleReplyNo, sReqNo : sReqNo, simpleReplyWriter : simpleReplyWriter},
		  			type : "post",
		  			success : function (data) {
		  				getSimpleResList();
		  				alter("답변을 채택하였습니다.");
		  			}
		  		});
	  		}
	  		
	  	}
		
	</script>
</body>
<link rel="stylesheet" href="assets/css/main.css" />
</html>