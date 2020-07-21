package com.tc.spring.member.domain;

import java.sql.Date;

public class PointChange {
	
	public int pointNo;
	public String memberId;
	public Date pointUpdateDate;
	public int pointAmount;
	public String pointContent;
	public String pointStatus;
	
	public PointChange() {}


	public PointChange(int pointNo, String memberId, Date pointUpdateDate, int pointAmount, String pointContent,
			String pointStatus) {
		super();
		this.pointNo = pointNo;
		this.memberId = memberId;
		this.pointUpdateDate = pointUpdateDate;
		this.pointAmount = pointAmount;
		this.pointContent = pointContent;
		this.pointStatus = pointStatus;
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



	/**
	 * @return the pointStatus
	 */
	public String getPointStatus() {
		return pointStatus;
	}






	/**
	 * @param pointStatus the pointStatus to set
	 */
	public void setPointStatus(String pointStatus) {
		this.pointStatus = pointStatus;
	}






	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PointChange [pointNo=" + pointNo + ", memberId=" + memberId + ", pointUpdateDate=" + pointUpdateDate
				+ ", pointAmount=" + pointAmount + ", pointContent=" + pointContent + ", pointStatus=" + pointStatus
				+ "]";
	}








	

}
