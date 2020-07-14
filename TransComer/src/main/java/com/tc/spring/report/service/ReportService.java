package com.tc.spring.report.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.tc.spring.member.domain.Member;
import com.tc.spring.report.domain.BlackPageInfo;
import com.tc.spring.report.domain.Report;
import com.tc.spring.report.domain.ReportPageInfo;


public interface ReportService {
	
	public int getReportListCount();
	
	public int getBlackListCount();
	
	public ArrayList<Report> selectReportList(ReportPageInfo rPi);
	
	public ArrayList<Report> searchReportList(ReportPageInfo rPi);
	
	public ArrayList<Member> selectBlackList(BlackPageInfo bPi);

	public int insertReport(Report report, HttpServletRequest request);
	
	public int updateReport(Report report, HttpServletRequest request);
	
	public int updateBlack(Member member, HttpServletRequest request);
	
	public int deleteReport(int reportNo);


}
