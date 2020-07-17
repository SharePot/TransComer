<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
	<head>
    <title>SharePot</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <style>
        #WriterForm {
            margin-left: 15%;
            margin-right: 15%;
        }

        #WriterForm input {
            width: 70%;
            display: inline-block;
            margin-left: 20%;
        }

        #WriterForm label {
            float: left;
            width: 10%;
            margin-top: 10px;
            color: gray;
        }

        #WriterForm select {
            width: 24.5%;
            display: inline-block;
        }

        #introduce {
            width: 70%;
            /*height: 300px;*/
            border: 1px solid gray;
            display: inline-block;
            margin: 0 15%;
        }

        .imgBox {
            width: 30%;
            height: 100%;
            display: inline-block;
            /*margin: 13% 5%;*/
            padding: 10% 0;
        }
        
        #profileImage {
            width: 80%;
            height: auto;
            object-fit: cover;
            border-radius: 70%;
            overflow: hidden;
            position: relative;
            margin: 10% 10%;
        }

        .card-body {
            display: inline-block;
            width: 70%;
            height: auto;
            float: right;
        }
        select {
            display: inline-block;
            width: 30px;
        }
    </style>
</head>

<body class="homepage is-preload">
<c:import url="../common/menuBar.jsp"/>
    <div id="page-wrapper">
    
        <!-- Main -->
        <section id="main">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <center>
                            <h2>' ${loginUser.memberId } ' 님의 번역가 등록 수정</h2>
                        </center>
                        <hr>
                        <div class="card" id="introduce">
                            <div class="imgBox">
                                <img src="" id="profileImage" alt="" />
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">자기소개</h5>
                                <hr>
                                <p class="card-text"> </p>
                            </div>
                        </div>
                        <form action="pWriterUpdate.tc" method="post" id="WriterForm" enctype="multipart/form-data">
                        <input type="hidden" name="personalNo" value="${personal.personalNo }">
                            <div id="profileContent">
                                <br>
                                <label>글제목</label>
                                <input type="text" name="personalTitle" placeholder="제목을 입력해주세요" value="${personal.personalTitle }" maxlength="52">
                                <br><br>
                                <label>글내용</label>
                                <textarea name="personalContent" placeholder="내용을 입력해주세요" style=" width: 70%; display: inline-block; margin-left: 20%;">${personal.personalContent }</textarea>
                                <br><br>
                                <label>대표 사진</label>
                                <br> <input type="file" name="reloadFile" id="profile_pt" onchange="previewImage(this,'View_area')">
								<c:if test="${ !empty personal.personalFilePath }">
									<a href="${contextPath }/resources/pUploadFiles/${personal.personalFilePath}">${personal.personalFilePath}</a>
								</c:if>
                                <!--이미지 미리보기-->
                                <div id='View_area' style=' margin-left: 30%; margin-top: 10px; position:relative; width: 300px; height: 200px; color: black; border: 0px solid black; dispaly: inline;'></div>
                                <p style="font-size: 10pt;  margin-left: 30%;">
                                    (이미지 크기는 300*200px을 권장합니다.)
                                </p>
                                <label>작업 일정</label>
                                <input type="text" name="personalSchedule" style="width:120px" placeholder="최대 소요 기간" value="${personal.personalSchedule} ">&nbsp;일
                                <br><br>
                                <label>개발 언어</label>
                                <c:forTokens var="pLang" items="${personal.personalPLang }" delims="," varStatus="status">
									<c:if test="${status.index == 0 }">
	                                    <select name=pLang1 class="pLang_first" style="margin-left: 20%; width:20%;">
	                                        <option value='없음'>-- 필수 선택--</option>
	                                        <option value='JAVA' <c:if test="${pLang eq 'JAVA'}">selected</c:if>>JAVA </option>
	                                        <option value='Javascript' <c:if test="${pLang eq 'Javascript'}">selected</c:if>>Javascript</option>
	                                        <option value='C' <c:if test="${pLang eq 'C'}">selected</c:if>>C</option>
	                                        <option value='C++' <c:if test="${pLang eq 'C++'}">selected</c:if>>C++</option>
	                                        <option value='C#' <c:if test="${pLang eq 'C#'}">selected</c:if>>C#</option>
	                                        <option value='Python' <c:if test="${pLang eq 'Python'}">selected</c:if>>Python</option>
	                                        <option value='PHP' <c:if test="${pLang eq 'PHP'}">selected</c:if>>PHP</option>
	                                    </select>
									</c:if>
									
									<c:if test="${status.index == 1 }">
	                                    <select name='pLang2' class="pLang_second" style="margin-top:10px; width:20%;">
	                                        <option value='없음' selected>-- 선택 --</option>
	                                        <option value='JAVA' <c:if test="${pLang eq 'JAVA'}">selected</c:if>>JAVA </option>
	                                        <option value='Javascript' <c:if test="${pLang eq 'Javascript'}">selected</c:if>>Javascript</option>
	                                        <option value='C' <c:if test="${pLang eq 'C'}">selected</c:if>>C</option>
	                                        <option value='C++' <c:if test="${pLang eq 'C++'}">selected</c:if>>C++</option>
	                                        <option value='C#' <c:if test="${pLang eq 'C#'}">selected</c:if>>C#</option>
	                                        <option value='Python' <c:if test="${pLang eq 'Python'}">selected</c:if>>Python</option>
	                                        <option value='PHP' <c:if test="${pLang eq 'PHP'}">selected</c:if>>PHP</option>
	                                        <option value='없음' <c:if test="${pLang eq ''}">selected</c:if>>없음</option>
	                                    </select>
									</c:if>
									<c:if test="${status.index == 2 }">
	                                    <select name='pLang3' class="pLang_third" style="margin-top:10px; width:20%;">
	                                        <option value='없음' selected>-- 선택 --</option>
	                                        <option value='JAVA' <c:if test="${pLang eq 'JAVA'}">selected</c:if>>JAVA </option>
	                                        <option value='Javascript' <c:if test="${pLang eq 'Javascript'}">selected</c:if>>Javascript</option>
	                                        <option value='C' <c:if test="${pLang eq 'C'}">selected</c:if>>C</option>
	                                        <option value='C++' <c:if test="${pLang eq 'C++'}">selected</c:if>>C++</option>
	                                        <option value='C#' <c:if test="${pLang eq 'C#'}">selected</c:if>>C#</option>
	                                        <option value='Python' <c:if test="${pLang eq 'Python'}">selected</c:if>>Python</option>
	                                        <option value='PHP' <c:if test="${pLang eq 'PHP'}">selected</c:if>>PHP</option>
	                                        <option value='없음' <c:if test="${pLang eq ''}">selected</c:if>>없음</option>
	                                    </select>
									</c:if>                                	
                                </c:forTokens>


                                <br><br>
                                <label>사용 언어</label>
								<c:forTokens var="tLang" items="${personal.personalTLang }" delims="," varStatus="status">
									<c:if test="${status.index == 0 }">
										<select name='tLang1' class="tLang_first" style="margin-left: 20%; width: 20%;">
											<option value='없음'>-- 필수 선택--</option>
											<option value='영어' <c:if test="${tLang eq '영어'}">selected</c:if>>영어</option>
											<option value='중국어' <c:if test="${tLang eq '중국어'}">selected</c:if>>중국어</option>
											<option value='일본어' <c:if test="${tLang eq '일본어'}">selected</c:if>>일본어</option>
										</select>
									</c:if>
									<c:if test="${status.index == 1 }">
										<select name='tLang2' class="pLang_second" style="margin-top: 10px; width: 20%;">
											<option value='없음'>-- 선택 --</option>
											<option value='영어' <c:if test="${tLang eq '영어'}">selected</c:if>>영어</option>
											<option value='중국어' <c:if test="${tLang eq '중국어'}">selected</c:if>>중국어</option>
											<option value='일본어' <c:if test="${tLang eq '일본어'}">selected</c:if>>일본어</option>
											<option value='없음' <c:if test="${tLang eq ''}">selected</c:if>>없음</option>
										</select>
									</c:if>
									<c:if test="${status.index == 2 }">	
										<select name='tLang3' class="pLang_third" style="margin-top: 10px; width: 20%;">
											<option value='없음'>-- 선택 --</option>
											<option value='영어' <c:if test="${tLang eq '영어'}">selected</c:if>>영어</option>
											<option value='중국어' <c:if test="${tLang eq '중국어'}">selected</c:if>>중국어</option>
											<option value='일본어' <c:if test="${tLang eq '일본어'}">selected</c:if>>일본어</option>
											<option value='없음' <c:if test="${tLang eq ''}">selected</c:if>>없음</option>
										</select>
									</c:if>
								</c:forTokens>
								
                                <br><br>
                                <label>가격</label>
                                <input type="text" id="personalPrice" name="personalPrice" style="width:120px" value="${personal.personalPrice }">&nbsp;P/100자 당
        					</div>
                            <hr>
                            <p style="font-size: 10pt;">- 마이페이지에서 파워번역가를 등록하면 상단에 번역게시물을 띄워드립니다.</p>
	

                            <br><br>
                            <input type="hidden" value=${loginUser.memberId } name="memberId">
                            <center>
                                 <button class="btn btn-primary" type="submit" style="margin:0 20px; width:100px;"> 수정 </button>
                                <button class="btn btn-secondary" type="reset" style="margin:0 20px; width:100px;"> 취소 </button>
                            </center>
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
    <!--템플릿 css-->
     <link rel="stylesheet" href="resources/css/main.css" />
     
     
    <!--프로필 이미지 파일 업로드시 미리보기-->
    <script>
        $( document ).ready(function() {
            $("#View_area").css("display","none");
        });

        $("#profile_pt").click(function(){
            var fileName = $("#profile_pt").val;
            if(fileName!=""){
                $("#View_area").css("display","block");
            }
        });
        
        function previewImage(targetObj, View_area) {
            var preview = document.getElementById(View_area); //div id
            var ua = window.navigator.userAgent;

            //ie일때(IE8 이하에서만 작동)
            if (ua.indexOf("MSIE") > -1) {
                targetObj.select();
                try {
                    var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
                    var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


                    if (ie_preview_error) {
                        preview.removeChild(ie_preview_error); //error가 있으면 delete
                    }

                    var img = document.getElementById(View_area); //이미지가 뿌려질 곳

                    //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
                    img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + src + "', sizingMethod='scale')";
                } catch (e) {
                    if (!document.getElementById("ie_preview_error_" + View_area)) {
                        var info = document.createElement("<p>");
                        info.id = "ie_preview_error_" + View_area;
                        info.innerHTML = e.name;
                        preview.insertBefore(info, null);
                    }
                }
                //ie가 아닐때(크롬, 사파리, FF)
            } else {
                var files = targetObj.files;
                for (var i = 0; i < files.length; i++) {
                    var file = files[i];
                    var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
                    if (!file.type.match(imageType))
                        continue;
                    var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
                    if (prevImg) {
                        preview.removeChild(prevImg);
                    }
                    var img = document.createElement("img");
                    img.id = "prev_" + View_area;
                    img.classList.add("obj");
                    img.file = file;
                    img.style.width = '100%';
                    img.style.height = '100%';
                    preview.appendChild(img);
                    if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                        var reader = new FileReader();
                        reader.onloadend = (function(aImg) {
                            return function(e) {
                                aImg.src = e.target.result;
                            };
                        })(img);
                        reader.readAsDataURL(file);
                    } else { // safari is not supported FileReader
                        //alert('not supported FileReader');
                        if (!document.getElementById("sfr_preview_error_" +
                                View_area)) {
                            var info = document.createElement("p");
                            info.id = "sfr_preview_error_" + View_area;
                            info.innerHTML = "not supported FileReader";
                            preview.insertBefore(info, null);
                        }
                    }
                }
            }
        }
    </script>
     



</body>
</html>