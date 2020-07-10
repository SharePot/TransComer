package com.tc.spring.simple.domain;

import java.sql.Date;

public class SimpleResponse {
	
	private int simpleReplyNo; 			// 단순의뢰 답변 번호
	private String simpleReplyContent; 	// 단순의뢰 답변 내용
	private Date simpleReplyDate; 		// 단순의뢰 답변 작성일
	private String simpleReplyWriter; 	// 단순의뢰 답변 작성자
	private String simpleReplyDelete; 	// 단순의뢰 답변 삭제 상태
	private String simpleReplyStatus; 	// 단순의뢰 답변 채택 상태
	private int sReqNo; 				// 단순의뢰 답변 글 번호
	
	public SimpleResponse () {}

	public SimpleResponse(int simpleReplyNo, String simpleReplyContent, Date simpleReplyDate, String simpleReplyWriter,
			String simpleReplyDelete, String simpleReplyStatus, int sReqNo) {
		super();
		this.simpleReplyNo = simpleReplyNo;
		this.simpleReplyContent = simpleReplyContent;
		this.simpleReplyDate = simpleReplyDate;
		this.simpleReplyWriter = simpleReplyWriter;
		this.simpleReplyDelete = simpleReplyDelete;
		this.simpleReplyStatus = simpleReplyStatus;
		this.sReqNo = sReqNo;
	}

	public int getSimpleReplyNo() {
		return simpleReplyNo;
	}

	public void setSimpleReplyNo(int simpleReplyNo) {
		this.simpleReplyNo = simpleReplyNo;
	}

	public String getSimpleReplyContent() {
		return simpleReplyContent;
	}

	public void setSimpleReplyContent(String simpleReplyContent) {
		this.simpleReplyContent = simpleReplyContent;
	}

	public Date getSimpleReplyDate() {
		return simpleReplyDate;
	}

	public void setSimpleReplyDate(Date simpleReplyDate) {
		this.simpleReplyDate = simpleReplyDate;
	}

	public String getSimpleReplyWriter() {
		return simpleReplyWriter;
	}

	public void setSimpleReplyWriter(String simpleReplyWriter) {
		this.simpleReplyWriter = simpleReplyWriter;
	}

	public String getSimpleReplyDelete() {
		return simpleReplyDelete;
	}

	public void setSimpleReplyDelete(String simpleReplyDelete) {
		this.simpleReplyDelete = simpleReplyDelete;
	}

	public String getSimpleReplyStatus() {
		return simpleReplyStatus;
	}

	public void setSimpleReplyStatus(String simpleReplyStatus) {
		this.simpleReplyStatus = simpleReplyStatus;
	}

	public int getsReqNo() {
		return sReqNo;
	}

	public void setsReqNo(int sReqNo) {
		this.sReqNo = sReqNo;
	}

	@Override
	public String toString() {
		return "SimpleResponse [simpleReplyNo=" + simpleReplyNo + ", simpleReplyContent=" + simpleReplyContent
				+ ", simpleReplyDate=" + simpleReplyDate + ", simpleReplyWriter=" + simpleReplyWriter
				+ ", simpleReplyDelete=" + simpleReplyDelete + ", simpleReplyStatus=" + simpleReplyStatus + ", sReqNo="
				+ sReqNo + "]";
	}

	
}
