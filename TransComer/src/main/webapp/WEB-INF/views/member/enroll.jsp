<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="resources/css/enroll.css" />
<title>SharePot - 회원가입</title>
<meta charset="utf-8" />
</head>
<c:import url="../common/menuBar.jsp" />
<body class="homepage is-preload">
		<div id="page-wrapper">
			<!-- Main -->
			<section id="main">
				<div id="wrapper">
				<h1 id="title">SharePot 회원가입</h1><br>
				<form action="minsert.tc" method="post">
					<table>
						<tr> <!-- 아이디 -->
							<td><label for="inputId" class="itemTitle">아이디 *</label></td>
							<td><input type="text" placeholder="아이디를 입력해주세요." class="item" id="inputId" name="memberId"></td>
                            <td>
                            	<!-- <p id="chkId">사용중인 아이디입니다.</p>
                            	<p id="errorId">사용가능한 아이디입니다.</p>
                            	<p id="emptyId">아이디를 입력해주세요.</p> -->
                            	<input type="button" onclick="checkId()" value="중복확인" >
							</td>
						</tr>
						<tr> <!-- 비밀번호 -->
							<td><label for="inputPassword" class="itemTitle">비밀번호 *</label></td>
							<td colspan="2"><input type="password" placeholder="비밀번호를 입력해주세요." id="password1" name="memberPw"></td>
						</tr>
						<tr> <!-- 비밀번호 확인 -->
							<td><label for="inputPasswordRe" class="itemTitle">비밀번호 확인 *</label></td>
							<td><input type="password" placeholder="비밀번호를 입력해주세요." id="password2"></td>
							<td><div id="chkNotice"></div></td>
						</tr>
						<tr> <!-- 이름 -->
							<td><label for="inputName" class="itemTitle">이름 *</label></td>
							<td colspan="2"><input type="text" placeholder="이름을 입력해주세요." id="name" name="memberName"></td>
						</tr>
						<tr> <!-- 이메일 -->
							<td><label for="inputEmail" class="itemTitle">이메일 *</label></td>
							<td colspan="2"><input type="text" placeholder="OOOOO@gmail.com" id="inputEmail" name="email"></td>
						</tr>
						<tr> <!-- 휴대폰번호 -->
							<td><label for="inputPhone" class="itemTitle">폰번호 *</label></td>
							<td colspan="2"><input type="text" placeholder="전화번호를 입력해주세요" id="inputPhone" maxlength="13" name="phone"></td>
						</tr>
						<tr id="post"> <!-- 우편번호 -->
							<td><label for="inputPost"  class="itemTitle">우편 번호 *</label></td>
							<td><input type="text" name="post" readonly placeholder="우편번호를 입력해주세요." value=""  id="sample6_postcode" style="width: 70%; float: left"></td>
							<td><input type="button" onclick="sample6_execDaumPostcode()" value="검색" ></td>
						</tr>
						<tr> <!-- 기본주소 -->
							<td><label for="" class="itemTitle">도로명</label></td>
							<td colspan="2"><input type="text" name="address1" readonly id="sample6_address" value=""></td>
						</tr>
						<tr> <!-- 상세주소 -->
							<td><label for="" class="itemTitle">상세주소</label></td>
							<td colspan="2"><input type="text" placeholder="" id="sample6_detailAddress" name="address2" value=""></td>
						</tr>
						<tr> <!-- 은행 -->
							<td><label for="inputAcoount" class="itemTitle">은행명</label></td>
							<td colspan="2"><input type="text" placeholder="은행을 입력해주세요." name="bankName" maxlength="15" id=""></td>
						</tr>
						<tr> <!-- 계좌번호 -->
							<td><label for="inputAcoount" class="itemTitle">계좌번호</label></td>
							<td colspan="2"><input type="text" placeholder="숫자만 입력해주세요." name="accountNumber" maxlength="15" id="inputAcoount"></td>
						</tr>
						<tr> <!-- 예금주 -->
							<td><label for="accountHolder" class="itemTitle">예금주</label></td>
							<td colspan="2"><input type="text" placeholder="예금주 명을 입력해주세요." name="accountName" id="accountHolder" maxlength="15"></td>
						</tr>
						<tr> <!-- 버튼 -->
							<td colspan="3" id="btn">
								<button type="reset">돌아가기</button>
								<button name="submitBtn" type="submit">가입하기</button>
								<a onclick="enroll();">test</a>
							</td>
						</tr>
					</table>
				</form>
					
				</div>

			</section>

		</div>

	<script>
	
		function enroll() {
			
			var memberId = $("#inputId").val();
			var memberPw = $("#password1").val();
			var memberPwRe = $("#password2").val();
			var memberName = $("#name").val();
			var memberEmail = $("#inputEmail").val();
			var memberPhone = $("#inputPhone").val();
			var memberAddress = $("#sample6_postcode").val();
			
			if (memberId == 0) {
				alert("아이디를 입력해주세요")
				return false;
			} else if (memberPw == 0) {
				alert("비밀번호를 입력해주세요")
				return false;
			} else if (memberPwRe == 0) {
				alert("비밀번호를 한번 더 입력해주세요")
				return false;
			} else if (memberName == 0) {
				alert("이름을 입력해주세요")
				return false;
			} else if (memberEmail == 0) {
				alert("이메일을 입력해주세요")
				return false;
			} else if (memberPhone == 0) {
				alert("전화번호를 입력해주세요")
				return false;
			} else if (memberAddress == 0) {
				alert("주소를 입력해주세요")
				return false;
			} 
			
		alert("환영합니다! SharePot 회원가입이 완료되었습니다!");
		return true; 
		
		}
	
	</script>
	
	<script>
	
	<!--id 중복체크-->
	function checkId() {

		var memberId = $("#inputId").val();
		$.ajax({
			url : "IdCheck.tc",
			data : {memberId : memberId},
			success : function(result) {
				if (result == "true" && memberId != 0) {
					alert("사용가능한 아이디입니다.");
				} else if (memberId == 0) {
					alert("아이디를 입력해주세요.");
				} else {
					alert("사용중인 아이디입니다.");
				}
				
			}
			
		});
	}
		
	</script>
	
	<script>
	<!-- 비밀번호 유효성 검사 -->
	$("#password1").change(function(){
		checkPassword($('#password1').val()/*,$('id').val()*/);
	});
	
	function checkPassword(password/*,id*/){

		if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
			alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
			$('#password').val('').focus();
			return false;
		}    
		
		if(/(\w)\1\1\1/.test(password)){
			alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
			$('#password').val('').focus();
			return false;
		}
		return true;
	}
 
	</script>
	<script>
	<!--비밀번호 확인-->
	$(function(){
	    $('#password1').keyup(function(){
	      $('#chkNotice').html('');
	    });
	
	    $('#password2').keyup(function(){
	
	        if($('#password1').val() != $('#password2').val()){
	          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
	          $('#chkNotice').attr('color', '#f82a2aa3');
	        } else{
	          $('#chkNotice').html('비밀번호 일치함<br><br>');
	          $('#chkNotice').attr('color', '#199894b3');
	        }
	
	    });
	});		
	</script>
	<script>
	<!-- 폰 번호 Scripts -->
		var autoHypenPhone = function(str) {
			str = str.replace(/[^0-9]/g, '');
			var tmp = '';
			if (str.length < 4) {
				return str;
			} else if (str.length < 7) {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3);
				return tmp;
			} else if (str.length < 11) {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3, 3);
				tmp += '-';
				tmp += str.substr(6);
				return tmp;
			} else {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3, 4);
				tmp += '-';
				tmp += str.substr(7);
				return tmp;
			}

			return str;
		}

		var phoneNum = document.getElementById('inputPhone');

		phoneNum.onkeyup = function() {
			console.log(this.value);
			this.value = autoHypenPhone(this.value);
		}
	</script>
	<script>
	<!--계좌번호 Scripts-->
		onKeyup = "this.value=this.value.replace(/[^0-9]/g,'');"
		var replaceNotInt = /[^0-9]/gi;

		$(document).ready(function() {

			$("#inputAcoount").on("focusout", function() {
				var x = $(this).val();
				if (x.length > 0) {
					if (x.match(replaceNotInt)) {
						x = x.replace(replaceNotInt, "");
					}
					$(this).val(x);
				}
			}).on("keyup", function() {
				$(this).val($(this).val().replace(replaceNotInt, ""));
			});

		});
		
	</script>


	<!--주소 api-->
	<!--<input type="text" id="sample6_extraAddress" placeholder="참고항목">-->

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								/*// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if(extraAddr !== ''){
								    extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;*/

							} else {
								//document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>

</body>
</html>