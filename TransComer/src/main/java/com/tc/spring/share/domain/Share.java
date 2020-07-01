package com.tc.spring.share.domain;

import java.sql.Date;

public class Share {
	private int shareNo;
	private String memberId;
	private String shareTitle;
	private String pLanguage;
	private String tLanguage;
	private String shareContent;
	private Date sWriteDate;
	private int shareCount;
	private String shareYN;

	public Share() {
	}

	public Share(int shareNo, String memberId, String shareTitle, String pLanguage, String tLanguage,
			String shareContent, Date sWriteDate, int shareCount, String shareYN) {
		super();
		this.shareNo = shareNo;
		this.memberId = memberId;
		this.shareTitle = shareTitle;
		this.pLanguage = pLanguage;
		this.tLanguage = tLanguage;
		this.shareContent = shareContent;
		this.sWriteDate = sWriteDate;
		this.shareCount = shareCount;
		this.shareYN = shareYN;
	}

	public int getShareNo() {
		return shareNo;
	}

	public void setShareNo(int shareNo) {
		this.shareNo = shareNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getShareTitle() {
		return shareTitle;
	}

	public void setShareTitle(String shareTitle) {
		this.shareTitle = shareTitle;
	}

	public String getpLanguage() {
		return pLanguage;
	}

	public void setpLanguage(String pLanguage) {
		this.pLanguage = pLanguage;
	}

	public String gettLanguage() {
		return tLanguage;
	}

	public void settLanguage(String tLanguage) {
		this.tLanguage = tLanguage;
	}

	public String getShareContent() {
		return shareContent;
	}

	public void setShareContent(String shareContent) {
		this.shareContent = shareContent;
	}

	public Date getsWriteDate() {
		return sWriteDate;
	}

	public void setsWriteDate(Date sWriteDate) {
		this.sWriteDate = sWriteDate;
	}

	public int getShareCount() {
		return shareCount;
	}

	public void setShareCount(int shareCount) {
		this.shareCount = shareCount;
	}

	public String getShareYN() {
		return shareYN;
	}

	public void setShareYN(String shareYN) {
		this.shareYN = shareYN;
	}

	@Override
	public String toString() {
		return "Share [shareNo=" + shareNo + ", memberId=" + memberId + ", shareTitle=" + shareTitle + ", pLanguage="
				+ pLanguage + ", tLanguage=" + tLanguage + ", shareContent=" + shareContent + ", sWriteDate="
				+ sWriteDate + ", shareCount=" + shareCount + ", shareYN=" + shareYN + "]";
	}

}
