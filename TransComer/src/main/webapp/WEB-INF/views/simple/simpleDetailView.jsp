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
                        <c:if test="${ loginUser.memberId eq sReq.simpleWriter }">
                            <a href="${sReqUpdate }">수정</a> &nbsp;
                            <a href="${sReqDelete }">삭제</a> &nbsp;
                        </c:if>
                        <a href="${sList }">목록</a>
                </p>

                <div id="contentWrapper">
                    <p id="content">${sReq.simpleContent }</p>
                    <p id="letterCount">자</p>
                </div>
                	<c:if test="${loginUser.memberId eq sReq.simpleWriter }">
	                <div id="replySection"> 
	                </div>
                	</c:if>

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
  	  		data : {simpleReplyContent:simpleReplyContent, sReqNo:sReqNo},
  	  		type : "post",
  	  		success : function(data) {
  	  			if(data == "success") {
  	  				getSimpleResList();
  	  				$("#simpleReplyContent").val("");
  	  			}
  	  		}
  	  	});
  	  });
  	
  	$("#rUpdate").on("click", function() {
  		
  		
  		
  		
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

							var str = "";
							
							if (data.length > 0) {
								for ( var i in data) {

									str += "<div id='replyWrapper'><div id='rContentSection'><table id='test2'>"
										+ "<tr><td colspan='2'><p id='replyWriter'>"+ data[i].simpleReplyWriter +"</p><p id='replyInfo'>님의 답변</p></td></tr>"
										+ "<tr><td id='adopt'><p class='adoptCount'>채택된 답변수 : </p><p class='adoptCount'>?</p></td>"
										+ "<td id='etc'><p id='replyDate'>" + data[i].simpleReplyDate + "</p>"
										+ "<c:if test='${loginUser.memberId eq sReq.simpleWriter}'>"
										+ "<a href='#' id='reportBtn'> | 신고</a></c:if >"
										+ "<c:if test='${loginUser.memberId eq sRes.simpleReplyWriter}'>"
										+ "<a href='#' id='reportBtn'> | 수정 | 삭제 </a></c:if>"
										+ "</td></tr>"
										+ "<tr><td colspan='2'><p id='replyContent'>" + decodeURIComponent(data[i].simpleReplyContent.replace(/\+/g, " ")) + "</p></td></tr>"
										+ "</table></div></div>"
										
									$divSection.html(str);
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

		// 답변 수정
		function rUpdate(obj) {
			$(obj).parents("tr").prev().show();
			$(obj).parents("tr").hide();
		}

		// 답변 삭제

		// 답변 채택
		
	</script>
</body>
<link rel="stylesheet" href="assets/css/main.css" />
</html>