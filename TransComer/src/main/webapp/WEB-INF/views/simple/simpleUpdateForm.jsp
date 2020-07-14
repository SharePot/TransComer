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
                    <table id="mainTb">

                        <tr>
                            <td>개발언어</td>
                            <td>
                                <select name="simplePLang">
                                    <option value="java">자바</option>
                                    <option value="cLang">c언어</option>
                                    <option value="python">파이썬</option>
                                    <option value="js">JavaScript</option>
                                    <option value="php">PHP</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>번역언어</td>
                            <td>
                                <select name="simpleTLang">
                                    <option value="kr">한국어</option>
                                    <option value="eng">영어</option>
                                    <option value="ch">중국어</option>
                                    <option value="spa">스페인어</option>
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



        </section>

        <script>
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
                    document.getElementById('byteInfo').innerText = rbyte;
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