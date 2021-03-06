<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SharePot - 스터디 글 작성</title>
</head>
<style>
#contentSection {
    width: 60% ;
    margin: 0 auto;
}
#title{
font-size:30px !important;
}
a{
text-decoration:none !important;
}
</style>

<body>

   <c:import url="../common/menuBar.jsp" />
    <div id="page-wrapper">
      <!-- Main -->
        <section id="main">
      <div id="contentSection">
   <h1 id="title" align="center">스터디 글쓰기</h1>
   
   <br><br>
   <form action="studyInsert.tc" method="post" enctype="multipart/form-data" onsubmit="return check()">
      <table align="center" border="1" cellspacing="0">
         <tr>
            <td>제목</td>
            <td><input type="text" size="20" id="studyTitle" name="studyTitle"></td>
         </tr>
         <tr>
            <td>작성자</td>
            <td><input type="text" name="memberId"  value="${loginUser.memberId }" readonly></td>
         </tr>
         <tr>
            <td>카테고리</td>
            <td>
            <select id="studyCategory" name="studyCategory">
            <option value="GROUP">그룹</option>
            <option value="PERSONAL">개인</option>
            <option value="PROJECT">프로젝트</option>
            <option value="ETC">기타</option>
         </select>
            </td>
         </tr>
         <tr>
            <td>내용</td>
            <td><textarea id="content" rows="7" cols="50" name="studyContent"></textarea></td>
         </tr>
         <tr>
            <td>첨부파일</td>
            <td id="fileUp">
                   <button type="button" class="btn btn-info btn-sm" id="addFile" onclick="return addFiles();">파일 추가</button>
                </td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input type="submit" id="submit" class="btn btn-primary" value="등록">&nbsp; &nbsp;
               <input type="reset" class="btn btn-primary" value="취소">
            </td>
         </tr>
      </table>
   </form>
   
   <p align="center">
      <c:url var="home" value="home.tc"/>
      <a href="${ home }">시작페이지로 이동</a>&nbsp;&nbsp;
      <c:url var="list" value="studyList.tc"/>
      <a href="${list }">목록으로 이동</a>
   </p>

   <br><br><br><br><br><br><br><br><br><br><br><br>
   </div>
   </section>
      </div>
   <script>
   

   
   console.log(title)
   
   function addFiles() {
      var addfile = "<input type='file' name='uploadFile' class='form-control-file border'>"
      var td = document.getElementById("fileUp");
      
      td.innerHTML += addfile;
   }
   /* $("#submit").click(function(){
   
      if (content=='' || title ==''){
         alert("모든 항목을 입력해 주세요.");
         return false;
      }else if (content!='' && title != ''){
         alert("글이 등록 되었습니다.");
         return true;
      }
   }); */
   
   function check() {
      var content=$("#content").val();
      var title=$("#studyTitle").val();
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
   /* 
   $("#check").click(function(){
   
      var content=$("#content").val();
      var title=$("#studyTitle").val();
      
      console.log(title)
      console.log(content)
   }) */
   

   </script>
</body>
</html>