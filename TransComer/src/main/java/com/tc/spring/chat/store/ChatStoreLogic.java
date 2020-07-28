package com.tc.spring.chat.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.chat.domain.ChatMessage;
import com.tc.spring.chat.domain.ChatRoom;
import com.tc.spring.chat.domain.OnlineMember;

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
		return sqlSession.insert("chatMapper.insertChatRoom", chatRoom);
	}

	// 채팅방 번호에 해당하는 채팅 내용 리스트
	@Override
	public ArrayList<ChatMessage> selectChatMessageList(int roomNo) {
		return (ArrayList) sqlSession.selectList("chatMapper.selectChatMessageList", roomNo);
	}

	// 채팅 내용 삽입
	@Override
	public int insertChatMessage(ChatMessage chatMessage) {
		return sqlSession.insert("chatMapper.insertChatMessage", chatMessage);
	}

	// 현재 실시간 접속 유저의 수를 구한다
	@Override
	public int selectOnlineMemberCnt() {
		return sqlSession.selectOne("chatMapper.selectOnlineMemberCnt");
	}

	// 현재 실시간 접속 유저 리스트를 가져온다
	@Override
	public ArrayList<OnlineMember> selectOnlineMemberList() {
		return (ArrayList) sqlSession.selectList("chatMapper.selectOnlineMemberList");
	}

	// 로그인하면, 실시간 접속 유저 목록에서 추가한다
	@Override
	public int insertOnlineMember(String memberId) {
		return sqlSession.insert("chatMapper.insertOnlineMember", memberId);
	}

	// 로그아웃하면, 실시간 접속 유저 목록에서 제거한다
	@Override
	public int deleteOnlineMember(String memberId) {
		return sqlSession.delete("chatMapper.deleteOnlineMember", memberId);
	}
}
