package com.tc.spring.chat.interceptor;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.tc.spring.member.domain.Member;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {

	private ArrayList<String> onlineList;	// 온라인 유저 목록

	public HandshakeInterceptor() {
		// TODO Auto-generated constructor stub
		onlineList = new ArrayList<String>();
	}

	// 전에 일어나는 핸드셰이커, before
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		//
		System.out.println("** HandshakeInterceptor.java -- beforeHandshake() 함수 시작-----");

		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;

		HttpServletRequest req = ssreq.getServletRequest();

		// 세션에 있는 현재 로그인 유저의 정보를 확인
		// System.out.println("req.getSession().getAttribute('loginUser') : " +

		// 현재 로그인 사용자 아이디를 가져온다
		String memberId = ((Member) req.getSession().getAttribute("loginUser")).getMemberId();

		// 현재 로그인 유저가 비어있지 않으면
		if (memberId != "") {
			attributes.put("memberId", memberId);

			boolean sessionIdCheck = false; // 세션에 해당 아이디가 없다고 가정
			// 리스트를 돌면서 해당아이디가 존재하는지 확인
			for (int i = 0; i < onlineList.size(); i++) {
				if (memberId.equals(onlineList.get(i))) {
					// 해당 아이디가 있으면 존재한다고 변수 변경
					sessionIdCheck = true;
					break;
				}
			}
			if (!sessionIdCheck) {
				// 해당 아이디가 없으면 아이디를 리스트에 넣어준다.
				// 실시간 멤버 목록을 리스트에 넣어서 전달
				onlineList.add(memberId);
				System.out.println(">>>>핸드셰이커<<< memberList.toString" + onlineList.toString());
			}

			//
			attributes.put("onlineList", onlineList);
		} else {
			// 로그인 유저가 비어있으면
		}

		// HttpSession에 저장된 이용자의 아이디를 추출하는 경우
		// String id = (String) req.getSession().getAttribute("loginUser"); // 구글링방법

		System.out.println("-----HandshakeInterceptor.java -- beforeHandshake() 함수 종료-----");
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	// 후에 일어나는 핸드셰이커, after
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		//
		System.out.println("** HandshakeInterceptor.java -- afterHandshake() 함수 시작-----");
		super.afterHandshake(request, response, wsHandler, ex);
		System.out.println("** HandshakeInterceptor.java -- afterHandshake() 함수 종료-----");
	}
}
