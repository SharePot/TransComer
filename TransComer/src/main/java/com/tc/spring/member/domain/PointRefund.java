package com.tc.spring.member.domain;

import java.sql.Date;

public class PointRefund {
	
	public int refundNo;
	public int refundPoint;
	public String memberId;
	public String refundYn;
	public Date refundRequestDate;
	public Date refundCompleteDate;
	public String bank;
	public String accountOwner;
	public int account;
	
	public PointRefund() {}




	public PointRefund(int refundNo, int refundPoint, String memberId, String refundYn, Date refundRequestDate,
			Date refundCompleteDate, String bank, String accountOwner, int account) {
		super();
		this.refundNo = refundNo;
		this.refundPoint = refundPoint;
		this.memberId = memberId;
		this.refundYn = refundYn;
		this.refundRequestDate = refundRequestDate;
		this.refundCompleteDate = refundCompleteDate;
		this.bank = bank;
		this.accountOwner = accountOwner;
		this.account = account;
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
	 */
	public String getBank() {
		return bank;
	}




	/**
	 * @param bank the bank to set
	 */
	public void setBank(String bank) {
		this.bank = bank;
	}




	/**
	 * @return the accountOwner
	 */
	public String getAccountOwner() {
		return accountOwner;
	}




	/**
	 * @param accountOwner the accountOwner to set
	 */
	public void setAccountOwner(String accountOwner) {
		this.accountOwner = accountOwner;
	}




	/**
	 * @return the account
	 */
	public int getAccount() {
		return account;
	}




	/**
	 * @param account the account to set
	 */
	public void setAccount(int account) {
		this.account = account;
	}




	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PointRefund [refundNo=" + refundNo + ", refundPoint=" + refundPoint + ", memberId=" + memberId
				+ ", refundYn=" + refundYn + ", refundRequestDate=" + refundRequestDate + ", refundCompleteDate="
				+ refundCompleteDate + ", bank=" + bank + ", accountOwner=" + accountOwner + ", account=" + account
				+ "]";
	}




	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	
	

}
