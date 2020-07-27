package com.tc.spring.chat.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.chat.domain.ChatMessage;
import com.tc.spring.chat.domain.ChatRoom;

@Repository("chatStore")
public class ChatStoreLogic implements ChatStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 채팅방이 있는지 확인
	@Override
	public int checkChatRoom(ChatRoom chatRoom) {
		return sqlSession.selectOne("chatMapper.checkChatRoom", chatRoom);
	}

	// 유저 두명의 정보를 보내고 채팅방 번호 리턴
	@Override
	public int selectChatRoom(ChatRoom chatRoom) {
		return sqlSession.selectOne("chatMapper.selectChatRoom", chatRoom);
	}

	// 채팅 방 정보 데이터 삽입 생성
	@Override
	public int insertChatRoom(ChatRoom chatRoom) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chatMapper.insertChatRoom", chatRoom);
	}

	// 채팅방 번호에 해당하는 채팅 내용 리스트
	@Override
	public ArrayList<ChatMessage> selectChatMessageList(int roomNo) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("chatMapper.selectChatMessageList", roomNo);
	}

	// 채팅 내용 삽입
	@Override
	public int insertChatMessage(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chatMapper.insertChatMessage", chatMessage);
	}
}
