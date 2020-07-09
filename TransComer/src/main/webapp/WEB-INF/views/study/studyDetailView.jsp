<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
</head>
<body>
   <c:import url="../common/menuBar.jsp" />
   <br style="clear: both">
   <h1 align="center">${study.studyNo }번 글 상세보기</h1>
   <br>
   <br>

   <table align="center" width="450" border="1" cellspacing="0"
      style="clear: right;" id="tb">
      <tr>
         <td width="80">번호</td>
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
      <tr height="300">
         <td>내용</td>
         <td>${study.studyContent }</td>
      </tr>
      <tr>
         <td>첨부파일</td>
         <td>${study.studyFilePath }</td>
      </tr>
      <c:if test="${loginUser.memberId eq study.memberId }">
         <tr>
            <td colspan="2" align="center">
            	<c:url var="studyUpdate" value="studyUploadView.tc">
            	<c:param name="studyNo" value="${study.studyNo }"></c:param> <!-- ?뒤에 보내는 값을 넣어줘야함 -->
            	<!-- 쿼리스트링을 보내주어야 컨트롤러 메소드의 매개변수(파라미터)가 받아서 처리 가능 -->
            	</c:url>
            	<c:url var="studyDelete" value="studyDelete.tc">
            		<c:param name="studyNo" value="${study.studyNo }"></c:param>
            	</c:url>
               <a href="${studyUpdate }">수정페이지로 이동</a> &nbsp;&nbsp;
               <a href="${studyDelete }">삭제하기</a>
            </td>
         </tr>
      </c:if>
      
   </table>


   <p align="center">

      <c:url var="home" value="home.kh" />
      <a href="${home }">시작페이지로 이동</a>
      <c:url var="nlist" value="nlist.kh" />
      <a href="${nlist }">목록 전체보기</a>
      
        <!-- 댓글 등록  -->
   <table align="center" width="500" border="1" cellspacing="0" id="commentTable">
      <tr>
         <td><textarea cols="55" rows="3" id="content"></textarea></td>
         <input type="hidden" id="commentCondition" name="commentCondition" value="study">
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
      </thead>
      <tbody>
	
      </tbody>
   </table>
       <script>
       


    		   $(function(){
       // 초기 페이지 로딩 시 댓글 불러오기
         getCommentList(); //이게 실행되면 밑에 댓글들 나옴 (ajax가 실행됨)
        
         // 댓글 등록 ajax
         $("#submit").on("click", function(){
            
            var content = $("#content").val(); // 댓글의 내용
            var refStudyNo = ${study.studyNo }; // 어느 게시글의 댓글인지 알려줌
            
            $.ajax({
               url : "insertComment.tc",
               data : {commentContent:content, studyNo:refStudyNo},
               			/* 'page': page,
               			'searchKeyword':searcKey, */
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
               var $memberId;
               var $commentContent;
               var $commentWriteDate;
               
               $("#count").text("댓글 (" + data.length+")"); //리스트의 길이를 댓글의 갯수로 확인할 수있다.
               if( data.length > 0 ) {
                  for ( var i in data ) {
                     $tr = $("<tr>");
                     $memberId = $("<td width='100'>").text(data[i].memberId);
                     //내용(복호화)
                     $commentContent = $("<td>").text(decodeURIComponent(data[i].commentContent.replace(/\+/g, " ")));
                     //(위코드)td를 선택해서 댓글 내용 넣고 역슬래시면 공백으로 만들어줌
                     $commentWriteDate = $("<td width='100'>").text(data[i].commentWriteDate);
                     
                     $tr.append($memberId);
                     $tr.append($commentContent);
                     $tr.append($commentWriteDate);
                     $tableBody.append($tr); //(위에 코드 써있는) 파란색 댓글목록의 tablebody부분에 넣어줌
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