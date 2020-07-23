package com.tc.spring.alarm.domain;

public class Alarm {

	private int alarmNo;
	private String alarmContent;
	private String sendTime;
	private String memberId;
	private String checkYN;
	private String etc;
	private int boardNo;
	
	public Alarm() {}

	public Alarm(int alarmNo, String alarmContent, String sendTime, String memberId, String checkYN, String etc,
			int boardNo) {
		super();
		this.alarmNo = alarmNo;
		this.alarmContent = alarmContent;
		this.sendTime = sendTime;
		this.memberId = memberId;
		this.checkYN = checkYN;
		this.etc = etc;
		this.boardNo = boardNo;
	}

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

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Alarm [alarmNo=" + alarmNo + ", alarmContent=" + alarmContent + ", sendTime=" + sendTime + ", memberId="
				+ memberId + ", checkYN=" + checkYN + ", etc=" + etc + ", boardNo=" + boardNo + "]";
	}

}
