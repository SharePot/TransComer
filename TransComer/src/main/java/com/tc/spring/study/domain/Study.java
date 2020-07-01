package com.tc.spring.study.domain;

import java.sql.Date;

public class Study {
	private int studyNo;
	private String memberId;
	private String studyCategory;
	private String studyTitle;
	private String studyContent;
	private Date studyWriteDate;
	private int studyCount;

	public Study() {

	}

	public Study(int studyNo, String memberId, String studyCategory, String studyTitle, String studyContent,
			Date studyWriteDate, int studyCount) {
		super();
		this.studyNo = studyNo;
		this.memberId = memberId;
		this.studyCategory = studyCategory;
		this.studyTitle = studyTitle;
		this.studyContent = studyContent;
		this.studyWriteDate = studyWriteDate;
		this.studyCount = studyCount;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getStudyCategory() {
		return studyCategory;
	}

	public void setStudyCategory(String studyCategory) {
		this.studyCategory = studyCategory;
	}

	public String getStudyTitle() {
		return studyTitle;
	}

	public void setStudyTitle(String studyTitle) {
		this.studyTitle = studyTitle;
	}

	public String getStudyContent() {
		return studyContent;
	}

	public void setStudyContent(String studyContent) {
		this.studyContent = studyContent;
	}

	public Date getStudyWriteDate() {
		return studyWriteDate;
	}

	public void setStudyWriteDate(Date studyWriteDate) {
		this.studyWriteDate = studyWriteDate;
	}

	public int getStudyCount() {
		return studyCount;
	}

	public void setStudyCount(int studyCount) {
		this.studyCount = studyCount;
	}

	@Override
	public String toString() {
		return "Study [studyNo=" + studyNo + ", memberId=" + memberId + ", studyCategory=" + studyCategory
				+ ", studyTitle=" + studyTitle + ", studyContent=" + studyContent + ", studyWriteDate=" + studyWriteDate
				+ ", studyCount=" + studyCount + "]";
	}
}
