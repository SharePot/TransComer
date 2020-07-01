package com.tc.spring.comment.domain;

import java.sql.Date;

public class Comment {

	private int commentNo;
	private String memberId;
	private String commentYN;
	private String commentContent;
	private Date commentWriteDate;
	private int ShareNo;
	private int qnaNo;
	private int studyNo;
	
	public Comment() {}

	public Comment(int commentNo, String memberId, String commentYN, String commentContent, Date commentWriteDate,
			int shareNo, int qnaNo, int studyNo) {
		super();
		this.commentNo = commentNo;
		this.memberId = memberId;
		this.commentYN = commentYN;
		this.commentContent = commentContent;
		this.commentWriteDate = commentWriteDate;
		ShareNo = shareNo;
		this.qnaNo = qnaNo;
		this.studyNo = studyNo;
	}

	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCommentYN() {
		return commentYN;
	}
	public void setCommentYN(String commentYN) {
		this.commentYN = commentYN;
	}

	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentWriteDate() {
		return commentWriteDate;
	}
	public void setCommentWriteDate(Date commentWriteDate) {
		this.commentWriteDate = commentWriteDate;
	}

	public int getShareNo() {
		return ShareNo;
	}
	public void setShareNo(int shareNo) {
		ShareNo = shareNo;
	}

	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getStudyNo() {
		return studyNo;
	}
	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", memberId=" + memberId + ", commentYN=" + commentYN
				+ ", commentContent=" + commentContent + ", commentWriteDate=" + commentWriteDate + ", ShareNo="
				+ ShareNo + ", qnaNo=" + qnaNo + ", studyNo=" + studyNo + "]";
	}
	
}
