package com.tc.spring.chat.store;

import java.util.ArrayList;

import com.tc.spring.chat.domain.ChatMessage;
import com.tc.spring.chat.domain.ChatRoom;

public interface ChatStore {

	/**
	 *  채팅방이 있는지 확인
	 * @param chatRoom
	 * @return
	 */
	public int checkChatRoom(ChatRoom chatRoom);

	/**
	 * 채팅방 번호 가져옴
	 * 
	 * @return
	 */
	public int selectChatRoom(ChatRoom chatRoom);

	/**
	 * 채팅방 생성 삽입
	 * 
	 * @param chatRoom
	 * @return
	 */
	public int insertChatRoom(ChatRoom chatRoom);

	/**
	 * 해당 채팅방의 채팅 내용 모두 가져옴
	 * 
	 * @param roomNo
	 * @return
	 */
	public ArrayList<ChatMessage> selectChatMessageList(int roomNo);

	/**
	 * 채팅 내용 데이터 삽입
	 * 
	 * @param chatMessage
	 * @return
	 */
	public int insertChatMessage(ChatMessage chatMessage);
}
