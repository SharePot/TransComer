<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>SharePot</title>
<meta charset="utf-8" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />

<style>

</style>
</head>
<body class="homepage is-preload">
<form action="mupdate.tc" method="post">
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">

			<!-- Logo -->
			<h1>
				<a href="index.html">SharePot</a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li class="current"><a href="#">Home</a></li>
					<li><a href="#">번역 의뢰</a>
						<ul>
							<li><a href="#">단순 의뢰</a></li>
							<li><a href="#">1:1 의뢰</a></li>
						</ul></li>
					<li><a href="#">번역 공유</a></li>
					<li><a href="#">스터디</a></li>
					<li><a href="#">Q&amp;A</a></li>
				</ul>
			</nav>
		</section>


		<!-- Main -->
		<section id="main">
			<div class="container" style="margin-right: 60px;">
				<div class="row">
					<div class="col-12" id="maindiv" >
						<!--<div class="form-group row">
                                    <div class="col-sm-2">
                                        <label style="margin-left: 15px;" for="inputId" class="col-form-label">아이디*</label>
                                    </div>
                                    <div class="col-sm-5">
                                      <input style="margin-left: 105px; width: 150%"type="inputId" placeholder="아이디를 입력해주세요." class="form-control" id="inputId" >
                                    </div>
                                    <div class="col-sm-5">
                                        <button style="margin-left: 315px;"class="col-sm-">중복 확인</button>
                                    </div>
                                  </div>-->
						<!--이름-->
						<label for="inputName"
							class="col-sm-2 col-form-label col-md-3">이름</label>
						<div style="float: left;" class="col-sm-10 col-md-9">
							<input type="text" placeholder="이름을 입력해주세요." readonly
								class="form-control" id="name" name="memberName" value="${loginUser.memberName}">
						</div>
						<br><br>
						<!--아이디-->
						<label for="inputId" class="col-sm-2 col-form-label col-md-3">아이디</label>
						<div style="float: left;" class="col-sm-10 col-md-9">
							<input type="text" placeholder="아이디를 입력해주세요." readonly
								class="form-control" id="mid" name="memberId" value="${loginUser.memberId}">
						</div>
						
						<br> <br> 
						 <a style="color: red"><label id="idChcekArea"></label></a><!-- 중복체크 -->

						<!--비밀번호-->
						<br>
						<label for="inputPassword"
							class="col-sm-2 col-form-label col-md-3">비밀번호</label>
						<div style="float: left;" class="col-sm-10 col-md-9">
							<input type="password" placeholder="비밀번호를 입력해주세요."
								class="form-control" id="password1" name="memberPw">
						</div>

						<br> <br> 

						<!--비밀번호 확인-->
						<label for="inputPasswordRe"
							class="col-sm-2 col-form-label col-md-3">비밀번호 확인</label>
						<div style="float: left;" class="col-sm-10 col-md-9">
							<input type="password" placeholder="비밀번호를 입력해주세요."
								class="form-control" id="password2">
							<br>
						<font id="chkNotice" size="3" style="text-align: center;"></font>
						</div>
						
						<br> <br> 


						<!--이메일-->
						<!--<label for="inputEmail"  class="col-sm-2 col-md-3 col-form-label">이메일*</label>
                              <div  style="float: right;" class="col-sm-10 col-md-9">
                              <input type="text" placeholder="이메일을 입력해주세요." class="form-control" id="inputEmail" style="width: 47%; float: left;">      
                              <div class="input-group-text" 
                                   style="width: 6%; float: left;" >@</div>
                                <input type="text" class="form-control" id="inlineFormInputGroupUsername" style="width: 47%; float: right; "  placeholder="google.com">
                              </div>-->
						<label for="inputEmail" class="col-sm-2 col-form-label col-md-3">이메일</label>
						<div style="float: left;" class="col-sm-10 col-md-9">
							<input type="email" placeholder="OOOOO@gmail.com"
								class="form-control" id="inputEmail" name="memberEmail" value="${loginUser.memberEmail}">
						</div>


						<br> <br> 


						<!--폰 번호-->
						<label for="inputPhone" class="col-sm-2 col-form-label col-md-3">폰
							번호</label>
						<div style="float: left;" class="col-sm-10 col-md-9">
							<input type="text" placeholder="010-0000-0000"
								class="form-control" id="inputPhone" maxlength="13" name="memberPhone" value="${loginUser.memberPhone }">
						</div>
						<br> <br> 


						<!--우편번호-->
						<!--<label for="inputPost"  class="col-sm-2 col-form-label col-md-3">우편 번호*</label>
                              <div  style="float: right;" class="col-sm-10 col-md-9">
                              <input type="text" readonly placeholder="우편번호를 입력해주세요." class="form-control" id="inputPost">
                              </div>-->

						<!--우편번호-->
						<c:forTokens var="addr" items="${loginUser.memberAddress }" delims="," varStatus="status">
						<c:if test="${status.index eq 0 }">
						<label for="inputPost" class="col-sm-2 col-form-label col-md-3">우편
							번호</label>
						<div style="float: left;" class="col-sm-10 col-md-9">
							<input type="text" name="post" readonly
								placeholder="우편번호를 입력해주세요." class="form-control"
								id="sample6_postcode" style="width: 70%; float: left" value="${addr}" >


							<input type="button" onclick="sample6_execDaumPostcode()"
								class="btn btn-primary" value="검색"
								style="float: left; margin-left: 10px; height: 40px;">
						</div>
						</c:if>
				
						<!--기본주소-->
						<c:if test="${status.index eq 1 }">
						<label for="" class="col-sm-2 col-form-label col-md-3">도로명</label>
						<div style="float: left;" class="col-sm-10 col-md-9">
							<input type="text" name="address1" readonly id="sample6_address"
								placeholder="" class="form-control" value="${addr }">
						</div>
						</c:if>

						<!--상세주소-->
						<c:if test="${status.index eq 2 }">
						<label for="" class="col-sm-2 col-form-label col-md-3">상세주소</label>
						<div style="float: left;" class="col-sm-10 col-md-9">
							<input type="text" placeholder="" id="sample6_detailAddress"
								class="form-control" name="address2" value="${addr }">
						</div>
						</c:if>
						</c:forTokens>

				

						<!--은행-->
						<%-- <c:forTokens var="account" items="${loginUser.accountInfo }" delims="," varStatus="status">
						<c:if test="${status.index eq 0 }">
							<label class="col-md-3 col-sm-2">은행</label>
						<div>
							 <select value="${account }"
								name="bankName"class="custom-select custom-select-sm-10 col-md-9"
								style="width: 72.5%; margin-left: 12px; float: left;">
								<option selected>은행을 선택해주세요.</option>
								<option value="1">신한은행</option>
								<option value="2">KB국민은행</option>
								<option value="3">하나은행</option>
								<option value="4">Citibank</option>
								<option value="5">KEB</option>
								<option value="6">우리은행</option>
							</select>
						</div>
						</c:if>
					


						<!--<label for="bank" class="col-sm-2 col-form-label col-md-3">은행</label>
                               <select style="margin-right: 12.5px; width: 72.5%; float: right;"class="col-sm-10 col">-->

						<!--계좌번호-->
						<c:if test="${status.index eq 1 }">
						<div style="float: left;" class="col-sm-10 col-md-9">
						<label for="inputAcoount" class="col-sm-2 col-form-label col-md-3">계좌번호</label>
							<input type="text" placeholder="숫자만 입력해주세요." class="form-control"
							name="accountNumber"maxlength="15" id="inputAcoount"  value="${account }">
						</div>
						</c:if>

					


						<!--예금주-->
						<c:if test="${status.index eq 2 }">
						<div style="float: left;" class="col-sm-10 col-md-9">
						<label for="accountHolder"
							class="col-sm-2 col-form-label col-md-3">예금주</label>
							<input type="text" placeholder="예금주 명을 입력해주세요."
							name="accountName" class="form-control" id="accountHolder" maxlength="15"  value="${account }">
						</div>
						</c:if>
						</c:forToken --%>
						
						<!--은행-->
						<c:forTokens var="account" items="${loginUser.accountInfo }" delims="," varStatus="status">
						<c:if test="${status.index eq 0 }">
						<label for="" class="col-sm-2 col-form-label col-md-3">은행</label>
						<div style="float: left;" class="col-sm-10 col-md-9">
							<input type="text" name="bankName"  placeholder="" class="form-control" value="${account }">
						</div>
						</c:if>
				
						<!--계좌번호-->
						<c:if test="${status.index eq 1 }">
						<label for="" class="col-sm-2 col-form-label col-md-3">계좌번호</label>
						<div style="float: left;" class="col-sm-10 col-md-9">
							<input type="text" name="accountNumber"  placeholder="계좌번호를 입력해주세요" class="form-control" value="${account }">
						</div>
						</c:if>

						<!--예금주-->
						<c:if test="${status.index eq 2 }">
						<label for="" class="col-sm-2 col-form-label col-md-3">예금주</label>
						<div style="float: left;" class="col-sm-10 col-md-9">
							<input type="text" placeholder="" id=""
								class="form-control" name="accountName" value="${account }">
						</div>
						</c:if>
						</c:forTokens>

					</div>
				</div>
				<br> <br>
			</div>
				<div style="text-align: center;">
					<input type="button" id="resetBtn" value="돌아가기"
						style="width: 120px; height: 40px; margin-left: 10%;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit"
						name="submitBtn" value="수정 하기" style="width: 120px; height: 40px;">
				</div>


	

		</section>
		<!-- Footer -->
		<section id="footer">
			<div class="container">
				<div class="row">
					<div class="col-8 col-12-medium"></div>
					<div class="col-4 col-12-medium"></div>
					<div class="col-12"></div>
				</div>
			</div>
		</section>
		
	</div>
</form>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

	<!--id 중복체크-->
	
	<script type="text/javascript">
       $("#mId").keyup(function () {
          $.ajax({
                url : "/IdCheck",
                type : "POST",
                data:{
                      mId : $("#mId").val()
                   },
                success : function(data) {
                   if(data >= 1){
                      $("#idChcekArea").text("이미 있는 아이디입니다.");
                   }else{       
                      $("#idChcekArea").text("사용 가능한 아이디 입니다.");
                   }
                }
             });
      });
       
    </script>
	 <!-- 비밀번호 유효성 검사 -->
   <script>
		 $("#password1").change(function(){
		checkPassword($('#password1').val()/*,$('id').val()*/);
	});
	function checkPassword(password/*,id*/){

		if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
			alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
			$('#password').val('').focus();
			return false;
		}    
		/* var checkNumber = password.search(/[0-9]/g);
		var checkEnglish = password.search(/[a-z]/ig);
		if(checkNumber <0 || checkEnglish <0){
			alert("숫자와 영문자를 혼용하여야 합니다.");
			$('#password').val('').focus();
			return false;
		} */
		if(/(\w)\1\1\1/.test(password)){
			alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
			$('#password').val('').focus();
			return false;
		}

		/*if(password.search(id) > -1){
			alert("비밀번호에 아이디가 포함되었습니다.");
			$('#password').val('').focus();
			return false;
		}
		return true;*/
	}
 
	</script>
	
	<!--비밀번호 확인-->
	<script>
	$(function(){
    $('#password1').keyup(function(){
      $('#chkNotice').html('');
    });

    $('#password2').keyup(function(){

        if($('#password1').val() != $('#password2').val()){
          $('#chkNotice').html('비밀번호 일치하지 않습니다.<br><br>');
          $('#chkNotice').attr('color', '#f82a2aa3');
        } else{
          $('#chkNotice').html('비밀번호 일치 합니다.<br><br>');
          $('#chkNotice').attr('color', '#199894b3');
        }

    });
});	
	</script>
	
	<!-- 폰 번호 Scripts -->
	<script>
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

	<!--계좌번호 Scripts-->
	<script>
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

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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