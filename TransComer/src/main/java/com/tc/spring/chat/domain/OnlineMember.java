package com.tc.spring.chat.domain;

public class OnlineMember {
	private int onlineNo;
	private String memberId;
	
	public OnlineMember() {
		
	}

	public OnlineMember(int onlineNo, String memberId) {
		super();
		this.onlineNo = onlineNo;
		this.memberId = memberId;
	}

	public int getOnlineNo() {
		return onlineNo;
	}

	public void setOnlineNo(int onlineNo) {
		this.onlineNo = onlineNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "OnlineMember [onlineNo=" + onlineNo + ", memberId=" + memberId + "]";
	}

}
