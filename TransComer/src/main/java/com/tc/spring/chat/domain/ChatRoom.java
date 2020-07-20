package com.tc.spring.chat.domain;

public class ChatRoom {
	private int roomNo;
	private String roomUser1;
	private String roomUser2;
	
	public ChatRoom() {
		
	}

	public ChatRoom(int roomNo, String roomUser1, String roomUser2) {
		super();
		this.roomNo = roomNo;
		this.roomUser1 = roomUser1;
		this.roomUser2 = roomUser2;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomUser1() {
		return roomUser1;
	}

	public void setRoomUser1(String roomUser1) {
		this.roomUser1 = roomUser1;
	}

	public String getRoomUser2() {
		return roomUser2;
	}

	public void setRoomUser2(String roomUser2) {
		this.roomUser2 = roomUser2;
	}

	@Override
	public String toString() {
		return "ChatRoom [roomNo=" + roomNo + ", roomUser1=" + roomUser1 + ", roomUser2=" + roomUser2 + "]";
	}
}
