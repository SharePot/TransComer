package com.tc.spring.alarm.domain;

import java.sql.Date;

public class Alarm {

	private int alarmNo;
	private String alarmContent;
	private Date sendTime;
	private String memberId;
	private String checkYN;
	
	public Alarm() {}

	public Alarm(int alarmNo, String alarmContent, Date sendTime, String memberId, String checkYN) {
		super();
		this.alarmNo = alarmNo;
		this.alarmContent = alarmContent;
		this.sendTime = sendTime;
		this.memberId = memberId;
		this.checkYN = checkYN;
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

	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
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

	@Override
	public String toString() {
		return "Alarm [alarmNo=" + alarmNo + ", alarmContent=" + alarmContent + ", sendTime=" + sendTime + ", memberId="
				+ memberId + ", checkYN=" + checkYN + "]";
	}
	
}
