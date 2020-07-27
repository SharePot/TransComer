package com.tc.spring.chat.domain;

public class ChatMessage {
	private int chatMessageNo;
	private String sendUser;
	private String receiveUser;
	private String chatContent;
	private String chatSendDate;
	private int roomNo;

	public ChatMessage() {
	}

	public ChatMessage(int chatMessageNo, String sendUser, String receiveUser, String chatContent, String chatSendDate,
			int roomNo) {
		super();
		this.chatMessageNo = chatMessageNo;
		this.sendUser = sendUser;
		this.receiveUser = receiveUser;
		this.chatContent = chatContent;
		this.chatSendDate = chatSendDate;
		this.roomNo = roomNo;
	}

	public int getChatMessageNo() {
		return chatMessageNo;
	}

	public void setChatMessageNo(int chatMessageNo) {
		this.chatMessageNo = chatMessageNo;
	}

	public String getSendUser() {
		return sendUser;
	}

	public void setSendUser(String sendUser) {
		this.sendUser = sendUser;
	}

	public String getReceiveUser() {
		return receiveUser;
	}

	public void setReceiveUser(String receiveUser) {
		this.receiveUser = receiveUser;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public String getChatSendDate() {
		return chatSendDate;
	}

	public void setChatSendDate(String chatSendDate) {
		this.chatSendDate = chatSendDate;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	@Override
	public String toString() {
		return "ChatMessage [chatMessageNo=" + chatMessageNo + ", sendUser=" + sendUser + ", receiveUser=" + receiveUser
				+ ", chatContent=" + chatContent + ", chatSendDate=" + chatSendDate + ", roomNo=" + roomNo + "]";
	}

}
