package com.tc.spring.qna.domain;

import java.sql.Date;

public class Qna {

	private int qnaNo;
	private String memberId;
	private String qnaCategory;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaWriteDate;
	private int qnaCount;
	
	public Qna() {}

	public Qna(int qnaNo, String memberId, String qnaCategory, String qnaTiitle, String qnaContent, Date qnaWriteDate,
			int qnaCount) {
		super();
		this.qnaNo = qnaNo;
		this.memberId = memberId;
		this.qnaCategory = qnaCategory;
		this.qnaTitle = qnaTiitle;
		this.qnaContent = qnaContent;
		this.qnaWriteDate = qnaWriteDate;
		this.qnaCount = qnaCount;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}

	public String getQnaTiitle() {
		return qnaTitle;
	}

	public void setQnaTiitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQnaWriteDate() {
		return qnaWriteDate;
	}

	public void setQnaWriteDate(Date qnaWriteDate) {
		this.qnaWriteDate = qnaWriteDate;
	}

	public int getQnaCount() {
		return qnaCount;
	}

	public void setQnaCount(int qnaCount) {
		this.qnaCount = qnaCount;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", memberId=" + memberId + ", qnaCategory=" + qnaCategory + ", qnaTitle="
				+ qnaTitle + ", qnaContent=" + qnaContent + ", qnaWriteDate=" + qnaWriteDate + ", qnaCount=" + qnaCount
				+ "]";
	}

	
	
}
