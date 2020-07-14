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
							    <!--메인 내용 구역 1-->s
							     <div class="container" align="center">
							        
							         <h1 class="text-primary">${qna.qnaTitle }</h1>
							         
							    
							         <hr style="width:550px;">
							         <p style="font-size:12px;">No.${qna.qnaNo }
							             | 작성자 : ${qna.memberId }
							             | 작성일 : ${qna.qnaWriteDate }
							         </p>

							         <h3>${qna.qnaContent }</h3>

							         <br>
					                 <c:if test="${qna.memberId eq sessionScope.member.memberId }">
					                     <a href="qupview.tc?qnaNo=${qna.qnaNo }">수정</a>
					                     <a href="qdelete.tc?qnaNo=${qna.qnaNo }" onclick="return question();">삭제</a>
					                 </c:if>
					                 <a href="qlist.tc">목록</a>
					                 <br>
					                
					                 <button type="button" class="btn btn-outline-secondary" onclick="javascript:history.back();">뒤로가기</button>
						         
							         
							         <hr style="width:550px;">
							     </div>

							     <h4 align="center">comment ${fn:length(content.comments) }</h4>

							     <div class="container d-flex justify-content-center">
							         <form class="form-inline d-flex justify-content-center" action="/writeComment" method="post">
							             <input type="hidden" name="qnaNo" value="${qna.qnaNo }" />
							             <input type="text" class="form-control" name="comment" placeholder="댓글입력" size="50">
							             &nbsp;
							             <button class="btn btn-outline-secondary" type="submit">작성</button>
							         </form>
							     </div>

							     <br>

							     <%-- <div class="container" style="width : 700px;">
							         <table class=" table table-borderless">
							             <thead>
							                 <tr>
							                     <th style="width:50%">댓글</th>
							                     <th>아이디</th>
							                     <th>날짜</th>
							                     <th></th>
							                 </tr>
							             </thead>

							             <tbody>
							                 <c:forEach items="${content.comments }" var="comment">
							                     <tr>
							                         <td>${comment.commentContent }</td>
							                         <td>${comment.memberId }</td>
							                         <td>${comment.commentRegDate }</td>
							                         <td><a href="#Redirect" onclick="showModifyComment(this,'${comment.commentContent }','${comment.memberId }','${comment.commentRegDate }');">수정</a>
							                             &nbsp;<a href="/deleteComment?commentNo=${comment.commentNo}&productNo=${content.productNo}" onclick="">삭제</a>
							                         </td>
							                     </tr>


							                     <tr class="commentUpdate" style="display: none;">
							                         <td><input type="text" class="form-control-sm commentContentUpdate" style="width:400px" id="modifyMent" value="${comment.commentContent }" /></td>
							                         <!-- id="modifyMent(this,)" this 내가 클릭한 태그 의미 -->
							                         <td><a href="javascript:void(0)" onclick="modifyComment(this,'${comment.commentNo}');">수정완료</a> <!-- a href="javascript:void(0)"는 하이퍼링크가 다른데로 이동하는 기능 하는데 그걸 없애주는 코드 -->
							                             <a href="javascript:void(0)" onclick='modifyCancel(this)'>취소</a></td>
							                     </tr>
							                 </c:forEach>
							             </tbody>
							         </table>
							     </div> --%>

							     <%-- <form action="/updateComment" id="modifyForm" method="post">
							         <input type="hidden" id="upcomment" name="upcomment">
							         <input type="hidden" id="upproductNo" name="upproductNo" value="${content.productNo }">
							         <input type="hidden" id="upCommentNo" name="upCommentNo">
							     </form> --%>
							     </div>

							     <Script>
							         function question() {
							             var result = window.confirm("정말로 삭제 하시겠습니까?");
							             if (result) {
							                 return true;
							             } else {
							                 return false;
							             }
							         }

							         function showModifyComment(obj, commentContent, memberId, commentRegDate) {
							             console.log(obj);
							             $(obj).parents("tr").next().show();
							             $(obj).parents("tr").hide();
							         }

							         function modifyCancel(obj) {
							             $(obj).parents("tr").prev().show();
							             $(obj).parents("tr").hide();
							         }

							         function modifyComment(obj, commentNo) {
							             var comment = $(".commentContentUpdate").val();
							             $("#upCommentNo").val(commentNo);
							             $("#upcomment").val(comment);
							             $("#upproductNo").val($("#upproductNo").val());
							             $("#modifyForm").submit();
							         }
							         $('#report').click(function() {
							             $('#reportForm').show();
							         });
							         $('#reportCancel').click(function() {
							             $('#reportForm').hide();
							         })
							         $("#reportCheck").click(function() {
							             if (confirm("신고하시겠습니까?") == true) {
							                 top.window.opener = top;
							                 document.form.submit();
							                 window.close();
							             } else {
							                 return false;
							             }
							         });
							     </Script>
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
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/jquery.dropotron.min.js"></script>
		<script src="/resources/js/browser.min.js"></script>
		<script src="/resources/js/breakpoints.min.js"></script>
		<script src="/resources/js/util.js"></script>
		<script src="/resources/js/main.js"></script>

	</body>
</html>