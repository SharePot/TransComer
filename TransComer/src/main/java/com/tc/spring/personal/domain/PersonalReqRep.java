package com.tc.spring.personal.domain;

import java.sql.Date;

public class PersonalReqRep {
	
	private int pReqNo;
	private String pReqContent;
	private String pReqPLang;
	private String pReqTLang;
	private String pReqDetail;
	private Date pReqDate;
	private Date pReqPredict;
	private String pRepTranslator;
	private String pRepResult;
	private int pReqPrice;
	private String pReqAccept;
	private String pReqCheckBuy;
	private int personalNo;
	private String memberId;

	public PersonalReqRep() {}

	public PersonalReqRep(int pReqNo, String pReqContent, String pReqPLang, String pReqTLang, String pReqDetail,
			Date pReqDate, Date pReqPredict, String pRepTranslator, String pRepResult, int pReqPrice, String pReqAccept,
			String pReqCheckBuy, int personalNo, String memberId) {
		super();
		this.pReqNo = pReqNo;
		this.pReqContent = pReqContent;
		this.pReqPLang = pReqPLang;
		this.pReqTLang = pReqTLang;
		this.pReqDetail = pReqDetail;
		this.pReqDate = pReqDate;
		this.pReqPredict = pReqPredict;
		this.pRepTranslator = pRepTranslator;
		this.pRepResult = pRepResult;
		this.pReqPrice = pReqPrice;
		this.pReqAccept = pReqAccept;
		this.pReqCheckBuy = pReqCheckBuy;
		this.personalNo = personalNo;
		this.memberId = memberId;
	}

	public int getpReqNo() {
		return pReqNo;
	}

	public void setpReqNo(int pReqNo) {
		this.pReqNo = pReqNo;
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

	public Date getpReqPredict() {
		return pReqPredict;
	}

	public void setpReqPredict(Date pReqPredict) {
		this.pReqPredict = pReqPredict;
	}

	public String getpRepTranslator() {
		return pRepTranslator;
	}

	public void setpRepTranslator(String pRepTranslator) {
		this.pRepTranslator = pRepTranslator;
	}

	public String getpRepResult() {
		return pRepResult;
	}

	public void setpRepResult(String pRepResult) {
		this.pRepResult = pRepResult;
	}

	public int getpReqPrice() {
		return pReqPrice;
	}

	public void setpReqPrice(int pReqPrice) {
		this.pReqPrice = pReqPrice;
	}

	public String getpReqAccept() {
		return pReqAccept;
	}

	public void setpReqAccept(String pReqAccept) {
		this.pReqAccept = pReqAccept;
	}

	public String getpReqCheckBuy() {
		return pReqCheckBuy;
	}

	public void setpReqCheckBuy(String pReqCheckBuy) {
		this.pReqCheckBuy = pReqCheckBuy;
	}

	public int getPersonalNo() {
		return personalNo;
	}

	public void setPersonalNo(int personalNo) {
		this.personalNo = personalNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "PersonalReqRep [pReqNo=" + pReqNo + ", pReqContent=" + pReqContent + ", pReqPLang=" + pReqPLang
				+ ", pReqTLang=" + pReqTLang + ", pReqDetail=" + pReqDetail + ", pReqDate=" + pReqDate
				+ ", pReqPredict=" + pReqPredict + ", pRepTranslator=" + pRepTranslator + ", pRepResult=" + pRepResult
				+ ", pReqPrice=" + pReqPrice + ", pReqAccept=" + pReqAccept + ", pReqCheckBuy=" + pReqCheckBuy
				+ ", personalNo=" + personalNo + ", memberId=" + memberId + "]";
	}

	
}
