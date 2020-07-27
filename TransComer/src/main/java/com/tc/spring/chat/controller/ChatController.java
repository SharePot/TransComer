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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.tc.spring.chat.domain.ChatMessage;
import com.tc.spring.chat.domain.ChatRoom;
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

	// 채팅 기록 리스트 불러오기
	@RequestMapping("chatMsgList.kh")
	public String usersChatMessageList(String user1, String user2, Model model) {
		int roomNo = this.chatRoomNumber("admin", "user03");
		ArrayList<ChatMessage> chatMsgList = chatService.selectChatMessageList(roomNo);
		System.out.println("chatMsgList : " + chatMsgList);

		model.addAttribute("chatMsgList", chatMsgList);
		return "chat/wsclient";
	}

	// 해당 유저둘이 채팅한 기록이 있는지/채팅방번호 db가 있는지 확인
	@RequestMapping("checkChatRoom.kh")
	@ResponseBody
	public int chekChatRoomNumber(String user1, String user2) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setRoomUser1(user1);
		chatRoom.setRoomUser2(user2);
		//
		chatRoom.setRoomUser1("admin");
		chatRoom.setRoomUser2("user03");
		int roomNo = chatService.selectChatRoom(chatRoom);
		if (roomNo > 0) {
			// 채팅방 번호 데이터가 있음
			System.out.println("roomNo : " + roomNo);
		} else {
			// 채팅방 번호 데이터가 없음 - 디비없음
			System.out.println("roomNo : " + roomNo);
		}
		return roomNo;
	}

	// 유저1, 유저2의 채팅방 기록이 없으면 채팅방을 생성한다.

	public int chatRoomInsert(String user1, String user2) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setRoomUser1(user1);
		chatRoom.setRoomUser2(user2);

		int result = chatService.insertChatRoom(chatRoom);
		if (result > 0) {

		} else {

		}
		return 0;
	}

	// 채팅 방 번호 리턴
	public int chatRoomNumber(String user1, String user2) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setRoomUser1(user1);
		chatRoom.setRoomUser2(user2);
		int roomNo = chatService.selectChatRoom(chatRoom);
		return roomNo;
	}

	// 채팅 데이터 삽입
	@RequestMapping(value = "chatMsgInsert.kh", method = RequestMethod.POST)
	public void chatMessageInsert(HttpServletResponse response, @RequestParam String sendUser,
			@RequestParam String receiveUser, @RequestParam String chatContent) {
		int roomNo = this.chatRoomNumber(sendUser, receiveUser);
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

	@RequestMapping(value = "insertTest.kh", method = RequestMethod.POST)
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
