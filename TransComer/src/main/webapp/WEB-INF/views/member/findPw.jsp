<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>비밀번호 찾기</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrapcss">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        <style>
            
        /* BASIC */

        html {
          background-color: #56baed;
        }

        body {
          font-family: "Poppins", sans-serif;
          height: 100vh;
        }

        a {
          color: #92badd;
          display:inline-block;
          text-decoration: none;
          font-weight: 400;
        }

        h2 {
          text-align: center;
          font-size: 16px;
          font-weight: 600;
          text-transform: uppercase;
          display:inline-block;
          margin: 40px 8px 10px 8px; 
          color: #cccccc;
        }


        /* STRUCTURE */

        .wrapper {
          display: flex;
          align-items: center;
          flex-direction: column; 
          justify-content: center;
          width: 100%;
          min-height: 100%;
          padding: 20px;
        }

        #formContent {
          -webkit-border-radius: 10px 10px 10px 10px;
          border-radius: 10px 10px 10px 10px;
          background: #fff;
          padding: 30px;
          width: 90%;
          max-width: 450px;
          position: relative;
          padding: 0px;
          /*-webkit-box-shadow: 0 30px 60px 0 */
			-webkit-box-shadow: 0 10px 20px 0 
			rgba(0,0,0,0.3);
          /*box-shadow: 0 30px 60px 0 */rgba(0,0,0,0.3);
          text-align: center;
        }

        #formFooter {
          background-color: #f6f6f6;
          border-top: 1px solid #dce8f1;
          padding: 25px;
          text-align: center;
          -webkit-border-radius: 0 0 10px 10px;
          border-radius: 0 0 10px 10px;
        }



        /* TABS */

        h2.inactive {
          color: #cccccc;
        }

        h2.active {
          color: #0d0d0d;
          border-bottom: 2px solid #5fbae9;
        }



        /* FORM TYPOGRAPHY*/

        input[type=submit], input[type=reset]  {
          background-color: #56baed;
          border: none;
          color: white;
          padding: 15px 80px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          text-transform: uppercase;
          font-size: 13px;
          -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
          box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
          -webkit-border-radius: 5px 5px 5px 5px;
          border-radius: 5px 5px 5px 5px;
          margin: 5px 20px 40px 20px;
          -webkit-transition: all 0.3s ease-in-out;
          -moz-transition: all 0.3s ease-in-out;
          -ms-transition: all 0.3s ease-in-out;
          -o-transition: all 0.3s ease-in-out;
          transition: all 0.3s ease-in-out;
        }
            
        input[type=button]{
          background-color: #56baed;
          border: none;
          color: white;
          /*padding: 15px 80px;*/
          text-align: center;
          text-decoration: none;
          display: inline-block;
          text-transform: uppercase;
          font-size: 13px;
          -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
          box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
          -webkit-border-radius: 5px 5px 5px 5px;
          border-radius: 5px 5px 5px 5px;
          margin: 5px 20px 40px 20px;
          -webkit-transition: all 0.3s ease-in-out;
          -moz-transition: all 0.3s ease-in-out;
          -ms-transition: all 0.3s ease-in-out;
          -o-transition: all 0.3s ease-in-out;
          transition: all 0.3s ease-in-out;   
        }

        input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
          background-color: #39ace7;
        }

        input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
          -moz-transform: scale(0.95);
          -webkit-transform: scale(0.95);
          -o-transform: scale(0.95);
          -ms-transform: scale(0.95);
          transform: scale(0.95);
        }

        input[type=text] {
          background-color: #f6f6f6;
          border: none;
          color: #0d0d0d;
          padding: 15px 32px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 16px;
          margin: 5px 0 5px 0;
          width: 85%;
          border: 2px solid #f6f6f6;
          -webkit-transition: all 0.5s ease-in-out;
          -moz-transition: all 0.5s ease-in-out;
          -ms-transition: all 0.5s ease-in-out;
          -o-transition: all 0.5s ease-in-out;
          transition: all 0.5s ease-in-out;
          -webkit-border-radius: 5px 5px 5px 5px;
          border-radius: 5px 5px 5px 5px;
        }

        input[type=text]:focus {
          background-color: #fff;
          border-bottom: 2px solid #5fbae9;
        }

        input[type=text]:placeholder {
          color: #cccccc;
        }
            
        #mPhone {
            margin: 5px 0px 5px 50px;
            width: 90%;
        }  
        #NumCheck {
            margin: 5px 0px 5px 50px;
            width: 90%;
        }      
            
        #phoneBtn {
            margin: 10px 0px 10px 30px;
            padding: 15px 20%;
        }
            
        #Check {
            margin: 10px 0px 10px 30px;
            padding: 15px 20%;
        }
            
        /* ANIMATIONS */

        /* Simple CSS3 Fade-in-down Animation */
        /*.fadeInDown {
          -webkit-animation-name: fadeInDown;
          animation-name: fadeInDown;
          -webkit-animation-duration: 1s;
          animation-duration: 1s;
          -webkit-animation-fill-mode: both;
          animation-fill-mode: both;
        }
			*/
        @-webkit-keyframes fadeInDown {
          0% {
            opacity: 0;
            -webkit-transform: translate3d(0, -100%, 0);
            transform: translate3d(0, -100%, 0);
          }
          100% {
            opacity: 1;
            -webkit-transform: none;
            transform: none;
          }
        }

        @keyframes fadeInDown {
          0% {
            opacity: 0;
            -webkit-transform: translate3d(0, -100%, 0);
            transform: translate3d(0, -100%, 0);
          }
          100% {
            opacity: 1;
            -webkit-transform: none;
            transform: none;
          }
        }

        /* Simple CSS3 Fade-in Animation */
        /*@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
        @-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
        @keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

        .fadeIn {
          opacity:0;
          -webkit-animation:fadeIn ease-in 1;
          -moz-animation:fadeIn ease-in 1;
          animation:fadeIn ease-in 1;

          -webkit-animation-fill-mode:forwards;
          -moz-animation-fill-mode:forwards;
          animation-fill-mode:forwards;

          -webkit-animation-duration:1s;
          -moz-animation-duration:1s;
          animation-duration:1s;
        }

        .fadeIn.first {
          -webkit-animation-delay: 0.4s;
          -moz-animation-delay: 0.4s;
          animation-delay: 0.4s;
        }

        .fadeIn.second {
          -webkit-animation-delay: 0.6s;
          -moz-animation-delay: 0.6s;
          animation-delay: 0.6s;
        }

        .fadeIn.third {
          -webkit-animation-delay: 0.8s;
          -moz-animation-delay: 0.8s;
          animation-delay: 0.8s;
        }

        .fadeIn.fourth {
          -webkit-animation-delay: 1s;
          -moz-animation-delay: 1s;
          animation-delay: 1s;
        }*/

        /* Simple CSS3 Fade-in Animation */
        .underlineHover:after {
          display: block;
          left: 0;
          bottom: -10px;
          width: 0;
          height: 2px;
          background-color: #56baed;
          content: "";
          transition: width 0.2s;
        }

        .underlineHover:hover {
          color: #0d0d0d;
        }

        .underlineHover:hover:after{
          width: 100%;
        }

        /* OTHERS */

        *:focus {
            outline: none;
        } 

        #icon {
          width:60%;
        }
        
        #pwCh1, #pwCh2{
        background-color: #f6f6f6;
          border: none;
          color: #0d0d0d;
          padding: 15px 32px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 16px;
          margin: 5px 0 5px 0;
          width: 85%;
          border: 2px solid #f6f6f6;
          -webkit-transition: all 0.5s ease-in-out;
          -moz-transition: all 0.5s ease-in-out;
          -ms-transition: all 0.5s ease-in-out;
          -o-transition: all 0.5s ease-in-out;
          transition: all 0.5s ease-in-out;
          -webkit-border-radius: 5px 5px 5px 5px;
          border-radius: 5px 5px 5px 5px;
        }
        
        #pwdBtn{
        	width: 85%;
        	height: 55px;
        }

        </style>
    </head>
    
    <body>
        <div class="wrapper fadeInDown">
              <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Icon -->
                <!--<div class="fadeIn first">
                  <img src="/img/logo.png" id="icon" alt="User Icon" />
                </div>-->
                 <ul class="nav nav-tabs">
                  <li class="nav-item">
                    <a class="nav-link disabled" href="#">비밀번호 찾기</a>
                  </li>
                  <!-- <li class="nav-item">
                    <a class="nav-link active" href="#" tabindex="-1" aria-disabled="true">아이디  찾기</a>
                  </li> -->
                </ul>
               
                <!-- Login Form -->
                <div id="ChangeArea">
                  <input type="text" id="mId" class="fadeIn second" name="ID" placeholder="아이디">

                  <!--<input type="text" id="mName" class="fadeIn second" name="name" placeholder="이름">-->
                
                  <div class="row">
                    <div class="col-xs-8">
                    <input type="text" id="mPhone" class="fadeIn  third" name="phone" placeholder="전화번호" maxlength="13">
                    </div>
                    <div class="col-xs-2">
                    <input type="button"  style="width: 110px; height: 55px;" class="fadeIn fourth" id="phoneBtn" value="전송 하기">
                  </div>
                    </div>
                    
                    <div class="row">
                    <div class="col-xs-8">
                    <input type="text" id="NumCheck" class="fadeIn third" placeholder="인증번호">
                    </div>
                    <div class="col-xs-2">
                    <input type="button" class="fadeIn fourth" id="Check" value="인증 확인" style="width: 110px; height: 55px;">
                  </div>
                    </div>
                    
                  <input type="button" class="fadeIn fourth" id="FinalCheck" value="비밀번호 찾기" style="width: 85%; height: 55px;">
                </div>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                  <a class="underlineHover" href="/main.jsp">메인페이지로 돌아가기</a>
                </div>

              </div>
        </div>
        
        <script>
        var Num = 0;
        var check = 0;
        var originId;
        
         $("#phoneBtn").click(function () {
             if ($("#mId").val().length == 0) {
                    alert("아이디를 입력해주세요");
                    return;
             }
             if ($("#mPhone").val().length == 0) {
                    alert("전화번호를 입력해주세요");
                    return;
             }
             
            $.ajax({
               url : "findPwd.tc",
               type : "POST",
               data:{
                     mId : $("#mId").val(),
                     mPhone : $("#mPhone").val()
                  },
               success : function(data) {
                  Num = data;
                  if(data >= 1){
                     alert("인증번호가 전송되었습니다");
                     originId = $("#mId").val();
                     $("#mId").attr("readonly","readonly");
                  }else{                                       
                     alert(data);
                  }
               }
            });

            
         });

		function RePass(){ 
			<!-- 비밀번호 유효성 검사 -->
				
			if(checkPassword($('#pwCh1').val())){
				$("#PassRe").submit();
			}
					
			function checkPassword(password/*,id*/){
			
				if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
					alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
					$('#pwCh1').val('').focus(); 
					return false;
				}
				if(/(\w)\1\1\1/.test(password)){
					alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
					$('#pwCh1').val('').focus(); 
					return false;
				}
				var idOne = $("#pwCh1").val();
				var idTwo = $("#pwCh2").val();
				if(idOne != idTwo){
					alert('비밀번호가 일치하지 않습니다.');
					return false;	
				}
				return true; 
			} 
		 
		};

        
         $("#Check").click(function () {
            var a = Num;
            var b = $("#NumCheck").val();
            if(parseInt(a) == parseInt(b)){
               check = 1;
               alert("인증이 완료되었습니다");
            }else{
               if($("#NumCheck").val() == ""){
                  alert("인증번호를 입력해주세요");
                  return;
               }
               alert("인증번호가 일치하지 않습니다.");
               check = 0;
               $("#mId").removeAttr("readonly");
            }
         });
         
         $("#FinalCheck").click(function () {
            if ($("#mId").val().length == 0) {
                    alert("아이디를 입력해주세요");
                    return;
                }
                if ($("#mPhone").val().length == 0) {
                    alert("전화번호를 입력해주세요");
                    return;
                }
                if(check == 0){
                   alert("휴대폰인증이 완료되지 않았습니다.");
                }
                if(check == 1){
                	$("#ChangeArea").html("<form action='PwdRe.tc' method='POST' id='PassRe'>"
                            + "<div style='margin-top:5px'>"
                            + "<input type='password' name='pass' id='pwCh1' placeholder='비밀번호'>" 
                            + "<br>"
                            + "<input type='password' id='pwCh2' placeholder='비밀번호 확인'>" 
                            + "<input type='hidden' name='userId' value="+originId+">"
                            + "<br>"
                            + "<input type='button' id='pwdBtn' class='fadeIn fourth' value='변경하기' onclick='RePass()'>"
                            + "</div>"
                            + "</form>");

                }
         });
        </script>

	 
        
		 <!--전화번호 Script-->
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
        
          var phoneNum = document.getElementById('mPhone');

          phoneNum.onkeyup = function() {
             console.log(this.value);
             this.value = autoHypenPhone(this.value);
          }
       </script>
</body>
</html>