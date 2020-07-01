package com.tc.spring.chat.domain;

import java.sql.Date;

public class Chat {

	private int chatNo;
	private String requestMemId;
	private String replyMemId;
	private Date chatDate;
	private String chatFile;
	
	public Chat() {}

	public Chat(int chatNo, String requestMemId, String replyMemId, Date chatDate, String chatFile) {
		super();
		this.chatNo = chatNo;
		this.requestMemId = requestMemId;
		this.replyMemId = replyMemId;
		this.chatDate = chatDate;
		this.chatFile = chatFile;
	}

	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getRequestMemId() {
		return requestMemId;
	}
	public void setRequestMemId(String requestMemId) {
		this.requestMemId = requestMemId;
	}

	public String getReplyMemId() {
		return replyMemId;
	}
	public void setReplyMemId(String replyMemId) {
		this.replyMemId = replyMemId;
	}

	public Date getChatDate() {
		return chatDate;
	}
	public void setChatDate(Date chatDate) {
		this.chatDate = chatDate;
	}

	public String getChatFile() {
		return chatFile;
	}
	public void setChatFile(String chatFile) {
		this.chatFile = chatFile;
	}

	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", requestMemId=" + requestMemId + ", replyMemId=" + replyMemId
				+ ", chatDate=" + chatDate + ", chatFile=" + chatFile + "]";
	}
	
	
}
