package com.tc.spring.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonObject;
import com.tc.spring.chat.domain.ChatMessage;
import com.tc.spring.chat.domain.ChatRoom;
import com.tc.spring.chat.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;

	// 실시간 접속자 페이지로 이동
	@RequestMapping(value = "onlineUsers.tc", method = RequestMethod.GET)
	public String onlineUsers() {
		return "chat/onlineUsers";
	}

	// 해당 두 유저의, 채팅 페이지로 이동시킴
	@RequestMapping("wsclient.tc")
	public String chatView(String sendUser, String receiveUser, Model model) {
//		// 1. 두명의 유저의 채팅방 번호(과거 채팅기록이 있는지)확인
//		int roomNo = this.checkChatRoom(sendUser, receiveUser);
//
//		if (roomNo < 1) {
//			// 1-1. 두명의 유저의 채팅방 기록이 없음
//			// 1-1-1. 채팅방을 생성한다
//			int roomNoInsert = this.insertChatRoom(sendUser, receiveUser);
//			if (roomNoInsert < 1) {
//				// 채팅방 번호 생성에 실패하면 에러페이지
//				return "common/errorpage";
//			}
//		}
//		roomNo = this.chatRoomNumber(sendUser, receiveUser);
//
//		// 채팅방 정보
//		ChatRoom chatRoom = new ChatRoom();
//		chatRoom.setRoomNo(roomNo);
//		chatRoom.setRoomUser1(sendUser);
//		chatRoom.setRoomUser2(receiveUser);
//
//		// 채팅방 메시지 모든 데이터 정보
//		model.addAttribute("chatRoom", chatRoom);
//		
//		// 채팅방, 메시지 모든 데이터 정보
//		ArrayList<ChatMessage> chatMsgList = this.usersChatMessageList(roomNo);
//		model.addAttribute("chatMsgList", chatMsgList);
		
		// 채팅 내용 정보
		return "chat/wsclient";
	}

	// 채팅방 열었을 그 당시에 채팅방 정보 로드
	// public String loadChatData(String user1, String user2, Model model) {
	// ArrayList<ChatMessage> chatMsgList = null;
	// // 1. 두명의 유저의 채팅방 번호(과거 채팅기록이 있는지)확인
	// int roomNoResult = this.checkChatRoom(user1, user2);
	// if (roomNoResult < 1) {
	// // 1-1. 두명의 유저의 채팅방 기록이 없음
	// // 1-1-1. 채팅방을 생성한다
	// int chatRoomResult = this.insertChatRoom(user1, user2);
	// if (chatRoomResult < 1) {
	// // 채팅방 번호 생성에 실패하면 에러페이지
	// return "common/errorpage";
	// }
	// }
	// // 2. 두명의 채팅 기록 내용 리스트를 불러온다.
	// int roomNo = this.chatRoomNumber(user1, user2);
	// chatMsgList = this.usersChatMessageList(roomNo);
	// model.addAttribute("chatMsgList", chatMsgList);
	//
	// return "chat/wsclient";
	// }

	// 두 유저의 채팅방 기록이 있는지 확인(없음 : 0)
	public int checkChatRoom(String user1, String user2) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setRoomUser1(user1);
		chatRoom.setRoomUser2(user2);
		int result = chatService.checkChatRoom(chatRoom);
		return result;
	}

	// 방번호에 해당하는, 채팅 기록 리스트 불러오기
	public ArrayList<ChatMessage> usersChatMessageList(int roomNo) {
		System.out.println("chatMsgList : " + chatService.selectChatMessageList(roomNo));
		return chatService.selectChatMessageList(roomNo);
	}

	// 해당 유저둘이 채팅한 기록이 있는지, 채팅방번호 db가 있는지 확인
	// 확인후 채팅방 번호 리턴
	public int chatRoomNumber(String user1, String user2) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setRoomUser1(user1);
		chatRoom.setRoomUser2(user2);
		int roomNo = chatService.selectChatRoom(chatRoom);
		return roomNo;
	}

	// 유저1, 유저2의 채팅방 기록이 없으면 채팅방을 생성한다.
	public int insertChatRoom(String user1, String user2) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setRoomUser1(user1);
		chatRoom.setRoomUser2(user2);

		System.out.println(">> 채팅방 생성 정보 : " + chatRoom.toString());

		int result = chatService.insertChatRoom(chatRoom);
		return result;
	}

	// 채팅 메시지 데이터 삽입 저장
	@RequestMapping(value = "chatMsgInsert.tc", method = RequestMethod.POST)
	public void chatMessageInsert(HttpServletResponse response, @RequestParam String sendUser,
			@RequestParam String receiveUser, @RequestParam String chatContent) {
		System.out.println("sendUser : " + sendUser);
		System.out.println("receiveUser : " + receiveUser);

		// 두 유저의 채팅방 번호를 가져온다
		int roomNo = this.chatRoomNumber(sendUser, receiveUser);
		// 메시지 객체 생성
		ChatMessage chatMsg = new ChatMessage();
		chatMsg.setSendUser(sendUser);
		chatMsg.setReceiveUser(receiveUser);
		chatMsg.setChatContent(chatContent);
		chatMsg.setRoomNo(roomNo);
		int result = chatService.insertChatMessage(chatMsg);
		System.out.println("채팅 데이터 삽입 결과 result : " + result);

		JsonObject resultObj = new JsonObject();
		resultObj.addProperty("result", result);
		try {
			PrintWriter out = response.getWriter();
			out.print(resultObj);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 채팅 저장 테스트 함수
	@RequestMapping(value = "insertTest.tc", method = RequestMethod.POST)
	public void insertTest(HttpServletRequest request, HttpServletResponse response, @RequestParam String sendUser,
			@RequestParam String receiveUser, @RequestParam String chatContent) {
		System.out.println("리퀘스트 파람 sendUser : " + sendUser);
		System.out.println("리퀘스트 파람 receiver : " + receiveUser);
		System.out.println("리퀘스트 파람 chatContent : " + chatContent);

		JsonObject obj = new JsonObject();
		obj.addProperty("result", "서버데이터");
		try {
			PrintWriter out = response.getWriter();
			out.print(obj);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// new Gson().toJson("서버데이터 gson");
	}

}
