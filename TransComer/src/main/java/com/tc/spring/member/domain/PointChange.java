package com.tc.spring.member.domain;

import java.sql.Date;

public class PointChange {
	
	public int pointNo;
	public String memberId;
	public Date pointUpdateDate;
	public int pointAmount;
	public String pointContent;
	
	public PointChange() {}



	public PointChange(int pointNo, String memberId, Date pointUpdateDate, int pointAmount, String pointContent) {
		super();
		this.pointNo = pointNo;
		this.memberId = memberId;
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



	/**
	 * @return the memberId
	 */
	public String getMemberId() {
		return memberId;
	}



	/**
	 * @param memberId the memberId to set
	 */
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PointChange [pointNo=" + pointNo + ", memberId=" + memberId + ", pointUpdateDate=" + pointUpdateDate
				+ ", pointAmount=" + pointAmount + ", pointContent=" + pointContent + "]";
	}


	

}
