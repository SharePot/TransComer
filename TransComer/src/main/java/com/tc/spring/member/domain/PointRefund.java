package com.tc.spring.member.domain;

public class PointRefund {
	
	public int refundNo;
	public int refundPoint;
	public String memberId;
	public String refundYn;
	public int memberNo;
	
	public PointRefund() {}

	public PointRefund(int refundNo, int refundPoint, String memberId, String refundYn, int memberNo) {
		super();
		this.refundNo = refundNo;
		this.refundPoint = refundPoint;
		this.memberId = memberId;
		this.refundYn = refundYn;
		this.memberNo = memberNo;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "PointRefund [refundNo=" + refundNo + ", refundPoint=" + refundPoint + ", memberId=" + memberId
				+ ", refundYn=" + refundYn + ", memberNo=" + memberNo + "]";
	}
	
	

}
