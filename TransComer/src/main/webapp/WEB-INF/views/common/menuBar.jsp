<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE HTML>
<html lang="ko">

<head>
    <title>SharePot</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    
    <!--부트스트랩 4.5.0 - css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <!-- 폰트어썸, 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <!-- 부트스트랩 js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    
    
    <!--템플릿 css-->
    <link rel="stylesheet" href="resources/css/main.css" />
</head>

<body class="homepage is-preload">
    <div id="page-wrapper">
    
    	<div id="topBar" align="right">
			<ul>
				<c:url var="login" value="loginPage.tc" />
				<c:if test="${ empty sessionScope.loginUser }">
					<li><a href="${login }">로그인</a></li>
					<li><a href="erollView.tc">회원가입</a></li>
				</c:if>
				
				<c:url var="logout" value="logout.tc" />
				<c:url var="alarm" value="alarmView.tc" />
				
				<c:if test="${!empty sessionScope.loginUser }">
					<li>${loginUser.memberName } 님</li>
					<li><a href="${logout }" id="logout">로그아웃</a></li>
					<li>
						<c:if test="${loginUser.status ne 'ADMIN' }">
							<a href="myPage.tc">마이페이지</a>
						</c:if>
						<c:if test="${loginUser.status eq 'ADMIN' }">
							<a href="adminPage.tc">관리자페이지</a>
						</c:if>
					</li>
					<li><a href="${alarm }" id="alarmUrl">알림</a></li>
				</c:if>
			</ul>
        </div>

        <!-- Header -->
        <section id="header">
			
            <!-- Logo -->
            <h1><a href="home.tc">SharePot</a></h1>

            <!-- Nav -->
            <nav id="nav">
                <ul>
                    <li class="current"><a href="home.tc">Home</a></li>
                    <li>
                        <a href="#">번역 의뢰</a>
                        <ul>
                            <li><a href="sReqListView.tc">단순의뢰</a></li>
                            <li><a href="plist.tc">1:1 의뢰</a></li>
                        </ul>
                    </li>
                    <li><a href="slist.tc">번역 공유</a></li>
                    <li><a href="studyList.tc">스터디</a></li>
                    <li><a href="qlist.tc">Q&nbsp;&amp;&nbsp;A</a></li>
					<li><a href="homepageinfo.jsp">About</a></li>
					<li>
					    <!-- Button trigger modal -->
					    <button class="btn btn-info" data-toggle="modal" data-target="#onlineModal">
					        실시간
					    </button>
					</li>
                </ul>
            </nav>
            
        </section>
    </div>
    
    <!-- Modal -->
    <div class="modal fade" id="onlineModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
            <div class="modal-content">
            	<!-- 모달 헤드 -->
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">실시간 접속 유저</h5>
                </div>
                <!-- 모달 바디 -->
                <div class="modal-body">
                    <!-- 로그인 O 유저 : 실시간 접속자 확인가능 -->
					<c:if test="${!empty sessionScope.loginUser }">
						<nav class="nav flex-column h5" id="onlineId">
							<!-- 실시간 유저 리스트를 반복 출력 -->
							<%-- <c:forEach var="online" items="${onlineList }" varStatus="i">
								<!-- 실시간 유저 리스트는 나를 제외한 사람만 표시 -->
								<c:if test="${online.memberId != loginUser.memberId }">
									<c:url var="wsclient" value="wsclient.tc">
										<c:param name="sendUser" value="${loginUser.memberId }" />
										<c:param name="receiveUser" value="${online.memberId }" />
									</c:url>
									<a href="${wsclient }" onclick="window.open(this.href,'채팅','width=500, height=700, left=100, top=50');return false;" class="nav-link" style="text-decoration: none;">${loginUser.memberName }</a>
									<br>
								</c:if>
							</c:forEach> --%>
						</nav>
						
						<div class="d-flex justify-content-center">
							<c:url var="wsclient" value="wsclient.tc">
								<%-- <c:param name="sendUser" value="${loginUser.memberId }" />
								<c:param name="receiveUser" value="${online.memberId }" /> --%>
							</c:url>
							<br>
							<a href="${wsclient }" class="text-center" onclick="window.open(this.href,'채팅','width=500, height=700, left=700, top=150');return false;" class="nav-link" style="text-decoration: none;">채팅방 입장하기</a>
							<br>
						</div>
					</c:if>
					<!-- 로그인 X : 실시간 접속자 확인 불가 -->
					<c:if test="${empty sessionScope.loginUser }">
						<br>
						<p class="text-center">로그인 후에 이용하실 수 있습니다.</p>
					</c:if>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 웹소켓 -->
    <script type="text/javascript">
    // 실시간 유저 목록을 불러오기
    /* function loadOnlineList(){
    	$.ajax({
			url : "onlineMembers.tc",
			type : "get",
			dataType : "json",
			success : function(data){
				console.log("실시간유저 로드 ajax 결과 : "+data);
				$("#onlineId").html('');
				if( data.length > 0 ) { 
					for( var i in data) {
						$("#onlineId").append
						console.log("리스트 유저 : " + decodeURIComponent(data[i].memberId));
					}
				} else{
					console.log("실시간 접속 유저가 없습니다.");
				}
			},
			error : function(data){
				console.log("로그아웃 ajax 결과 : "+data);				
			}
		});
    } */
    
	$(document).ready(function() {
		// 현재 로그인 한 유저의 아이디 
		var checkLoginUser = "${loginUser.memberId }";

		// 웹소켓 세팅
		var url = window.location.host; // 웹브라우저 주소창의 포트까지
		var pathname = window.location.pathname; /* '/'부터 오른쪽에 있는 모든 경로*/
		var appCtx = pathname.substring(0, pathname.indexOf("/", 2));
		var root = url + appCtx;
		
		// 웹소켓 여는 것
		var ws;
		
		// 로그인이 되어있으면
		if (checkLoginUser != "") {
			// 온라인 유저 목록을 불러옴
			// loadOnlineList();

			console.log("로그인 유저 안비어 있음");

			ws = new WebSocket("ws://" + root + "/echo-ws.tc");

			// 웹소켓 연결이 성공 되었을 때 실행
			ws.onopen = onOpen;
			
			// 웹소켓 서버에서 메시지를 보내면 자동으로 실행된다.
			ws.onmessage = onMessage;
			
		}
	});
	
	// 로그아웃 하면
	$("#logout").click(function(){
		var logoutMember = "${loginUser.memberId }";
		console.log("로그아웃 누름");
		$.ajax({
			url : "removeOnline.tc",
			type : "get",
			data : {
				memberId : logoutMember
			},
			success : function(data){
				console.log("로그아웃 ajax 결과 : "+data);
			},
			error : function(data){
				console.log("로그아웃 ajax 결과 : "+data);				
			}
		});
	});
	
	// 웹소켓 연결 성공되었을 때 실행
	function onOpen() {
		console.log("실시간유저, 웹소켓 열림 ++ ");
	}
	
	function onClose(){
		console.log("실시간유저, 웹소켓 연결 종로 --");
	}
	
	// 웹소켓 서버에서 메시지를 보내면 자동으로 실행된다.
	function onMessage(event) {
		console.log(event.data);
		//
		console.log("실시간유저, 웹소켓 받은 데이터");
		// 데이터 받아오기
		var isUpdate = event.data;
		
		// 만약 받아온 데이터에서 접속 유저 변동이 있다고 하면
		// 실시간 유저 리스트를 다시 뿌려준다.
		if(isUpdate =="reload"){
			console.log("리스트 재로드 해야합니다.")
		}
	}
	
	function reloadOnlineList(){
		$.ajax({
			
		});
	}
</script>

    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/jquery.dropotron.min.js"></script>
    <script src="resources/js/browser.min.js"></script>
    <script src="resources/js/breakpoints.min.js"></script>
    <script src="resources/js/util.js"></script>
    <script src="resources/js/main.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
</body></html>