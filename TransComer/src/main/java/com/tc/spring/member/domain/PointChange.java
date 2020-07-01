package com.tc.spring.member.domain;

import java.sql.Date;

public class PointChange {
	
	public int pointNo;
	public int memberNo;
	public Date pointUpdateDate;
	public int pointAmount;
	public String pointContent;
	
	public PointChange() {}

	public PointChange(int pointNo, int memberNo, Date pointUpdateDate, int pointAmount, String pointContent) {
		super();
		this.pointNo = pointNo;
		this.memberNo = memberNo;
		this.pointUpdateDate = pointUpdateDate;
		this.pointAmount = pointAmount;
		this.pointContent = pointContent;
	}

	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Date getPointUpdateDate() {
		return pointUpdateDate;
	}

	public void setPointUpdateDate(Date pointUpdateDate) {
		this.pointUpdateDate = pointUpdateDate;
	}

	public int getPointAmount() {
		return pointAmount;
	}

	public void setPointAmount(int pointAmount) {
		this.pointAmount = pointAmount;
	}

	public String getPointContent() {
		return pointContent;
	}

	public void setPointContent(String pointContent) {
		this.pointContent = pointContent;
	}

	@Override
	public String toString() {
		return "PointChange [pointNo=" + pointNo + ", memberNo=" + memberNo + ", pointUpdateDate=" + pointUpdateDate
				+ ", pointAmount=" + pointAmount + ", pointContent=" + pointContent + "]";
	}
	
	

}
