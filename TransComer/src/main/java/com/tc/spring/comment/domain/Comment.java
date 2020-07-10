package com.tc.spring.comment.domain;

import java.sql.Date;

public class Comment {

	private int commentNo;
	private String memberId;
	private String commentYN;
	private String commentContent;
	private Date commentWriteDate;
	private String commentCondition;
	private int shareNo;
	private int qnaNo;
	private int studyNo;
	
	public Comment() {}

	public Comment(int commentNo, String memberId, String commentYN, String commentContent, Date commentWriteDate,
			int shareNo, int qnaNo, int studyNo,String commentCondition) {
		super();
		this.commentNo = commentNo;
		this.memberId = memberId;
		this.commentYN = commentYN;
		this.commentContent = commentContent;
		this.commentWriteDate = commentWriteDate;
		this.shareNo = shareNo;
		this.qnaNo = qnaNo;
		this.studyNo = studyNo;
		this.commentCondition=commentCondition;
	}

	/**
	 * @return the commentNo
	 */
	public int getCommentNo() {
		return commentNo;
	}

	/**
	 * @param commentNo the commentNo to set
	 */
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
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
	 * @return the commentYN
	 */
	public String getCommentYN() {
		return commentYN;
	}

	/**
	 * @param commentYN the commentYN to set
	 */
	public void setCommentYN(String commentYN) {
		this.commentYN = commentYN;
	}

	/**
	 * @return the commentContent
	 */
	public String getCommentContent() {
		return commentContent;
	}

	/**
	 * @param commentContent the commentContent to set
	 */
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	/**
	 * @return the commentWriteDate
	 */
	public Date getCommentWriteDate() {
		return commentWriteDate;
	}

	/**
	 * @param commentWriteDate the commentWriteDate to set
	 */
	public void setCommentWriteDate(Date commentWriteDate) {
		this.commentWriteDate = commentWriteDate;
	}

	/**
	 * @return the shareNo
	 */
	public int getShareNo() {
		return shareNo;
	}

	/**
	 * @param shareNo the shareNo to set
	 */
	public void setShareNo(int shareNo) {
		this.shareNo = shareNo;
	}

	/**
	 * @return the qnaNo
	 */
	public int getQnaNo() {
		return qnaNo;
	}

	/**
	 * @param qnaNo the qnaNo to set
	 */
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	/**
	 * @return the studyNo
	 */
	public int getStudyNo() {
		return studyNo;
	}

	/**
	 * @param studyNo the studyNo to set
	 */
	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	
	
	/**
	 * @return the commentCondition
	 */
	public String getCommentCondition() {
		return commentCondition;
	}

	/**
	 * @param commentCondition the commentCondition to set
	 */
	public void setCommentCondition(String commentCondition) {
		this.commentCondition = commentCondition;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", memberId=" + memberId + ", commentYN=" + commentYN
				+ ", commentContent=" + commentContent + ", commentWriteDate=" + commentWriteDate
				+ ", commentCondition=" + commentCondition + ", shareNo=" + shareNo + ", qnaNo=" + qnaNo + ", studyNo="
				+ studyNo + "]";
	}



	
}
