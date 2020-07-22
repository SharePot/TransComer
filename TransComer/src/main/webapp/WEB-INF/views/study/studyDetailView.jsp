<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SharePot - 스터디 게시글 조회</title>
</head>
<body>
	<div class="page-wrapper">
	<section id="main">
 <c:import url="../common/menuBar.jsp" />   
  <%--  <jsp:include page="../common/menuBar.jsp"></jsp:include> --%>
   <br style="clear: both">
   <h1 align="center">${study.studyNo }번 글 상세보기</h1>
   <input type="hidden" id="loginId" value="${loginUser.memberId }">
   <input type="hidden" id="writerId" value="${study.memberId }">
   <br>
   <br>

   <table align="center" width="450" border="1" cellspacing="0" style="clear: right;" id="tb">
     <c:if test="${loginUser.memberId eq study.memberId }">
         <tr>
            <td colspan="2" align="right">
            	<c:url var="studyUpdate" value="studyUploadView.tc">
            	<c:param name="studyNo" value="${study.studyNo }"></c:param> <!-- ?뒤에 보내는 값을 넣어줘야함 -->
            	<!-- 쿼리스트링을 보내주어야 컨트롤러 메소드의 매개변수(파라미터)가 받아서 처리 가능 -->
            	</c:url>
            	<c:url var="studyDelete" value="studyDelete.tc">
            		<c:param name="studyNo" value="${study.studyNo }"></c:param>
            		<c:param name="memberId" value="${loginUser.memberId }"></c:param>
            	</c:url>
               <a href="${studyUpdate }">수정하기</a> &nbsp;&nbsp;
               <a href="${studyDelete }">삭제하기</a>
            </td>
         </tr>
      </c:if>
      <tr>
         <td width="10%">번호</td>
         <td>${study.studyNo }</td>
      </tr>
      <tr>
         <td>제목</td>
         <td>${study.studyTitle }</td>
      </tr>
      <tr>
         <td>작성자</td>
         <td>${study.memberId }</td>
      </tr>
      <tr>
         <td>작성일</td>
         <td>${study.studyWriteDate }</td>
      </tr>
      <tr>
         <td>카테고리</td>
         <td>
         <c:set var="category" value="${study.studyCategory}" />
         <c:if test="${category eq 'PROJECT'}">
       		  프로젝트
         </c:if>
         <c:if test="${category eq 'GROUP'}">
       		  그룹
         </c:if>
         <c:if test="${category eq 'PERSONAL'}">
       		  개인
         </c:if>
         <c:if test="${category eq 'ETC'}">
       		  개인
         </c:if>
         </td>
      </tr>
      <tr height="300">
         <td>내용</td>
         <td>${study.studyContent }</td>
      </tr>
   </table>
    <br><br>
   
      
         <hr>
        <!-- 댓글 등록  -->
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
        <input type="hidden" id="commentCondition" name="commentCondition" value="study"></td>
         
         <td>
            <button id="submit">등록하기</button>
         </td>
      </tr>
   </table>
   
   

   <!-- 댓글 목록  -->
   <table id="studyTable" align="center" width="500" border="1" cellspacing="0" heigh="1000">
      <thead>
         <tr>
            <td colspan="2"><b id="count"></b></td>
            <input type="hidden" id="commentCondition" name="commentCondition" value="study">
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
   </table>
   <br><br><br>
    <hr>
   <p align="center">

      <c:url var="home" value="home.tc" />
      <a href="${home }">시작페이지로 이동</a>
      <c:url var="studylist" value="studyList.tc" />
      <a href="${studylist }">목록 전체보기</a>
  
   
   </section>
   </div>
       <script>
       


    		   $(function(){
       // 초기 페이지 로딩 시 댓글 불러오기
         getCommentList(); //이게 실행되면 밑에 댓글들 나옴 (ajax가 실행됨)
        
     /*     setInterval(function() {
        	 getCommentList();
          }, 10000); //10초 마다 불러옴 */
          
         // 댓글 등록 ajax
         $("#submit").on("click", function(){
            
            var content = $("#content").val(); // 댓글의 내용
            var refStudyNo = ${study.studyNo }; // 어느 게시글의 댓글인지 알려줌
            var commentYN=$("#commentYN").val();
            $.ajax({
               url : "insertComment.tc",
               data : {commentContent:content, studyNo:refStudyNo,commentYN:commentYN},
               			
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
      function getCommentList(){
         var studyNo = ${study.studyNo};
         var shareNo=0;
         var qnaNo=0;
         var commentCondition="study";
         $.ajax({
            url:"commentList.tc",
            data:{studyNo:studyNo,
            	shareNo:shareNo,
            	qnaNo:qnaNo,
            	commentCondition:commentCondition},
            dataType:"json", //응답이 오는 data는(밑에꺼) json형태 이다.
            success:function(data){ //controller에서 json으로 받아오는 코드 만들어줌
               $tableBody = $("#studyTable tbody");
               $tableBody.html("");
               
               var $tr;
               var $commentNo;
               var $memberId;
               var $commentContent;
               var $commentWriteDate;
               var $deleteButton;
               var $modifyButton;
          
               
               $("#count").text("댓글 (" + data.length+")"); //리스트의 길이를 댓글의 갯수로 확인할 수있다.
               if( data.length > 0 ) {
                  for ( var i in data ) {
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

   </p>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>

</body>
</html>