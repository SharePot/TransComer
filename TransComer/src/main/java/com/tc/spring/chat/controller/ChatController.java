package com.tc.spring.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tc.spring.chat.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	// 채팅 페이지로 이동시킴
	@RequestMapping("wsclient.kh")
	public String chatForm() {
		return "chat/wsclient";
	}
}
