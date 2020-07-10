package com.tc.spring.personal.domain;

import java.sql.Date;

public class Personal {

	private int personalNo;
	private String personTitle;
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

	public Personal(int personalNo, String personTitle, Date personalDate, String personalContent, String personalPLang,
			String personalTLang, int personalSchedule, int personalPrice, int personalCount, String personalDStatus,
			String powerYN, String memberId) {
		super();
		this.personalNo = personalNo;
		this.personTitle = personTitle;
		this.personalDate = personalDate;
		this.personalContent = personalContent;
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

	public String getPersonTitle() {
		return personTitle;
	}

	public void setPersonTitle(String personTitle) {
		this.personTitle = personTitle;
	}

	public Date getPersonalDate() {
		return personalDate;
	}

	public void setPersonalDate(Date personalDate) {
		this.personalDate = personalDate;
	}

	public String getPersonalContent() {
		return personalContent;
	}

	public void setPersonalContent(String personalContent) {
		this.personalContent = personalContent;
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
		return "Personal [personalNo=" + personalNo + ", personTitle=" + personTitle + ", personalDate=" + personalDate
				+ ", personalContent=" + personalContent + ", personalPLang=" + personalPLang + ", personalTLang="
				+ personalTLang + ", personalSchedule=" + personalSchedule + ", personalPrice=" + personalPrice
				+ ", personalCount=" + personalCount + ", personalDStatus=" + personalDStatus + ", powerYN=" + powerYN
				+ ", memberId=" + memberId + "]";
	}

}
