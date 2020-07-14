package com.tc.spring.personal.domain;

import java.sql.Date;

public class Personal {

	private int personalNo;
	private String personalTitle;
	private String personalContent;
	private Date personalDate;
	private String personalPLang;
	private String personalTLang;
	private int personalSchedule;
	private int personalPrice;
	private int personalCount;
	private String personalDStatus;
	private String powerYN;
	private String memberId;

	public Personal() {

	}

	public Personal(int personalNo, String personalTitle, String personalContent, Date personalDate,
			String personalPLang, String personalTLang, int personalSchedule, int personalPrice, int personalCount,
			String personalDStatus, String powerYN, String memberId) {
		super();
		this.personalNo = personalNo;
		this.personalTitle = personalTitle;
		this.personalContent = personalContent;
		this.personalDate = personalDate;
		this.personalPLang = personalPLang;
		this.personalTLang = personalTLang;
		this.personalSchedule = personalSchedule;
		this.personalPrice = personalPrice;
		this.personalCount = personalCount;
		this.personalDStatus = personalDStatus;
		this.powerYN = powerYN;
		this.memberId = memberId;
	}

	public int getPersonalNo() {
		return personalNo;
	}

	public void setPersonalNo(int personalNo) {
		this.personalNo = personalNo;
	}

	public String getPersonalTitle() {
		return personalTitle;
	}

	public void setPersonalTitle(String personalTitle) {
		this.personalTitle = personalTitle;
	}

	public String getPersonalContent() {
		return personalContent;
	}

	public void setPersonalContent(String personalContent) {
		this.personalContent = personalContent;
	}

	public Date getPersonalDate() {
		return personalDate;
	}

	public void setPersonalDate(Date personalDate) {
		this.personalDate = personalDate;
	}

	public String getPersonalPLang() {
		return personalPLang;
	}

	public void setPersonalPLang(String personalPLang) {
		this.personalPLang = personalPLang;
	}

	public String getPersonalTLang() {
		return personalTLang;
	}

	public void setPersonalTLang(String personalTLang) {
		this.personalTLang = personalTLang;
	}

	public int getPersonalSchedule() {
		return personalSchedule;
	}

	public void setPersonalSchedule(int personalSchedule) {
		this.personalSchedule = personalSchedule;
	}

	public int getPersonalPrice() {
		return personalPrice;
	}

	public void setPersonalPrice(int personalPrice) {
		this.personalPrice = personalPrice;
	}

	public int getPersonalCount() {
		return personalCount;
	}

	public void setPersonalCount(int personalCount) {
		this.personalCount = personalCount;
	}

	public String getPersonalDStatus() {
		return personalDStatus;
	}

	public void setPersonalDStatus(String personalDStatus) {
		this.personalDStatus = personalDStatus;
	}

	public String getPowerYN() {
		return powerYN;
	}

	public void setPowerYN(String powerYN) {
		this.powerYN = powerYN;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Personal [personalNo=" + personalNo + ", personalTitle=" + personalTitle + ", personalContent="
				+ personalContent + ", personalDate=" + personalDate + ", personalPLang=" + personalPLang
				+ ", personalTLang=" + personalTLang + ", personalSchedule=" + personalSchedule + ", personalPrice="
				+ personalPrice + ", personalCount=" + personalCount + ", personalDStatus=" + personalDStatus
				+ ", powerYN=" + powerYN + ", memberId=" + memberId + "]";
	}

}
