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
		System.out.println("* Before Handshake");

		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		System.out.println("URI : " + request.getURI()); // 오케이

		HttpServletRequest req = ssreq.getServletRequest();

		// 방법을 찾는다
		System.out.println("req.getSession() : " + req.getSession());
		System.out.println("req.getSession().getAttribute() : " + req.getSession().getAttribute("loginUser"));
		System.out.println("req.getSession().getAttribute() : " + req.getSession().getAttribute("loginUser"));

		// 세션에 저장된 로그인 유저의 정보 attribute를 가져와, 형변환
		Member member = (Member) req.getSession().getAttribute("loginUser");
		// 가져온 멤버의 아이디 값을 가져온다.
		String memberId = member.getMemberId();
		System.out.println("userId : " + memberId);

		// HttpSession에 저장된 이용자의 아이디를 추출하는 경우
		// String id = (String) req.getSession().getAttribute("loginUser"); // 구글링방법
		attributes.put("userId", memberId);	// 키, 벨류
		System.out.println("HttpSession에 저장된 loginUser의 userId : " + memberId);

		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	// 후에 일어나는 핸드셰이커, after
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		System.out.println("** After Handshake");
		super.afterHandshake(request, response, wsHandler, ex);
	}
}
