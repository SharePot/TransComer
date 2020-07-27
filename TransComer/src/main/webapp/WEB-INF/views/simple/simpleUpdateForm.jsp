<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SharePot - 단순의뢰 수정하기</title>
	
	<!-- css -->
	<link rel="stylesheet" href="resources/css/simpleInsertForm.css" />
	<link rel="stylesheet" href="resources/css/main.css" />
</head>
<c:import url="../common/menuBar.jsp" />
<body class="homepage is-preload">
    <div id="page-wrapper">


        
        <!-- Main -->
        <section id="main">
            <div id="mainWrapper">
                
                <h1 id="mainTitle">단순의뢰 수정하기</h1>
                <hr>
                <form action="sReqUpdate.tc" method="post">
					<input type="hidden" id="simpleNo" name="simpleNo" value="${sReq.simpleNo }">
                    <table id="mainTb">
                        <tr>
                            <td>개발언어</td>
                            <td>
                                <select name="simplePLang">
                                    <option value="자바">JAVA</option>
                                    <option value="자바스크립트">Javascript</option>
                                    <option value="C언어">C</option>
                                    <option value="파이썬">Python</option>
                                    <option value="PHP">PHP</option>
                                    <option>선택</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>번역언어</td>
                            <td>
                                <select name="simpleTLang">
                                    <option value="한국어">한국어</option>
                                    <option value="영어">영어</option>
                                    <option value="중국어">중국어</option>
                                    <option value="일본어">일본어</option>
                                    <option>선택</option>
                                </select>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="simpleTitle" placeholder="제목을 입력해주세요." value="${sReq.simpleTitle }"></td>
                        </tr>

                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea cols="50" rows="7" name="simpleContent" onkeyup="fnChkByte(this);" placeholder="글자수는 500자로 제한됩니다.  답변 채택 후에는 질문 수정, 삭제가 불가합니다.">${fn:replace(sReq.simpleContent, '<br>','') }</textarea>
                                <p id="noti">500자</p>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <input type="submit" value="수정" id="submitBtn">&nbsp;&nbsp;
                                <input type="reset" value="취소" id="resetBtn">
                            </td>
                        </tr>

                    </table>
                    
                </form>
            </div>

			<input type="hidden" id="tLang" value="${sReq.simpleTLang }">
            <input type="hidden" id="pLang" value="${sReq.simplePLang }">

        </section>

        <script>
        
        var pLang = $("#pLang").val();
        var tLang = $("#tLang").val();
        
  		function submitBtn () {
        	
  			var t = $("input[name=simpleTitle]").val()
  			var c = $("textarea[name=simpleContent]").val()
  			var p = $("select[name=simplePLang]").val()
  			var tl = $("select[name=simpleTLang]").val()
  			var n = $("#simpleNo").val()
  			
        	console.log(pLang);
        	console.log(tLang);
        	console.log(t);
        	console.log(c);
        	console.log(p);
        	console.log(tl);
        	console.log(n);
        	
        }
        
        $("select[name=simplePLang]").val(pLang).prop("selected", true);
        $("select[name=simpleTLang]").val(tLang).prop("selected", true);
        
            function fnChkByte(obj) {
                var maxByte = 1000; //최대 입력 바이트 수
                var str = obj.value;
                var str_len = str.length;

                var rbyte = 0;
                var rlen = 0;
                var one_char = "";
                var str2 = "";

                for (var i = 0; i < str_len; i++) {
                    one_char = str.charAt(i);

                    if (escape(one_char).length > 4) {
                        rbyte += 2; //한글2Byte
                    } else {
                        rbyte++; //영문 등 나머지 1Byte
                    }

                    if (rbyte <= maxByte) {
                        rlen = i + 1; //return할 문자열 갯수
                    }
                }

                if (rbyte > maxByte) {
                    alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
                    str2 = str.substr(0, rlen); //문자열 자르기
                    obj.value = str2;
                    fnChkByte(obj, maxByte);
                } else {
                    document.getElementById('noti').innerText = rbyte;
                }
            }

            $(document).ready(function() {
                $("textarea").keyup(function() {
                    var inputLength = $(this).val().length;
                    var remain = 500 - inputLength;
                    $("#noti").html(remain + "자");
                })
            })
        </script>

    </div>
</body>
</html>