package com.tc.spring.personal.domain;

import java.sql.Date;

public class Personal {

	private int personalNo;
	private String personTitle;
	private Date personalDate;
	private String personalWriter;
	private String personalPLang;
	private String personalTLang;
	private int personalSchedule;
	private int personalPrice;
	private String personalCount;
	private String personalDStatus;
	private String powerYN;

	public Personal(int personalNo, String personTitle, Date personalDate, String personalWriter, String personalPLang,
			String personalTLang, int personalSchedule, int personalPrice, String personalCount, String personalDStatus,
			String powerYN) {
		super();
		this.personalNo = personalNo;
		this.personTitle = personTitle;
		this.personalDate = personalDate;
		this.personalWriter = personalWriter;
		this.personalPLang = personalPLang;
		this.personalTLang = personalTLang;
		this.personalSchedule = personalSchedule;
		this.personalPrice = personalPrice;
		this.personalCount = personalCount;
		this.personalDStatus = personalDStatus;
		this.powerYN = powerYN;
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

	public String getPersonalWriter() {
		return personalWriter;
	}
 
	public void setPersonalWriter(String personalWriter) {
		this.personalWriter = personalWriter;
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

	public String getPersonalCount() {
		return personalCount;
	}

	public void setPersonalCount(String personalCount) {
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

	@Override
	public String toString() {
		return "Personal [personalNo=" + personalNo + ", personTitle=" + personTitle + ", personalDate=" + personalDate
				+ ", personalWriter=" + personalWriter + ", personalPLang=" + personalPLang + ", personalTLang="
				+ personalTLang + ", personalSchedule=" + personalSchedule + ", personalPrice=" + personalPrice
				+ ", personalCount=" + personalCount + ", personalDStatus=" + personalDStatus + ", powerYN=" + powerYN
				+ "]";
	}

}
