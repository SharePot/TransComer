package com.tc.spring.personal.domain;

import java.sql.Date;

public class PersonalRequestAndResult {

	private int pReqNo;
	private String pReqWriter;
	private String pReqContent;
	private String pReqPLang;
	private String pReqTLang;
	private String pReqDetail;
	private Date pReqDate;
	private Date pReqPredice;
	private String pReqTranslator;
	private String pReqResult;

	public PersonalRequestAndResult(int pReqNo, String pReqWriter, String pReqContent, String pReqPLang,
			String pReqTLang, String pReqDetail, Date pReqDate, Date pReqPredice, String pReqTranslator,
			String pReqResult) {
		super();
		this.pReqNo = pReqNo;
		this.pReqWriter = pReqWriter;
		this.pReqContent = pReqContent;
		this.pReqPLang = pReqPLang;
		this.pReqTLang = pReqTLang;
		this.pReqDetail = pReqDetail;
		this.pReqDate = pReqDate;
		this.pReqPredice = pReqPredice;
		this.pReqTranslator = pReqTranslator;
		this.pReqResult = pReqResult;
	}

	public int getpReqNo() {
		return pReqNo;
	}

	public void setpReqNo(int pReqNo) {
		this.pReqNo = pReqNo;
	}

	public String getpReqWriter() {
		return pReqWriter;
	}

	public void setpReqWriter(String pReqWriter) {
		this.pReqWriter = pReqWriter;
	}

	public String getpReqContent() {
		return pReqContent;
	}

	public void setpReqContent(String pReqContent) {
		this.pReqContent = pReqContent;
	}

	public String getpReqPLang() {
		return pReqPLang;
	}

	public void setpReqPLang(String pReqPLang) {
		this.pReqPLang = pReqPLang;
	}

	public String getpReqTLang() {
		return pReqTLang;
	}

	public void setpReqTLang(String pReqTLang) {
		this.pReqTLang = pReqTLang;
	}

	public String getpReqDetail() {
		return pReqDetail;
	}

	public void setpReqDetail(String pReqDetail) {
		this.pReqDetail = pReqDetail;
	}

	public Date getpReqDate() {
		return pReqDate;
	}

	public void setpReqDate(Date pReqDate) {
		this.pReqDate = pReqDate;
	}

	public Date getpReqPredice() {
		return pReqPredice;
	}

	public void setpReqPredice(Date pReqPredice) {
		this.pReqPredice = pReqPredice;
	}

	public String getpReqTranslator() {
		return pReqTranslator;
	}

	public void setpReqTranslator(String pReqTranslator) {
		this.pReqTranslator = pReqTranslator;
	}

	public String getpReqResult() {
		return pReqResult;
	}

	public void setpReqResult(String pReqResult) {
		this.pReqResult = pReqResult;
	}

}
