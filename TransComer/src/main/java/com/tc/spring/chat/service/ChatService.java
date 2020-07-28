package com.tc.spring.chat.service;

import java.util.ArrayList;

import com.tc.spring.chat.domain.ChatMessage;
import com.tc.spring.chat.domain.ChatRoom;
import com.tc.spring.chat.domain.OnlineMember;

public interface ChatService {

	/**
	 * 채팅방이 있는지 확인
	 * 
	 * @param chatRoom
	 * @return
	 */
	public int checkChatRoom(ChatRoom chatRoom);

	/**
	 * 채팅방 이름 가져옴
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

	/**
	 * 현재 실시간 접속 유저의 수를 구한다
	 * 
	 * @return
	 */
	public int selectOnlineMemberCnt();

	/**
	 * 현재 실시간 접속 유저 리스트를 가져온다
	 * 
	 * @return
	 */
	public ArrayList<OnlineMember> selectOnlineMemberList();

	/**
	 * 로그인하면, 실시간 접속 유저 목록에서 추가한다
	 * 
	 * @param memberId
	 * @return
	 */
	public int insertOnlineMember(String memberId);

	/**
	 * 로그아웃하면, 실시간 접속 유저 목록에서 제거한다
	 * 
	 * @param memberId
	 * @return
	 */
	public int deleteOnlineMember(String memberId);
}
