package com.tc.spring.review.domain;

import java.sql.Date;

public class Review {

	private int reviewNo;
	private String revWriteMemberId;
	private String revTargetMemberId;
	private String revContent;
	private int starRage;
	private Date revWriteDate;
	private int personalNo;
	
	public Review() {}

	public Review(int reviewNo, String revWriteMemberId, String revTargetMemberId, String revContent, int starRage,
			Date revWriteDate, int personalNo) {
		super();
		this.reviewNo = reviewNo;
		this.revWriteMemberId = revWriteMemberId;
		this.revTargetMemberId = revTargetMemberId;
		this.revContent = revContent;
		this.starRage = starRage;
		this.revWriteDate = revWriteDate;
		this.personalNo = personalNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getRevWriteMemberId() {
		return revWriteMemberId;
	}

	public void setRevWriteMemberId(String revWriteMemberId) {
		this.revWriteMemberId = revWriteMemberId;
	}

	public String getRevTargetMemberId() {
		return revTargetMemberId;
	}

	public void setRevTargetMemberId(String revTargetMemberId) {
		this.revTargetMemberId = revTargetMemberId;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public int getStarRage() {
		return starRage;
	}

	public void setStarRage(int starRage) {
		this.starRage = starRage;
	}

	public Date getRevWriteDate() {
		return revWriteDate;
	}

	public void setRevWriteDate(Date revWriteDate) {
		this.revWriteDate = revWriteDate;
	}

	public int getPersonalNo() {
		return personalNo;
	}

	public void setPersonalNo(int personalNo) {
		this.personalNo = personalNo;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", revWriteMemberId=" + revWriteMemberId + ", revTargetMemberId="
				+ revTargetMemberId + ", revContent=" + revContent + ", starRage=" + starRage + ", revWriteDate="
				+ revWriteDate + ", personalNo=" + personalNo + "]";
	}
	
	
}
