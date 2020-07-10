package com.tc.spring.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	// 웹 소켓 세션을 저장할 리스트 생성
	private List<WebSocketSession> sessionList;
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	public EchoHandler() {
		// TODO Auto-generated constructor stub
		sessionList = new ArrayList<>();
	}

	// 1. 클라이언트 접속
	// 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//
		super.afterConnectionEstablished(session);
		// 로그인 한 유저의 아이디를 가져와보고싶다 가져오자 제발루 ㅠ
		Map<String, Object> memberMap = session.getAttributes();
		String userId = (String) memberMap.get("userId");
		System.out.println("memberMap.get('userId') : " + userId);
		System.out.println("memberMap.toString() : " + memberMap.toString());
		//
		sessionList.add(session); // 세션에 저장
		// 구글링방법(세션아이디)
		logger.info("{} 접속(logger)", session.getId());
		//
		// 구글링방법(세션아이디)
		// session.sendMessage(new TextMessage(session.getId() + "님 접속!"));
		// session.sendMessage(new TextMessage(userId + "님이 입장하셨습니다!"));

		System.out.println("sessionList : " + sessionList);
		System.out.println("클라이언트 접속됨");
	}

	// 2. 클라이언트 접속 종료
	// 클라이언트가 접속을 종료하면 호출되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		//
		sessionList.remove(session);
		System.out.println("클라이언트 접속해제");
	}

	// 웹 서버에 보낸다
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// httpsession handshake 찾아서 해보기!! ㅠㅠ
		System.out.println("handleTextMessage 메소드ㅠㅠ");
		logger.info("메세지 전송 = {} ", message.getPayload());
		//
		// 로그인 한 유저의 아이디를 가져와보고싶다 가져오자 제발루 ㅠ
		Map<String, Object> memberMap = session.getAttributes();
		String userId = (String) memberMap.get("userId");
		// 메세지를 채팅에 접속한 유저한테 모두 보내준다.
		for (WebSocketSession sess : sessionList) {
			System.out.println("sess : " + sess);
			sess.sendMessage(new TextMessage(userId + ":" + message.getPayload()));
		}
	}

	// 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		super.handleTransportError(session, exception);
		System.out.println("전송오류 발생");
	}

	// 웹소켓 관련 함수 (하지만),, 주석읽기 
	// 이 아이는 쓰지 않아도 괜찮은 메소드이다, 하지만 이런게 있는걸 알기위해 지우진않는다.
	// 웹소켓 서버측에 텍스트 메시지가 접수되면 호출되는 메소드
	// 웹 서버에서 받는다
	// 클라이언트가 서버로 메시지를 전송했을 때, 실행
	// 얘가 있으면, handleTextMessage() 함수가 실행이 안된다
	// 따라서 양방향 채팅으로 하려면, handleMessage는 주석! or 없애라
	// @Override
	// public void handleMessage(WebSocketSession session, WebSocketMessage<?>
	// message) throws Exception {
	// String payloadMessage = (String) message.getPayload();
	// System.out.println("서버에 도착한 메시지:" + payloadMessage);
	// session.sendMessage(new TextMessage("ECHO : " + payloadMessage));
	// }
}
