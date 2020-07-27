package com.tc.spring.alarm.domain;

public class Alarm {

	private int alarmNo;
	private String alarmContent;
	private String sendTime;
	private String memberId;
	private String checkYN;
	private String boardTitle;
	private String boardAddress;
	
	public Alarm() {}

	public int getAlarmNo() {
		return alarmNo;
	}

	public void setAlarmNo(int alarmNo) {
		this.alarmNo = alarmNo;
	}

	public String getAlarmContent() {
		return alarmContent;
	}

	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCheckYN() {
		return checkYN;
	}

	public void setCheckYN(String checkYN) {
		this.checkYN = checkYN;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardAddress() {
		return boardAddress;
	}

	public void setBoardAddress(String boardAddress) {
		this.boardAddress = boardAddress;
	}

	@Override
	public String toString() {
		return "Alarm [alarmNo=" + alarmNo + ", alarmContent=" + alarmContent + ", sendTime=" + sendTime + ", memberId="
				+ memberId + ", checkYN=" + checkYN + ", boardTitle=" + boardTitle + ", boardAddress=" + boardAddress
				+ "]";
	}

}
