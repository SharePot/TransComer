<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SharePot - 프로필 보기</title>
<link rel="stylesheet" href="resources/css/profileDetail.css" />
</head>
<c:import url="../common/menuBar.jsp" />
<body>
   <div id="page-wrapper">

      <!-- Main -->
      <section id="main">
      <h1 id="mainTitle" align="center">${profile.memberId }&nbsp;의 프로필</h1>
         <br><br><br>
         <div id="contentSection" class="row">
            <div class="col-lg-4 col-md-5 col-sm-12" id="imgSection">
               <div id="imgBox" style="margin-right:15px;">
                  <img src="/resources/uploadFiles/${profile.profileFilePath }">
               </div>
            
            </div>
            <div class="col-lg-8 col-md-7 col-sm-12" id="introduceSection">
               <p>${profile.memberId }</p>
               <br><br>
               <pre>${profile.introduce }</pre>
            </div>
            <div class="col-12"><hr></div>
            <div class="col-lg-4 col-md-5 col-sm-12" id="profileSection" >
               <c:if test="${loginUser.memberId eq profile.memberId }">
                  <p>프로필&#160;&#160;&#160;|</p>
                  <c:if test="${profile.profileStatus eq 'private' || profile.profileStatus eq 'PRIVATE' }">
                     <p>&#160;&#160;비공개&#160;&#160;</p>
                  </c:if>
                  <c:if test="${profile.profileStatus eq 'OPNE' || profile.profileStatus eq 'open' }">
                     <p>&#160;&#160;공개&#160;&#160;</p>
                  </c:if>
                  <c:url var="update" value="profileUpdateView.tc">
                     <c:param name="memberNo" value="${loginUser.memberNo }" />
                  </c:url>
                  <a href="${update }">수정하기</a>
                  <c:url var="delete" value="profileDelete.tc">
                     <c:param name="memberNo" value="${loginUser.memberNo }" />
                  </c:url>
                  <a href="${delete }" onclick="deleteProfile();">삭제하기</a>
               </c:if>
            </div>
            <div class="col-lg-8 col-md-7 col-sm-12" id="langSection">
               <table id="langTb">
                  <tr>
                     <th>개발언어</th>
                     <th>난이도</th>
                     <th>번역언어</th>
                     <th>난이도</th>
                  </tr>
                  <tr>
                     <td>${profile.pLang1 }</td>
                     <td>${profile.pLangGrade1 }</td>
                     <td>${profile.tLang1 }</td>
                     <td>${profile.tLangGrade1 }</td>
                  </tr>
                  <tr>
                     <td>${profile.pLang2 }</td>
                     <td>${profile.pLangGrade2 }</td>
                     <td>${profile.tLang2 }</td>
                     <td>${profile.tLangGrade2 }</td>
                  </tr>
                  <tr>
                     <td>${profile.pLang3 }</td>
                     <td>${profile.pLangGrade3 }</td>
                     <td>${profile.tLang3 }</td>
                     <td>${profile.tLangGrade3 }</td>
                  </tr>
               </table>
            </div>
         </div>
         <br>
         <br>
         <br>   
      </section>
      
      <!-- Footer -->
        <c:import url="../common/footer.jsp"/>
   </div>
   
   <script>
   
      function deleteProfile() {
         
         var result = window.confirm("프로필을 삭제하시겠습니까?");
         if (result) {
            return true;
         } else {
            return false;
         }
         
      }
   </script>

</body>
</html>