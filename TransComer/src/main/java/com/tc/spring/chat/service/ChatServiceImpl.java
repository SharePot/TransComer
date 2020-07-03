package com.tc.spring.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.chat.store.ChatStore;

@Service("chatService")
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatStore chatStore;
}
