package com.tc.spring.chat.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

	// 현재 접속한 유저의 아이디를 저장할 리스트 생성
	private Map<WebSocketSession, String> currentMember;

	// 아이디만 저장할 리스트
	private ArrayList<String> memberList;

	// 사용자 리스트,,

	public EchoHandler() {
		// TODO Auto-generated constructor stub
		sessionList = new ArrayList();
		memberList = new ArrayList();
	}

	// 1. 클라이언트 접속
	// 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//
		super.afterConnectionEstablished(session);

		//
		System.out.println("-----EchoHandler.java -- afterConnectionEstablished() 함수 시작-----");
		// 로그인 한 유저의 아이디를 (handshake, map)
		Map<String, Object> memberMap = session.getAttributes();
		String memberId = (String) memberMap.get("memberId");
		System.out.println("memberMap.get('memberId') : " + memberId);
		System.out.println("memberMap.toString() : " + memberMap.toString());

		//
		sessionList.add(session); // 세션에 저장

		boolean sessionIdCheck = false; // 세션에 해당 아이디가 없다고 가정
		if (memberId != "") {
			// 리스트를 돌면서 해당아이디가 존재하는지 확인
			for (int i = 0; i < memberList.size(); i++) {
				if (memberId.equals(memberList.get(i))) {
					// 해당 아이디가 있으면 존재한다고 변수 변경
					sessionIdCheck = true;
					break;
				}
			}
			if (!sessionIdCheck) {
				// 해당 아이디가 없으면 아이디를 리스트에 넣어준다.
				memberList.add(memberId);
				// 연결이 성공되었을 때에 jsp에 데이터를 보내보자
				session.sendMessage(new TextMessage(memberId));
				// 연결이 성공 되었을때, 연결이 성공된 모든 유저의 정보를 보내자
				System.out.println(">>>>>> memberList.toString" + memberList.toString());
				// session.sendMessage(new TextMessage(memberList.toString()));
			}
		}

		// 구글링방법(세션아이디)
		logger.info("{} 접속(logger)", session.getId());
		//
		// 구글링방법(세션아이디)
		// session.sendMessage(new TextMessage(session.getId() + "님 접속!"));
		// session.sendMessage(new TextMessage(memberId + "님이 입장하셨습니다!"));

		System.out.println("sessionList(리스트) : " + sessionList);
		System.out.println("memberList(Array리스트) : " + memberList);
		System.out.println("클라이언트 접속됨");
		System.out.println("-----EchoHandler.java -- afterConnectionEstablished() 함수 종료-----");
	}

	// 2. 클라이언트 접속 종료
	// 클라이언트가 접속을 종료하면 호출되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		//
		System.out.println("-----EchoHandler.java -- afterConnectionClosed()-----");

		//
		sessionList.remove(session);
		System.out.println("클라이언트 접속해제");
	}

	// 웹 서버에 보낸다
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//
		System.out.println("-----EchoHandler.java -- handleTextMessage() 함수 시작-----");

		// httpsession handshake 찾아서 해보기!! ㅠㅠ
		logger.info("메세지 전송 = {} ", message.getPayload());
		//
		// 로그인 한 유저의 아이디를 가져온다
		Map<String, Object> memberMap = session.getAttributes();
		String memberId = (String) memberMap.get("memberId");
		// 메세지를 채팅에 접속한 유저한테 모두 보내준다.
		for (WebSocketSession sess : sessionList) {
			System.out.println("sess : " + sess);
			// 유저아이디, 메시지, 전송시간을 보내준다.
			sess.sendMessage(new TextMessage(
					memberId + "," + message.getPayload() + "," + this.currentDate() + " " + this.currentTime()));
		}
		System.out.println("-----EchoHandler.java -- handleTextMessage() 함수 종료-----");
	}

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

	// 메시지 전송시나 접속해제시 오류가 발생할 때 호출되는 메소드
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		super.handleTransportError(session, exception);
		System.out.println("전송오류 발생");
	}

	// 오늘 날짜 반환
	public String currentDate() {
		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
		String date = dateFormat.format(today);
		return date;
	}

	// 현재 시간 반환
	public String currentTime() {
		Date today = new Date();
		SimpleDateFormat timeFormat = new SimpleDateFormat("a hh:mm");
		String time = timeFormat.format(today);
		System.out.println(time);
		return time;
	}
}
