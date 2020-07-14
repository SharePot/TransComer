package com.tc.spring.chat.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.tc.spring.member.domain.Member;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {

	// 전에 일어나는 핸드셰이커, before
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		//
		System.out.println("-----HandshakeInterceptor.java -- beforeHandshake()-----");
		System.out.println("* Before Handshake");

		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		System.out.println("URI : " + request.getURI()); // 오케이

		HttpServletRequest req = ssreq.getServletRequest();

		// 방법을 찾는다
		System.out.println("req.getSession() : " + req.getSession());
		System.out
				.println("req.getSession().getAttribute('loginUser') : " + req.getSession().getAttribute("loginUser"));

		Member member = (Member) req.getSession().getAttribute("loginUser");
		if (member != null) {
			String userId = member.getMemberId();
			System.out.println("userId : " + userId);
			attributes.put("userId", userId);
			System.out.println("HttpSession에 저장된 loginUser의 userId : " + userId);
		}

		// HttpSession에 저장된 이용자의 아이디를 추출하는 경우
		// String id = (String) req.getSession().getAttribute("loginUser"); // 구글링방법

		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	// 후에 일어나는 핸드셰이커, after
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		//
		System.out.println("-----HandshakeInterceptor.java -- afterHandshake()-----");
		System.out.println("** After Handshake");
		super.afterHandshake(request, response, wsHandler, ex);
	}
}
