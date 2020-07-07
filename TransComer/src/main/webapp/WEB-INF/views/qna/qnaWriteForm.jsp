<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
		<title>SharePot</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/css/main.css" type="text/css"/>
		<link rel="stylesheet"
         href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
      		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" 
      		crossorigin="anonymous">
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
            
		<style type="text/css">
			#contentTr{
				height:200px;
			}
			
			#subject{
				width:100%;
			}
			
			#content{
				height: 450px;
				width:100%;
			}
			
			textArea{
				height:100%;
				width:100%;
			}
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
							    <!--메인 내용 구역 1-->
							    <h1 align="center">QnA 등록</h1>
							    <br><br>
							    <form action="qnaInsert.tc" method="post" enctype="multipart/form-data">
							        <table class="table" align="center">
							            <tbody>
							                <tr>
							                    <th>제목</th>
							                    <td>
							                        <input type="text" id="subject" placeholder="제목을 작성하세요" name="qnaTitle">
							                    </td>
							                </tr>

							                <tr>
							                    <th>게시글 분류</th>
							                    <td>
							                        <select name="qnaCategory" style="width:300px;">
							                            <option value="ALL">전체공개</option>
							                            <option value="ADMIN">관리자공개</option>
							                            <c:if test="${loginUser.memberId eq 'admin' }">
							                            	<option value="NOTICE">공지</option>
							                            </c:if>
							                        </select>
							                    </td>
							                </tr>
							                
							                <tr id="contentTr">
							                    <th>내용</th>
							                    <td>
							                        <div id="content">
							                            <textarea placeholder="내용을 작성하세요" name="qnaContent"></textarea>
							                        </div>
							                    </td>
							                </tr>
							                
							                <tr>
							                    <th>파일 업로드</th>
							                    <td>
							                        <input type="file" name="uploadFile">
							                    </td>
							                </tr>

							                <tr align="center">
							                    <td colspan="2">
							                        <button type="submit" class="btn btn-outline-secondary">완료</button>
							                        &nbsp;&nbsp;
							                        <button type="reset" class="btn btn-outline-secondary">취소</button>
							                    </td>
							                </tr>
							            </tbody>
							        </table>
							    </form>
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