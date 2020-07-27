package com.tc.spring.chat.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.chat.domain.ChatMessage;
import com.tc.spring.chat.domain.ChatRoom;
import com.tc.spring.chat.store.ChatStore;

@Service("chatService")
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatStore chatStore;

	// 채팅방이 있는지 확인
	@Override
	public int checkChatRoom(ChatRoom chatRoom) {
		return chatStore.checkChatRoom(chatRoom);
	}

	// 유저두명 정보를 보내서 채팅방 번호 가져오기
	@Override
	public int selectChatRoom(ChatRoom chatRoom) {
		return chatStore.selectChatRoom(chatRoom);
	}

	// 채팅 방 데이터 생성 삽입
	@Override
	public int insertChatRoom(ChatRoom chatRoom) {
		// TODO Auto-generated method stub
		return chatStore.insertChatRoom(chatRoom);
	}

	// 채팅방 번호로 채팅내역 리스트 가져오기
	@Override
	public ArrayList<ChatMessage> selectChatMessageList(int roomNo) {
		// TODO Auto-generated method stub
		return chatStore.selectChatMessageList(roomNo);
	}

	// 채팅 내용 데이터 삽입
	@Override
	public int insertChatMessage(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		return chatStore.insertChatMessage(chatMessage);
	}
}
