<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html lang="ko">
   <head>
      <title>Qna 등록</title>
        
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

         <!-- Main -->
            <section id="main">
               <div class="container">
                  <div class="row">
                     <div class="col-12">
                         <!--메인 내용 구역 1-->
                         <h1 align="center">QnA 등록</h1>
                         <br> 
                            <hr>
                            <br>
                         <form action="qnaInsert.tc" method="post" enctype="multipart/form-data" onsubmit="return check()">
                             <table class="table table-hover">
                                 <tbody>
                                     <tr height="50px">
                                         <th>제목</th>
                                         <td>
                                             <input class="form-control" type="text" name="qnaTitle" id="subject" placeholder="제목을 작성하세요" />
                                         </td>
                                     </tr>
                                     <tr>
                                         <th>게시글 분류</th>
                                         <td>
                                             <select id="qnaCategorySelect" class="form-control" style="width:120px;">
                                                 <option value="ALL" selected>전체공개</option>
                                                 <option value="ADMIN">관리자공개</option>
                                                 <c:if test="${loginUser.memberId eq 'admin' }">
                                                    <option value="NOTICE">공지</option>
                                                 </c:if>
                                             </select>
                                             <input type="hidden" name="qnaCategory" id="qnaCategory"/>
                                         </td>
                                     </tr>
                                     <tr id="contentTr">
                                         <th>내용</th>
                                         <td>
                                             <div id="content">
                                                 <textarea id="qnaContent" class="form-control" placeholder="내용을 작성하세요" name="qnaContent" style="height:450px;"></textarea>
                                             </div>
                                         </td>
                                     </tr>
                                     <tr>
                                         <th>파일 업로드</th>
                                         <td id="fileUp">
                                            <button type="button" class="btn btn-info btn-sm" id="addFile" onclick="return addFiles();">파일 추가</button>
                                         </td>
                                             
                                     </tr>
                                     <tr align="center">
                                         <td colspan="2">
                                            <input type="hidden" name="memberId" value="${loginUser.memberId }"/>
                                             <button type="submit" class="btn btn-secondary" id="submitBtn">완료</button>
                                             &nbsp;&nbsp;
                                             <button type="reset" class="btn btn-secondary">취소</button>
                                         </td>
                                     </tr>
                                 </tbody>
                             </table>
                         </form>
                     </div>
                  </div>
               </div>
            </section>
            
            <script>
               $("#submitBtn").click(function() {
                  var qCategory = $("#qnaCategorySelect option:selected").val();
                  $("#qnaCategory").val(qCategory);
               });
               
               function addFiles() {
                  var addfile = "<input type='file' name='uploadFile' class='form-control-file border'>"
                  var td = document.getElementById("fileUp");
                  
                  td.innerHTML += addfile;
               }
               
               function check() {
                  var content=$("#qnaContent").val();
                  var title=$("#subject").val();
                  console.log(title);
                  console.log(content);
                  
                  if (content==""){
                     alert("모든 항목을 입력해 주세요.");
                     return false;
                  }else if(title == ""){
                     alert("모든 항목을 입력해 주세요.");
                     return false;
                     }else{
                        alert("글이 정상적으로 등록됐습니다.");
                        return true;
                  }
               }
            </script>

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