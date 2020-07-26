<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">

<head>
<title>SharePot</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/main.css" />

</head>

<body class="homepage is-preload">
<c:import url="../common/menuBar.jsp" />   
	<div id="page-wrapper">
<!-- 
		Header
		<section id="header">

			Logo
			<h1>
				<a href="index.html">SharePot</a>
			</h1>

			Nav
			<nav id="nav">
				<ul>
					<li class="current"><a href="#">Home</a></li>
					<li><a href="#">번역 의뢰</a>
						<ul>
							<li><a href="#">단순 의뢰</a></li>
							<li><a href="#">1:1 의뢰</a></li>
						</ul></li>
					<li><a href="#">번역 공유</a></li>
					<li><a href="#">스터디</a></li>
					<li><a href="#">Q&amp;A</a></li>
				</ul>
			</nav>
		</section> -->

		<!-- Main -->
		<section id="main">
			<div class="row">
				<div class="col-12">
					<!--메인 내용 구역 1-->
					<!--페이지 제목, 아이콘-->
					<div class="d-flex justify-content-center">
						<!--아이콘 -->
						<svg width="2.2em" height="2.2em" viewBox="0 0 16 16"
							class="bi bi-folder-check" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
								d="M9.828 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91H9v1H2.826a2 2 0 0 1-1.991-1.819l-.637-7a1.99 1.99 0 0 1 .342-1.31L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3h3.982a2 2 0 0 1 1.992 2.181L15.546 8H14.54l.265-2.91A1 1 0 0 0 13.81 4H9.828zm-2.95-1.707L7.587 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672a1 1 0 0 1 .707.293z" />
                                <path fill-rule="evenodd"
								d="M15.854 10.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708l1.146 1.147 2.646-2.647a.5.5 0 0 1 .708 0z" />
                            </svg>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<!--페이지 내용 제목-->
						<span class="h3">번역자료 공유 글</span>
					</div>
					<hr>
				</div>
				<div class="container">
					<div class="col-12">
						<!--메인 내용 구역 2(지워도 됨, 자유롭게 추가)-->
						<div class="card">
							<div class="card-body">
								<span class="float-right"><span id="Plang">${share.pLanguage}</span>
								</span>
								<p style="font-size: 25px; font-weight: 900;" class="">
									<span id="userTitle">${share.shareTitle }</span>
								</p>
								<hr>
								<span class="float-right">작성일 : <span id="rRegDate">${share.sWriteDate }</span></span>
								<p class="">
									작성자 : <span id="userId">${share.memberId }</span>
								</p>
								<c:forEach var="file" items="${flist }" varStatus="i">
									<c:if test="${i.index eq 1 }">
										<span><a href="filedown.tc?shareNo=${share.shareNo }"><p style="text-align: right;">${file.fileName }</p></a></span>
									</c:if>
								</c:forEach>
								<!--미리보기 이미지-->
								<!-- <p class="h4 font-weight-bold text-center">미리 보기 이미지</p>
                                <div class="text-center" style="border: 1px solid gainsboro; padding: 25px; margin: 0 10%;"> -->
								<p class="h4 font-weight-bold text-center">미리 보기 이미지</p>
								<div class="text-center"
									style="border: 1px solid gainsboro; margin: 0 10%;">
									<!-- 이미지 반복 출력 -->
									<c:forEach var="file" items="${flist }" varStatus="i">
										<c:if test="${i.index eq 0 }">
											<img
												src="resources/${file.memberId }/uploadFiles/${file.fileName }"
												style="width: 100%;" class="rounded">
											<%-- <img src="${file.filePath}" style="width: 100%; height:100%;"  class="rounded"> --%>
										</c:if>
									</c:forEach>
								</div>
								<br>
								<!--번역 내용 글-->
								<p class="h4 font-weight-bold text-center">번역 자료 내용</p>
								<textarea
									style="resize: none; padding: 25px; margin: 0 10%; width: 80%; height: 300px; border-color: gainsboro;">${share.shareContent}</textarea>
								<div class="d-flex justify-content-center">
									<button class="btn-warning">삭제요청</button>
								</div>
								<br> <br>
							</div>
							<!--승인, 반려 버튼 영역-->
							<div class="d-flex justify-content-center">
								<hr>
				
							</div>
		<!-- 댓글 등록  -->
		 <input type="hidden" id="loginId" value="${loginUser.memberId }">
		 <input type="hidden" id="writerId" value="${share.memberId }">
   <table align="center" width="50%" border="1" cellspacing="0" id="commentTable">
      <tr>
      <td>
      	<!--  공개여부 : <input type="radio" name="commentYN" class="commentYN" value="Y" checked="checked">공개
          <input type="radio" class="commentYN" name="commentYN" value="N">비공개 -->
          <label>공개여부&nbsp; : &nbsp;&nbsp;</label>
          <select id="commentYN" name="commentYN">
            <option value="Y" >공개</option>
            <option value="N" >비공개</option>
          </select>
          </td>
         <td><textarea cols="70" rows="3" id="content"></textarea>
        <input type="hidden" id="commentCondition" name="commentCondition" value="share"></td>
         
         <td>
            <button id="submit">등록하기</button>
         </td>
      </tr>
   </table>
   
   

   <!-- 댓글 목록  -->
   <table id="shareTable" align="center" width="500" border="1" cellspacing="0" heigh="1000">
      <thead>
         <tr>
            <td colspan="2"><b id="count"></b></td>
            <input type="hidden" id="commentCondition" name="commentCondition" value="share">
         </tr>
         <tr>
         <th>댓글 번호</th>
         <th>작성자</th>
         <th width="40%">내용</th>
         <th>작성 날짜</th>
         <th>수정</th>
         <th>삭제</th>
         </tr>
      </thead>
      <tbody>
	
      </tbody>
      <tfoot>
	  </tfoot>
   </table>
						</div>
						<br>
					</div>
				</div>
			</div>
		</section>

		<!-- Footer -->
		<section id="footer">
			<div class="container">
				<div class="row">
					<div class="col-8 col-12-medium"></div>
					<div class="col-4 col-12-medium"></div>
					<div class="col-12"></div>
				</div>
			</div>
		</section>
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>

  <script>
       


    		   $(function(){
       // 초기 페이지 로딩 시 댓글 불러오기
         getCommentList(); //이게 실행되면 밑에 댓글들 나옴 (ajax가 실행됨)
         var cPage;
     /*     setInterval(function() {
        	 getCommentList();
          }, 10000); //10초 마다 불러옴 */
          
         // 댓글 등록 ajax
         $("#submit").on("click", function(){
            
            var content = $("#content").val(); // 댓글의 내용
            var refShareNo = ${share.shareNo }; // 어느 게시글의 댓글인지 알려줌
            var commentYN=$("#commentYN").val();
            var commentCondition = $("#commentCondition").val();
            $.ajax({
               url : "insertComment.tc",
               data : {commentContent:content, shareNo:refShareNo,commentYN:commentYN,commentCondition:commentCondition},
               			
               type : "post",
               success : function(data) { //data를 String으로 받아옴, 단순 결과값만 받아오는 거기때문에 String
                  if(data == "success") { //결과값이 success이면
                	  getCommentList(); //목록을 가져오도록
                     $("#content").val("");
                    
                  }
               }
     

   	    });

       });
         
  
    		   });
    		   //댓글 삭제
    	       function deleteComment(obj,commentNo){
    	    		var result = window.confirm("정말로 댓글을 삭제 하시겠습니까?");
    	        	 console.log(commentNo);
    	        	 if(result){
    	        	 $.ajax({
    	                 url:"deleteComment.tc",
    	                 type:"post",
    	                 data:{commentNo:commentNo},
    	                 //  dataType:"json", //응답이 오는 data는(밑에꺼) json형태 이다.
    	                 success : function(data) { 
    	                	 if(data == "success") { 
    	                		 getCommentList(); 
    	        	 		console.log("삭제 완료");
    	                	 }
    	         		}
    	 			})}else{
    	 				console.log("취소");
    	 			};
    	 	  };
    	 	  
    	 	
    	 	
    	 	  //댓글 수정창 
     	 	  function modifyComment(obj,commentNo){
     	 		 console.log(obj);
     	 		 $(obj).parents("tr").children().eq(3).show();
     	 		 $(obj).parents("tr").children().eq(5).show();
     	 		 $(obj).parents("tr").children().eq(8).show();
     	 		  $(obj).parents("tr").children().eq(2).hide();
     	 		  $(obj).hide();
     	 		 $(obj).parents("tr").children().eq(7).hide();
     	 	  }
    	 	  
    	 	  
   		   //댓글 수정 입력
   	       function modifyConformComment(obj,commentNo){
   	    	var result = window.confirm("정말로 댓글을 수정 하시겠습니까?");
   	        	 console.log(commentNo);
   	        	 var commentContent=decodeURIComponent($(obj).parents("tr").children().eq(3).children("textarea").val());
   	        	 console.log(commentContent);
   	        	 $.ajax({
   	                 url:"updateComment.tc",
   	                 type:"post",
   	                 data:{commentNo:commentNo,
	   	                	commentContent:commentContent},
   	                 //  dataType:"json", //응답이 오는 data는(밑에꺼) json형태 이다.
   	                 success : function(data) { 
   	                	 if(data == "success") { 
   	                		 getCommentList(); 
   	        	 		console.log("수정 완료");
   	        	 	 alert("댓글이 수정되었습니다.");
   	                	 }
   	         		}
   	 			});
   	 	  };
   	 	  	  
    	 	  
   	 	  
      // 댓글 리스트 불러오는 ajax 함수
      function getCommentList(cPage){
         var studyNo = 0;
         var shareNo=${share.shareNo};
         var qnaNo=0;
         var commentCondition="share";
         $.ajax({
            url:"commentList.tc",
            data:{studyNo:studyNo,
            	shareNo:shareNo,
            	qnaNo:qnaNo,
            	commentCondition:commentCondition},
            dataType:"json", //응답이 오는 data는(밑에꺼) json형태 이다.
            success:function(data){ //controller에서 json으로 받아오는 코드 만들어줌
               $tableBody = $("#shareTable tbody");
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
           	  
               
               $("#count").text("댓글 (" + data.length+")"); //리스트의 길이를 댓글의 갯수로 확인할 수있다.
               if( data.length > 0 ) {
            	   maxPage = parseInt((data.length / 5) + 0.8);
             	  startPage = ((parseInt((currentPage / pageLimit) + 0.8)) - 1) * pageLimit + 1;
    				  endPage = startPage + pageLimit - 1;
             	  
                   for (var i = (currentPage*5)-5; i < currentPage*5; i++) {
                 	  
                      if (data.length == i) {
                 		 break;
                 	 }
             /*      for ( var i in data ) { */
                     $tr = $("<tr class='trClass'>");
                     var commentNoRead=data[i].commentNo;
                     var commentContentRead=decodeURIComponent(data[i].commentContent);
                     $commentNo= $("<td width='100' id='commentNo'>").text(data[i].commentNo);
                     $memberId = $("<td width='100'>").text(data[i].memberId);
                     //내용(복호화)
                     $commentContent = $("<td>").text(decodeURIComponent(data[i].commentContent.replace(/\+/g, " ")));
                     $commentNewContent=$("<td style='display:none;'><textarea>"+commentContentRead+"</textarea>");
                     //(위코드)td를 선택해서 댓글 내용 넣고 역슬래시면 공백으로 만들어줌
                     $commentWriteDate = $("<td width='200'>").text(data[i].commentWriteDate);
                     $loginId=$("#loginId").val();
                     $writerId=$("writerId").val();
                 	 $modifyButton=$("<td>").html("<button class='button' id='modifyComment' onclick='modifyComment(this,"+commentNoRead+");'>수정</button>")
                 	 $modifyConformButton=$("<td style='display:none;'>").html("<button class='button' id='modifyConformComment' onclick='modifyConformComment(this,"+commentNoRead+");'>수정완료</button>")
                 	 $deleteButton=$("<td>").html("<button class='button' id='deleteComment' onclick='deleteComment(this,"+commentNoRead+");'>삭제</button>");
                 	 $cancelButton=$("<td style='display:none;'>").html("<button class='button' id='cancelComment' onclick='getCommentList()'>취소</button>");
                 	
                 	 
                 	 if($loginId==data[i].memberId || $loginId== $writerId){
                 	 $tr.append($commentNo);
                     $tr.append($memberId);
                     $tr.append($commentContent);
                     $tr.append($commentNewContent);
                     $tr.append($commentWriteDate);
                    
                     if(data[i].memberId == $loginId){ 
                    	 $tr.append($modifyConformButton);
                    	 $tr.append($modifyButton);
                    	 $tr.append($deleteButton);
                    	 $tr.append($cancelButton);
                    		
                     console.log($loginId);
                     console.log(commentNoRead);
                     console.log($deleteButton);
                    } 
                    
                     
                     $tableBody.append($tr); //(위에 코드 써있는) 파란색 댓글목록의 tablebody부분에 넣어줌
                  }
                  }
                  $tableFoot = $("#shareTable tfoot");
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
                  
               }else{ //데이터가 없을때
                  $tr = $("<tr>");
                  $rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
                  
                  $tr.append($commentContent);
                  $tableBody.append($tr);
               }

            }
         });
      }
            
    
      
      
   </script>


</html>