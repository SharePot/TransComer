<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/simpleListView.css" />
</head>
<c:import url="../common/menuBar.jsp" />
<body>
   <div id="page-wrapper">
      <section id="main">
         <div id="boardWrapper">
            <table>
               <h1>나의 단순의뢰 목록</h1><br>
               <tr>
                  <td>번호</td>
                  <td>분류</td>
                  <td>제목</td>
                  <td>채택</td>
                  <td>조회수</td>
               </tr>
               <c:forEach var="sReq" items="${myReq }">
                  <tr>
                     <c:if test="${sReq.simpleDStatus eq 'N' }">
                        <td>${sReq.simpleNo }</td>
                        <td>${sReq.simplePLang }, ${sReq.simpleTLang }</td>
                        <td>
                           <c:url var="sReqDetail" value="sReqDetail.tc">
                              <c:param name="simpleNo" value="${sReq.simpleNo }" />
                           </c:url>
                           <a href="${sReqDetail}">${sReq.simpleTitle }</a>
                        </td>
                        <c:if test="${sReq.simpleAStatus eq 'Y' }">
                           <td>O</td>
                        </c:if>
                        <c:if test="${sReq.simpleAStatus eq 'N' }">
                           <td>X</td>
                        </c:if>
                        <td>${sReq.simpleCount }</td>
                     </c:if>
                  </tr>
               </c:forEach>
               <tr align="center">
                  <td colspan="5">
                  
                     <!-- [이전] -->
                     <c:if test="${spi.spCurrentPage <= 1 }">[이전] &nbsp;</c:if>
                     <c:if test="${spi.spCurrentPage > 1 }">
                        <c:url var="before" value="mySimpleList.tc">
                           <c:param name="spPage" value="${spi.spCurrentPage - 1 }" />
                        </c:url>
                        <a href="${before}">[이전]</a>&nbsp;
                     </c:if>
                     
                     <!-- 페이지 -->
                     <c:forEach var="p" begin="${spi.spCurrentPage }" end="${spi.spEndPage }">
                        <c:if test="${p eq spCurrentPage }">
                           <font color="red"><b>[${p }]</b></font>
                        </c:if>
                        <c:if test="${p ne spCurrentPage }">
                           <c:url var="pagination" value="mySimpleList.tc">
                              <c:param name="spPage" value="${p }" />
                           </c:url>
                           <a href="${pagination }">${p }</a>&nbsp;
                        </c:if>
                     </c:forEach>
                     
                     <!-- [다음] -->
                     <c:if test="${spi.spCurrentPage <= spi.spMaxPage }">[다음] &nbsp;</c:if>
                     <c:if test="${spi.spCurrentPage > spi.spMaxPage }">
                        <c:url var="after" value="mySimpleList.tc">
                           <c:param name="spPage" value="${spi.spCurrentPage + 1 }" />
                        </c:url>
                        <a href="${after}">[다음]</a>&nbsp;
                     </c:if>
                     
                  </td>
               </tr>
            </table>
            
            <%-- <div style="height: 50px;" id="searchBox">
                  <form action="mySReqSearch.tc" name="searchForm" method="get" align="center">
                     <select id="searchCondition" name="searchCondition" class="selectpicker">
                        <option value="all" <c:if test="${simpleSearch.searchCondition == 'all' }">selected</c:if>>전체</option>
                        <option value="writer" <c:if test="${simpleSearch.searchCondition == 'writer' }">selected</c:if>>작성자</option>
                        <option value="title" <c:if test="${simpleSearch.searchCondition == 'title' }">selected</c:if>>제목</option>
                        <option value="content" <c:if test="${simpleSearch.searchCondition == 'content' }">selected</c:if>>내용</option>
                     </select>
                     <input class="form-control" type="search" name="searchValue" value="" id="searchValue">
                     <input type="hidden" name="simpleWriter">
                     <button id="searchBtn" type="submit">검색</button><br>
                  </form>
               </div> --%>
         </div>
      </section>
   </div>
</body>
</html>