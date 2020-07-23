package com.tc.spring.report.domain;

import java.sql.Date;

public class Report {

	private int reportNo;
	private String reporterMemberId;
	private String targetMemberId;
	private String reportContent;
	private Date reportDate;
	
	public Report() {}

	public Report(int reportNo, String reporterMemberId, String targetMemberId, String reportContent, Date reportDate) {
		super();
		this.reportNo = reportNo;
		this.reporterMemberId = reporterMemberId;
		this.targetMemberId = targetMemberId;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReporterMemberId() {
		return reporterMemberId;
	}

	public void setReporterMemberId(String reporterMemberId) {
		this.reporterMemberId = reporterMemberId;
	}

	public String getTargetMemberId() {
		return targetMemberId;
	}

	public void setTargetMemberId(String targetMemberId) {
		this.targetMemberId = targetMemberId;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reporterMemberId=" + reporterMemberId + ", targetMemberId="
				+ targetMemberId + ", reportContent=" + reportContent + ", reportDate=" + reportDate + "]";
	}

}
