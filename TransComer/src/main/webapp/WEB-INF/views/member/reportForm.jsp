<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SharePot - 신고하기</title>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script> 
	
	<style>
	
		#reportWrapper {
		    padding: 15px;
		}
		
		#title {
		    text-align : center;
		    color: midnightblue;
		}
		
		#wLetter {
		    font-size: 15px;
		    text-align : center;
		    margin-bottom: 30px;
		}
		
		#reportSection {
		    margin-top: 30px;
		    text-align: center;
		}
		
		table tr td:first-child {
		    width: 150px;
		    height: 40px;
		}
		
		table tr td:first-child label {
		    margin-left: 50px;
		}
		
		table tr td:last-child {
		    width: 300px;
		}
		
		table tr td:last-child input {
		    margin-right: 100px;
		    width: 75%;
		    height: 30px;
		    border-radius: 10px;
		    border: 1px solid lightgray;
		    padding: 6px;
		    padding-left: 12px;
		}
		
		table tr td:last-child input:hover {
		    margin-right: 100px;
		    width: 75%;
		    height: 30px;
		    border-radius: 10px;
		    border: 1px solid blue;
		    padding: 6px;
		    padding-left: 12px;
		}
		
		table tr:last-child {
		    height: 100px;
		}
		
		#reportBtn, #reportClose {
		    background: lightblue;
		    border: 0px;
		    width: 100px;
		    height: 40px;
		    border-radius: 10px;
		    box-shadow: 2px 2px 10px lightgray;
		    color: aliceblue;
		    font-weight: bold;
		}
		
		#reportBtn:hover, #reportClose:hover {
		    background: #A0D9E2;
		}


		
	
	</style>
	
</head>
<body>

	<div id="reportWrapper">
            <h1 id="title">신고하기</h1>
            <p id="wLetter">허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니,<br> 유의하시어 신중하게 신고해 주세요.</p>
            <hr>
            <div id="reportSection">
                
                <table align="center">
                    
                    <tr>
                        <td><label>작성자 </label></td>
                        <td><input type="text" value="${loginUser.memberId}" id="reporter"  name="reporterMemberId" readonly></td>
                    </tr>
                    <tr>
                        <td><label>신고자</label></td>
                        <td><input type="text" readonly id="target" name="targetMemberId" ></td>
                    </tr>  
                    <tr>
                        <td><label>신고사유</label></td>
                        <td><input type="text" name="reportContent" id="content"></td>
                    </tr>  
                    <tr>
                        <td colspan="2">
                            <button id="reportBtn" onclick="reportSubmit(this)">신고하기</button>
                            <button id="reportClose" value="창닫기" onclick="window.close()">창닫기</button>
                        </td>
                    </tr>
                    
                </table>
                
            </div>   
	    </div>








	<script>
		document.getElementById("target").value =
		opener.document.getElementById("responseWriter").value;
	</script>
	
	<script>
		
		function reportSubmit(obj) {
			
			var reporterMemberId = $("#reporter").val();
			var targetMemberId = $("#target").val();
			var reportContent = $("#content").val();
			var result = window.confirm("정말로 신고하시겠습니까?");
			if (result) {
				
				$.ajax ({
					url : "rinsert.tc",
					data : {reporterMemberId : reporterMemberId,
							targetMemberId : targetMemberId,
							reportContent : reportContent},
					type : "post",
					success : function (data) {
						alert("신고가 완료되었습니다.");
						window.close();
					}
				});
				
			} else {
				alert("신고하기가 실패하였습니다.");
				window.close();
			}
			
			
		}
	
	
	</script>
	
</body>
</html>