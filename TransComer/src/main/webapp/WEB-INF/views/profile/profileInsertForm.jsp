<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SharePot - 프로필 등록</title>
<link rel="stylesheet" href="resources/css/profileInsertForm.css" />
</head>
<body>
    <c:import url="../common/menuBar.jsp" />
<div id="page-wrapper">

        <!-- Main -->
        <section id="main">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2 align="center">프로필 등록</h2>
                        <hr>
                        <form action="profileInsert.tc" method="post" id="profileForm" enctype="multipart/form-data">
                            <div id="profileContent">
                                <br>
                                <label>이름</label>
                                <input type="text" id="personalWriter" name="personalWriter" placeholder="이름" readonly value="${loginUser.memberName }">
                                <input type="hidden" id="memberNo" name="memberNo" value="${loginUser.memberNo }">
                                <br><br>
                                <label>이메일</label>
                                <input type="text" id="personalPLang" name="personalPLang" placeholder="이메일" readonly value="${loginUser.email }">
                                <br><br>
                                <label>전화번호</label>
                                <input type="text" id="personalTLang" name="personalTLang" placeholder="전화번호" readonly value="${loginUser.phone }">
                                <br><br>
                                <label>프로필 사진</label>
                                <input type="file" name="profileFilePath" id="profile_pt" onchange="previewImage(this,'View_area')">
                                <!--이미지 미리보기-->
                                <div id='View_area' style=' margin-left: 50%; position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'></div>
                                <br><br>

                                <label>사용 가능 개발 언어</label>
                                <div id="num1">
                                    <select name="pLang1" id="pLang1" style="margin-left: 20%;">
                                        <option value="자바">JAVA</option>
                                        <option value="자바스크립트">Javascript</option>
                                        <option value="C언어">C</option>
                                        <option value="파이썬">Python</option>
                                        <option value="PHP">PHP</option>
                                        <option selected>선택</option>
                                    </select>
                                    <select name="pLangGrade1">
                                        <option value="상" >상</option>
                                        <option value="중" >중</option>
                                        <option value="하" >하</option>
                                        <option selected >선택</option>
                                    </select>
                                </div>
                                <div id="num2">
                                    <select name="pLang2" style="margin-left: 50%; margin-top:10px;">
                                        <option value="자바">JAVA</option>
                                        <option value="자바스크립트">Javascript</option>
                                        <option value="C언어">C</option>
                                        <option value="파이썬">Python</option>
                                        <option value="PHP">PHP</option>
                                        <option selected>선택</option>
                                    </select>
                                    <select name="pLangGrade2">
                                        <option value="상" >상</option>
                                        <option value="중" >중</option>
                                        <option value="하" >하</option>
                                        <option selected >선택</option>
                                    </select>
                                </div>
                                <div id="num3">
                                    <select name="pLang3" style="margin-left: 50%; margin-top:10px;">
                                        <option value="자바">JAVA</option>
                                        <option value="자바스크립트">Javascript</option>
                                        <option value="C언어">C</option>
                                        <option value="파이썬">Python</option>
                                        <option value="PHP">PHP</option>
                                        <option selected>선택</option>
                                    </select>
                                    <select name="pLangGrade3">
                                        <option value="상" >상</option>
                                        <option value="중" >중</option>
                                        <option value="하" >하</option>
                                        <option selected >선택</option>
                                    </select>
                                </div>

                                <br><br>
                                <label>사용 가능 언어</label>
                                <div id="num1">
                                    <select name="tLang1" style="margin-left: 20%;">
                                        <option value="영어">영어</option>
                                        <option value="중국어">중국어</option>
                                        <option value="일본어">일본어</option>
                                        <option selected>선택</option>
                                    </select>
                                    <select name="tLangGrade1">
                                        <option value="상" >상</option>
                                        <option value="중" >중</option>
                                        <option value="하" >하</option>
                                        <option selected >선택</option>
                                    </select>
                                </div>
                                <div id="num2">
                                    <select name="tLang2" style="margin-left: 50%; margin-top:10px;">
                                        <option value="영어">영어</option>
                                        <option value="중국어">중국어</option>
                                        <option value="일본어">일본어</option>
                                        <option selected>선택</option>
                                    </select>
                                    <select name="tLangGrade2">
                                        <option value="상" >상</option>
                                        <option value="중" >중</option>
                                        <option value="하" >하</option>
                                        <option selected >선택</option>
                                    </select>
                                </div>
                                <div id="num3">
                                    <select name="tLang3" style="margin-left: 50%; margin-top:10px;">
                                        <option value="영어">영어</option>
                                        <option value="중국어">중국어</option>
                                        <option value="일본어">일본어</option>
                                        <option selected>선택</option>
                                    </select>
                                    <select name="tLangGrade3">
                                        <option value="상" >상</option>
                                        <option value="중" >중</option>
                                        <option value="하" >하</option>
                                        <option selected >선택</option>
                                    </select>
                                </div>

                            </div>

                            <br><br>
                            <hr>
                            <h3>자기소개</h3>
                            <br>
                            <textarea type="text" id="introduce" name="introduce" placeholder="본인소개, 경력사항, 자격사항 등을 입력해주세요." style="height:300px; margin-bottom:10px;"></textarea>
                            <br><br>

                            <h3>프로필 공개여부</h3>
                            <br>
                            <div class="custom-control custom-radio">
                                <input type="radio" name="profileStatus" value="open" id="jb-radio-1" class="custom-control-input" checked>
                                <label class="custom-control-label" for="jb-radio-1">공개</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" name="profileStatus" value="private" id="jb-radio-2" class="custom-control-input">
                                <label class="custom-control-label" for="jb-radio-2">비공개</label>
                            </div>
                            <br><br>


                            <br><br>
                            <center>
                                <button class="btn btn-primary" type="submit" style="margin:0 20px; width:100px;"> 등록 </button>
                                <button class="btn btn-secondary" type="reset" style="margin:0 20px; width:100px;"> 취소 </button>
                            </center>
                            
                        </form>

                    </div>
                </div>
            </div>
        </section>

    </div>

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
                    img.style.width = '100px';
                    img.style.height = '100px';
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
        
        
        function test() {
        	
        	var memberNo = $("#memberNo").val();
        	var profile = $("#profile_pt").val();
        	var pLang1 = $("select[name=pLang1]").val();
        	var pLang2 = $("select[name=pLang2]").val();
        	var pLang3 = $("select[name=pLang3]").val();
        	var pLangGrade1 = $("select[name=pLangGrade1]").val();
        	var pLangGrade2 = $("select[name=pLangGrade2]").val();
        	var pLangGrade3 = $("select[name=pLangGrade3]").val();
        	var tLang1 = $("select[name=tLang1]").val();
        	var tLang2 = $("select[name=tLang2]").val();
        	var tLang3 = $("select[name=tLang3]").val();
        	var tLangGrade1 = $("select[name=tLangGrade1]").val();
        	var tLangGrade2 = $("select[name=tLangGrade2]").val();
        	var tLangGrade3 = $("select[name=tLangGrade3]").val();
        	var profileStatus = $("input[name=profileStatus]").val();
        	var introduce = $("#introduce").val();
        	console.log(memberNo);
        	console.log(profile);
        	console.log(pLang1 + "  /  " + pLangGrade1);
        	console.log(pLang2 + "  /  " + pLangGrade2);
        	console.log(pLang3 + "  /  " + pLangGrade3);
        	console.log(tLang1 + "  /  " + tLangGrade1);
        	console.log(tLang2 + "  /  " + tLangGrade2);
        	console.log(tLang3 + "  /  " + tLangGrade3);
        	console.log(profileStatus);
        	console.log(introduce);
        	
        }
        
    </script>

</body>
</html>