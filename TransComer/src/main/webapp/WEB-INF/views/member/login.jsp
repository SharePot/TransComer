<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
       <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!DOCTYPE html>
<html data-brackets-id='2665'>
<head data-brackets-id='2666'>
<meta data-brackets-id='2667' http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title data-brackets-id='2668'>Insert title here</title>
<link data-brackets-id='2669' href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrapcss">
        <script data-brackets-id='2670' src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script data-brackets-id='2671' src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style data-brackets-id='2672'>
            
/* BASIC */

html {
  background-color: white;
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
   -webkit-box-shadow: 0 10px 30px 0 
   rgba(0,0,0,0.3);
  /*box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);*/
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

input[type=button], input[type=submit], input[type=reset]  {
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
  margin: 5px;
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
            
input[type=password] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
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
input[type=password]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=password]:placeholder {
  color: #cccccc;
}



/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
/*
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

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
*/

/* Simple CSS3 Fade-in Animation */
/*
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
*/

/*.fadeIn {
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


#login{
    width: 85%;
}
            
#password{
    width: 85%;
}
            
#submitBtn{
    width: 85%;            
}
            
#submitBtn1{
    width: 85%;  
    background-color: #F7E600;
    color: #964B00;
}            
/*
#submitBtn2{
    width: 85%;            
}
            
#submitBtn3{
    width: 85%;            
}*/


/* OTHERS */

*:focus {
    outline: none;
} 

#icon {
    width:60%;
}

#idChcekArea.a{
    color : red;
}
 

ul li{
    list-style-type: none; float: left; margin-left: 18px; 
}

/*방문한적이 없는 일반적인 링크*/
a:link {text-decoration: none; color: black;}
            
/*방문한적이 있는 링크*/
a:visited {text-decoration: none; color: black;}
            
/*클릭하는 순간을 의미*/
a:active {text-decoration: none; color: black;}
            
/*마우스를 올렸을 때*/
a:hover {text-decoration: underline; color: black;}
</style>

</head>
<body data-brackets-id='2673'>
<div data-brackets-id='2674' class="wrapper fadeInDown">
              <div data-brackets-id='2675' id="formContent">
                <!-- Tabs Titles -->

                <!-- Icon -->
                <div data-brackets-id='2676' class="fadeIn first">
                  <img data-brackets-id='2677' src="resources/image/logo.png" id="icon" alt="User Icon" />
                </div>

                <!-- Login Form -->
                <form data-brackets-id='2678' action="login.tc" method="post" id="loginForm">
                   <br data-brackets-id='2679'><br data-brackets-id='2680'>
                     <input data-brackets-id='2681' type="text" id="login" class="fadeIn second" name="memberId" placeholder="아이디를 입력해주세요">
                     <br data-brackets-id='2682'><br data-brackets-id='2683'>
                     <input data-brackets-id='2684' type="password" id="password" class="fadeIn third" name="memberPw" placeholder="비밀번호를 입력해주세요">
                    <br data-brackets-id='2685'><br data-brackets-id='2686'><a data-brackets-id='2687' style="color: red"><label data-brackets-id='2688' id="idChcekArea"></label></a><!-- 중복체크 -->
                     
                     <input data-brackets-id='2689' type="button" class="fadeIn fourth" value="로그인" id="submitBtn">
                     <!-- <input data-brackets-id='2690' type="button" class="fadeIn fourth" value="카카오 계정으로 로그인" id="submitBtn1"> -->
                 
                </form>
                <ul data-brackets-id='2691'>
                    <li data-brackets-id='2692' id="findId" data-tabtar="lgm-2" class="current">
                        <a data-brackets-id='2693' id="findIds" class="fadeIn fourth" href="findIdPg.tc">아이디 찾기</a>
                    </li>
                    
                    <!--class="fadeIn fourth"-->
                    <li data-brackets-id='2694' id="|" data-tabtar="lgm-2" class="fadeIn fourth">
                    <a data-brackets-id='2695' class="sign">|</a>
                    </li>

                     <li data-brackets-id='2696' id="findPw" data-tabtar="lgm-2" class="fadeIn fourth">
                        <a data-brackets-id='2697' id="findPws" href="findPwPg.tc">비밀번호 찾기</a>
                    </li>

                    <li data-brackets-id='2698' id="|" data-tabtar="lgm-2" class="fadeIn fourth">
                        <a data-brackets-id='2699' class="sign">|</a>
                    </li>

                     <li data-brackets-id='2700' id="enroll" data-tabtar="lgm-2" class="fadeIn fourth">
                        <a data-brackets-id='2701' id="enrolls" href="erollView.tc">회원가입</a>
                    </li>
                </ul>
                <br data-brackets-id='2702'><br data-brackets-id='2703'>
                
            
                
             
                <!-- Remind Passowrd -->
                
                <!--<div id="formFooter">
                  <a class="underlineHover" href="/views/extra/findID.jsp">아이디 찾기</a>
                  <br>
                  <a class="underlineHover" href="/views/extra/findPW.jsp">비밀번호 찾기</a>
                </div>
-->
              </div>
        </div>
        
    <script data-brackets-id='2704' type="text/javascript">
       $("#submitBtn").click(function () {
          var memberId=$("#login").val();
          var memberPw=$("#password").val();
          
          if($("#login").val() == ""){
             alert("아이디를 입력해주세요.");
          }else if($("#password").val()==""){
             alert("비밀번호를 입력해주세요.");
          }else{
             $.ajax({
                   url : "login.tc",
                   type : "post",
                   data:{memberId:memberId,
                         memberPw:memberPw
                      },
                   success : function(data) {
                      if(data == "success"){
                         window.location.href = "home.tc";
                      }else{
                         $("#idChcekArea").text("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
                         
                      }
                   }
                });
          }
      });
    </script>
        
</body>
</html>