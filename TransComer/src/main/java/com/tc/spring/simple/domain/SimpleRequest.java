package com.tc.spring.simple.domain;

import java.sql.Date;

public class SimpleRequest {
	
	private int simpleNo; 			// 단순의뢰 질문 번호
	private String simpleTitle; 	// 단순의뢰 질문 제목
	private String simpleContent; 	// 단순의뢰 질문 내용
	private Date simpleDate; 		// 단순의뢰 질문 작성일
	private String simpleWriter; 	// 단순의뢰 질문 작성자 회원 아이디
	private String simplePLang; 	// 단순의뢰 질문 개발언어
	private String simpleTLang; 	// 단순의뢰 질문 사용언어
	private String simpleCount; 	// 단순의뢰 질문 조회수
	private String simpleDStatus; 	// 단순의뢰 질문 삭제 상태
	
	public SimpleRequest () {}
	
	public SimpleRequest(int simpleNo, String simpleTitle, String simpleContent, Date simpleDate, String simpleWriter,
			String simplePLang, String simpleTLang, String simpleCount, String simpleDStatus) {
		super();
		this.simpleNo = simpleNo;
		this.simpleTitle = simpleTitle;
		this.simpleContent = simpleContent;
		this.simpleDate = simpleDate;
		this.simpleWriter = simpleWriter;
		this.simplePLang = simplePLang;
		this.simpleTLang = simpleTLang;
		this.simpleCount = simpleCount;
		this.simpleDStatus = simpleDStatus;
	}

	public int getSimpleNo() {
		return simpleNo;
	}

	public void setSimpleNo(int simpleNo) {
		this.simpleNo = simpleNo;
	}

	public String getSimpleTitle() {
		return simpleTitle;
	}

	public void setSimpleTitle(String simpleTitle) {
		this.simpleTitle = simpleTitle;
	}

	public String getSimpleContent() {
		return simpleContent;
	}

	public void setSimpleContent(String simpleContent) {
		this.simpleContent = simpleContent;
	}

	public Date getSimpleDate() {
		return simpleDate;
	}

	public void setSimpleDate(Date simpleDate) {
		this.simpleDate = simpleDate;
	}

	public String getSimpleWriter() {
		return simpleWriter;
	}

	public void setSimpleWriter(String simpleWriter) {
		this.simpleWriter = simpleWriter;
	}

	public String getSimplePLang() {
		return simplePLang;
	}

	public void setSimplePLang(String simplePLang) {
		this.simplePLang = simplePLang;
	}

	public String getSimpleTLang() {
		return simpleTLang;
	}

	public void setSimpleTLang(String simpleTLang) {
		this.simpleTLang = simpleTLang;
	}

	public String getSimpleCount() {
		return simpleCount;
	}

	public void setSimpleCount(String simpleCount) {
		this.simpleCount = simpleCount;
	}

	public String getSimpleDStatus() {
		return simpleDStatus;
	}

	public void setSimpleDStatus(String simpleDStatus) {
		this.simpleDStatus = simpleDStatus;
	}

	@Override
	public String toString() {
		return "SimpleRequest [simpleNo=" + simpleNo + ", simpleTitle=" + simpleTitle + ", simpleContent="
				+ simpleContent + ", simpleDate=" + simpleDate + ", simpleWriter=" + simpleWriter + ", simplePLang="
				+ simplePLang + ", simpleTLang=" + simpleTLang + ", simpleCount=" + simpleCount + ", simpleDStatus="
				+ simpleDStatus + "]";
	}
	
}
