<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Websocket Client</title>
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- 부트스르탭 js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- 자체 css 파일 -->
<link rel="stylesheet" href="../../../resources/css/chatRoom.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

	
	$(document).ready(function() {
		/* var chatRoomNo = "${chatRoom.roomNo }";
		console.log("채팅방 번호 : " + chatRoomNo);
	
		var loginUser = "${loginUser.memberId }";
		var roomUser1 = "${chatRoom.roomUser1 }";
		var roomUser2 = "${chatRoom.roomUser2 }";
		
		var sendUser;
		var receiveUser;
		
		if(loginUser == roomUser1){
			sendUser = "${chatRoom.roomUser1 }";
			receiveUser = "${chatRoom.roomUser2 }";
		} else{
			sendUser = "${chatRoom.roomUser2 }";
			receiveUser = "${chatRoom.roomUser1 }";
		}
	
		console.log("sendUser : " + sendUser);
		console.log("receiveUser : " + receiveUser)
		
		if(loginUser == sendUser){
			console.log("현재 로그인유저가 보낸이 입니다.");
		} else{
			console.log("현재 로그인유저가 받는이 입니다.")
		}
		
		var recevieUser = "${chatMsgList[0].receiveUser }";
		console.log("받는이 정보 : " + recevieUser); */
		
		// 스크롤을 최하단으로 고정시키는 코드(최신 채팅 보이도록 고정)
		$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
		
		// 웹소켓 세팅
		var url = window.location.host;//웹브라우저의 주소창의 포트까지 가져옴
		var pathname = window.location.pathname; /* '/'부터 오른쪽에 있는 모든 경로*/
		var appCtx = pathname.substring(0, pathname.indexOf("/", 2));
		var root = url + appCtx;

		//alert(root);
		//var ws = new WebSocket("ws://192.168.0.100:8081/SpringWeb/echo-ws");
		var ws = new WebSocket("ws://" + root + "/echo-ws.tc");
		
		// 웹소켓 관련 함수
		// 웹소켓 연결이 성공 되었을 때 실행
		ws.onopen = onOpen;
		// 웹소켓 서버에서 메시지를 보내면 자동으로 실행된다.
		ws.onmessage = onMessage;
		//
		ws.onclose = onClose;
		
		// 웹소켓 연결이 성공 되었을 때 실행
		function onOpen(){
			// 연결 됨, 표시
			$('#chatStatus').text('채팅방에 입장하셨습니다.');

			// enter(keycode:13) 키를 누르면 이벤트 발생
			$('input[name=chatInput]').on('keydown', function(evt) {
				if (evt.keyCode == 13) {
					console.log("엔터를 눌러서 채팅을 보냈습니다.");
					var msg = $('input[name=chatInput]').val();
					// websocket으로 메시지를 보내는 함수
					ws.send(msg);
					$('input[name=chatInput]').val('');
					// db에 채팅 내용을 저장하는 함수
					// saveMsg(msg);
				}
			});
		}
		
		// 웹소켓 서버에서 메시지를 보내면 자동으로 실행된다.
		function onMessage(event){
			
			// 구글링 화면 뿌리기
			$('textarea').eq(0).prepend(event.data + '\n');
			
			// 내가만든 채팅창 화면 뿌리기
			// 보내준 데이터를 ','를 기준으로 (아이디:내용)으로 자른다
			var splitData = event.data.split(',');
			
			for(var i in splitData){
				console.log("splitData = " + splitData[i]);
			}
			
			// 보낸사람의 아이디를 저장
			var sendUserId = splitData[0];
			// 보낸채팅 내용을 저장
			var sendMessage = splitData[1];
			// 보낸 시간 저장
			var sendTime = splitData[2];
			
			// 현재 로그인한 유저의 정보를 저장
			var loginUserId = "${ loginUser.memberId }";
			console.log(loginUserId);
			
			if(sendUserId==loginUserId){
				// 내가 보낸거 추가
				console.log("내가 보낸 메시지.");
				$("#chatArea").append("<div class='d-flex justify-content-end'><span style='font-size: 0.6em; margin-top: 3px; padding-right: 7px;'>"+sendTime+"</span>"+"<p class='from-me'>"+sendMessage+"</p></div>");				
			} else{
				// 상대방이 보낸거 추가
				console.log("상대방이 보낸 메시지.");
				$("#chatArea").append("<div style='margin-left: 10px;'>"+sendUserId+"</div>");
				$("#chatArea").append("<div class='d-flex justify-content-start'><p class='from-them'>"+sendMessage+"</p><span style='font-size: 0.6em; margin-top: 3px; padding-left: 7px;'>"+sendTime+"</span></div>");
			}
			console.log(event.data);
			
			// 스크롤을 최하단으로 고정시키는 코드(최신 채팅 보이도록 고정)
			$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
		}
		
		function onClose(event){
			$('#chatStatus').text('Info: connection 연결닫힘.');
		}
   	});
	
	// 채팅 기록 리스트 불러오는 함수
	/* function loadChatList(){
		var roomNo = "${chatMsgList[0].roomNo }";
	    $.ajax({
	        url: "chatMsgList.tc",
	        type: 'POST',
	        data : {
	        	roomNo : roomNo
	        },
	        success: function(result) {
	        	consloe.log("채팅 데이터 불러오기 성공");
	            //doWhatEver();
	        },
	        error: function(e){
	        	consloe.log("채팅 데이터 불러오기 실패");
	            //alert('Error in Processing');
	        }
	    });
	} */
	
	// 채팅을 DB 데이터 저장 ajax 함수
	function saveMsg(chatInput){
		var sender = "${loginUser.memberId }";
		var receiver = "user02";
		//var chatInput = $("#chatInput").val();
		console.log("ajax 함수 에서 input값 불러오기 : " +chatInput);
		$.ajax({
			url : "chatMsgInsert.tc",
			data : {
				sendUser : sender,
				receiveUser : receiver,
				chatContent : chatInput
			},
			type : "POST",
			success : function(data){
				console.log("ajax 성공 : " + data);
			},
			error : function(data){
				console.log("ajax 에러 : " + data);
			}
		});
	}
	
</script>
</head>
<body>
	<div class="card">
		<div class="card-header d-flex justify-content-center">
			<span id="chatStatus"></span>
		</div>
		<!-- 채팅 내용 카드바디 -->
		<div class="card-body" id="chatArea" style="height: 580px;">
			<!-- 내가 보낸거 -->
			<!-- <div class="d-flex justify-content-end">
				<p class="from-me">내가 보낸내용</p>
			</div> -->
			<!-- 상대방이 보낸거 -->
			<!-- <div class="d-flex justify-content-start">
                 <p class="from-them">Wow</p>
            </div> -->
            
            <c:forEach var="msg" items="${chatMsgList }">
	            <c:choose>
	            	<c:when test="${loginUser.memberId eq msg.sendUser }">
		            	<!-- 내가 보낸 메시지 -->
		            	<div class="d-flex justify-content-end">
		            		<span style="font-size: 0.6em; margin-top: 3px; padding-right: 7px;">${msg.chatSendDate }</span>
		            		<p class="from-me">${msg.chatContent }</p>
		            	</div>
	            	</c:when>
	            	<c:otherwise>
		            	<!-- 상대방이 보낸 메시지 -->
		           		<div style="margin-left: 10px;">${msg.sendUser }</div>
						<div class='d-flex justify-content-start'>
							<p class='from-them'>${msg.chatContent }</p>
							<span style="font-size: 0.6em; margin-top: 3px; padding-left: 7px;">${msg.chatSendDate }</span>
						</div>
	            	</c:otherwise>
	            </c:choose>
            </c:forEach>
		</div>
		<!-- 채팅 내용 입력창 -->
		<div class="card-footer">
            <input type="text" name="chatInput" class="form-control" placeholder="내용 입력 후 엔터">
        </div>
	</div>

</body>
</html>
