package com.tc.spring.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tc.spring.chat.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
}
