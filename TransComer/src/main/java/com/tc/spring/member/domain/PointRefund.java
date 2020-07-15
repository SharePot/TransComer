package com.tc.spring.member.domain;

import java.sql.Date;

public class PointRefund {
	
	public int refundNo;
	public int refundPoint;
	public String memberId;
	public String refundYn;
	public Date refundRequestDate;
	public Date refundCompleteDate;
	public String accountInfo;
	
	public PointRefund() {}








	public PointRefund(int refundNo, int refundPoint, String memberId, String refundYn, Date refundRequestDate,
			Date refundCompleteDate, String accountInfo) {
		super();
		this.refundNo = refundNo;
		this.refundPoint = refundPoint;
		this.memberId = memberId;
		this.refundYn = refundYn;
		this.refundRequestDate = refundRequestDate;
		this.refundCompleteDate = refundCompleteDate;
		this.accountInfo = accountInfo;
	}








	public int getRefundNo() {
		return refundNo;
	}

	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
	}

	public int getRefundPoint() {
		return refundPoint;
	}

	public void setRefundPoint(int refundPoint) {
		this.refundPoint = refundPoint;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getRefundYn() {
		return refundYn;
	}

	public void setRefundYn(String refundYn) {
		this.refundYn = refundYn;
	}


	/**
	 * @return the refundRequestDate
	 */
	public Date getRefundRequestDate() {
		return refundRequestDate;
	}


	/**
	 * @param refundRequestDate the refundRequestDate to set
	 */
	public void setRefundRequestDate(Date refundRequestDate) {
		this.refundRequestDate = refundRequestDate;
	}


	/**
	 * @return the refundCompleteDate
	 */
	public Date getRefundCompleteDate() {
		return refundCompleteDate;
	}


	/**
	 * @param refundCompleteDate the refundCompleteDate to set
	 */
	public void setRefundCompleteDate(Date refundCompleteDate) {
		this.refundCompleteDate = refundCompleteDate;
	}


	/**
	 * @return the bank



	/**
	 * @return the account
	 */
	public String getAccountInfo() {
		return accountInfo;
	}




	/**
	 * @param account the account to set
	 */
	public void setAccountInfo(String accountInfo) {
		this.accountInfo = accountInfo;
	}








	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PointRefund [refundNo=" + refundNo + ", refundPoint=" + refundPoint + ", memberId=" + memberId
				+ ", refundYn=" + refundYn + ", refundRequestDate=" + refundRequestDate + ", refundCompleteDate="
				+ refundCompleteDate + ", accountInfo=" + accountInfo + "]";
	}





	

}
