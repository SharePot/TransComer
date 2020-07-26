<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>SharePot</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <!--페이-->
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
       <style>
        a {
            text-decoration: none !important;
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
                        <!--메인 내용 구역 1-->
                        <!--페이지 제목, 아이콘-->
                        <div class="d-flex justify-content-center">
                            <!--아이콘 -->
                            <i class="fas fa-parking h1" style="color: red;"></i>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <!--페이지 내용 제목-->
                            <span class="h3">포인트 충전</span>
                        </div>
                        <hr>
                    </div>
                    <div class="col-12">
                        <!--메인 내용 구역 2(지워도 됨, 자유롭게 추가)-->
                        <!--충전 금액 선택-->
                        <p class="h4 text-center font-weight-bold">
                            <i class="fas fa-coins h4" style="color: gold"></i>&nbsp;&nbsp;
                            충전 금액 선택
                        </p>
                        <br>
                        <div class="card" style="margin: 0% 7%;padding: 5%10%;">
                            <div>
                                <div class="form-group row">
                                    <label for="5000p" class="col-sm-6 col-form-label"><span class="h4">5,000 포인트</span></label>
                                    <div class="col-sm-6 d-flex justify-content-end">
                                        <button onclick="inputPrice(5000);">5,000 원</button>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group row">
                                    <label for="10000p" class="col-sm-6 col-form-label"><span class="h4">10,000 포인트</span></label>
                                    <div class="col-sm-6 d-flex justify-content-end">
                                        <button onclick="inputPrice(10000);">10,000 원</button>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group row">
                                    <label for="inputPassword" class="col-sm-6 col-form-label"><span class="h4">20,000 포인트</span></label>
                                    <div class="col-sm-6 d-flex justify-content-end">
                                        <button onclick="inputPrice('20000');">20,000 원</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <hr>
                        <!--결제 수단 선택-->
                        <p class="h4 text-center font-weight-bold">
                            <i class="fas fa-credit-card h3" style="color: deepskyblue"></i>&nbsp;&nbsp;
                            결제 수단 선택
                        </p>
                        <br>
                        <!--결제 수단 목록 버튼-->
                        <div class="card" style="margin: 0%7%; padding: 5%10%;">
                            <button value="신용카드" onclick="payment('card');" class="">신용카드</button><br>
                            <button value="핸드폰결제" onclick="payment('phone');" class="btn-dark">핸드폰 결제</button><br>
                            <button value="삼성페이" onclick="payment('samsung');" class="btn-primary">삼성페이</button><br>
                            <button value="무통장" onclick="payment('vbank');" class="btn-success">무통장</button>
                        </div>
                        <hr>
                        <!--결제 금액, 수단 확인, 결제진행-->
                        <p class="h4 text-center font-weight-bold">
                            <i class="far fa-check-circle h4"></i>&nbsp;&nbsp;
                            결제 정보 확인
                        </p>
                        <br>
                        <div class="card" style="margin: 0%7%;padding: 5%10%;">
                            <div>
                               <!--결제 예정 금액 확인-->
                                <div class="form-group row">
                                    <label for="priceF" class="col-sm-6 col-form-label"><span class="h6">결제 예정 금액</span></label>
                                    <div class="col-sm-6">
                                        <input type="text" readonly class="form-control-plaintext" id="priceF">
                                    </div>
                                </div>
                                <!--결제 수단 확인-->
                                <div class="form-group row">
                                    <label for="payF" class="col-sm-6 col-form-label"><span class="h6">결제 수단</span></label>
                                    <div class="col-sm-6">
                                        <input type="text" readonly class="form-control-plaintext" id="payF">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-center">
                            <input type="button" value="결제하기" id="paySubmit" class="btn">
                            &nbsp;&nbsp;
                            <a href="myPage.tc" class="btn btn-secondary">취소하기</a> &nbsp;&nbsp;
                            <button class="btn btn-info" onclick="return check()">전 페이지로</button>
                        </div>
                    </div>
                </div>
                <!--row 끝-->
            </div>
            <!--container 끝-->
          	<input type="hidden" value="${loginUser.memberId }" id="userId">

		</section>
		<script>
      var amounts = 0;
      var pays = "";
      var userId = $("#userId").val();
      
      function inputPrice(price){
         $("#priceF").val(price);
         amounts = price;
      };
      
      function payment(pay){
         if(pay == 'card'){
            $("#payF").val("신용카드");
            pays = pay;
         };
         if(pay == 'phone'){
            $("#payF").val("핸드폰 결제");
            pays = pay;
         };
         if(pay == 'samsung'){
            $("#payF").val("삼성페이");
            pays = pay;
         };
         if(pay == 'vbank'){
            $("#payF").val("무통장");
            pays = pay;
         };
      };
      
      function check(){
    	  history.go(-6);
      }

      $("#paySubmit").click(function(){
         if(pays == ""){
            alert("결제수단을 선택하지 않으셨습니다.");
         }else if(amounts == 0){
            alert("결제금액을 선택하지 않으셨습니다.");
         }else{
            var IMP = window.IMP; // 생략가능
            IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

            IMP.request_pay({
                pg : 'inicis', // version 1.1.0부터 지원.
                pay_method : pays,
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : '포인트 충전',
                amount : amounts,
                buyer_email : 'test@naver.com',
                buyer_name : '구매자이름',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456',
                m_redirect_url : 'https://www.yourdomain.com/payments/complete'
            }, function(rsp) {
                if ( rsp.success ) {
                   var msg = '결제에 성공하였습니다.';
                  location.href = "payment.tc?userId="+userId+"&amounts="+amounts;
                } else {
                    var msg = '결제에 실패하였습니다.';
                }
                alert(msg);
            });
   
         };
      });

      </script>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</div>
    <!-- Scripts -->
</body>

</html>