package com.tc.spring.chat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tc.spring.alarm.domain.Alarm;
import com.tc.spring.chat.domain.Chat;
import com.tc.spring.chat.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	public ModelAndView selectChatList(ModelAndView mv) {
		return mv;
	}
	
	public String insertChat(Chat chat, Model model,  HttpServletRequest request) {
		return null;
	}
}
