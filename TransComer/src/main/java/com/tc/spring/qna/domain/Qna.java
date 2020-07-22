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
	private int commentCount;
	
	public Qna() {}

	public Qna(int qnaNo, String memberId, String qnaCategory, String qnaTitle, String qnaContent, Date qnaWriteDate,
			int qnaCount, int commentCount) {
		super();
		this.qnaNo = qnaNo;
		this.memberId = memberId;
		this.qnaCategory = qnaCategory;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWriteDate = qnaWriteDate;
		this.qnaCount = qnaCount;
		this.commentCount = commentCount;
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

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
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

	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", memberId=" + memberId + ", qnaCategory=" + qnaCategory + ", qnaTitle="
				+ qnaTitle + ", qnaContent=" + qnaContent + ", qnaWriteDate=" + qnaWriteDate + ", qnaCount=" + qnaCount
				+ ", commentCount=" + commentCount + "]";
	}
	
}
