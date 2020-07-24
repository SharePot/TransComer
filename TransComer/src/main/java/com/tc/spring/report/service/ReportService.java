package com.tc.spring.report.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.tc.spring.member.domain.Member;
import com.tc.spring.report.domain.BlackPageInfo;
import com.tc.spring.report.domain.BlackSearch;
import com.tc.spring.report.domain.Report;
import com.tc.spring.report.domain.ReportPageInfo;
import com.tc.spring.report.domain.ReportSearch;


public interface ReportService {
	
	public int getReportListCount();
	
	public int getBlackListCount();
	
	public int getReportSearchListCount(ReportSearch reportSearch);
	
	public int getBlackSearchListCount(BlackSearch blackSearch);
	
	public ArrayList<Report> selectReportList(ReportPageInfo rPi);
	
	public ArrayList<Report> searchReportList(ReportSearch reportSearch, ReportPageInfo rPi);
	
	public ArrayList<Member> selectBlackList(BlackPageInfo bPi);
	
	public ArrayList<Member> searchBlackList(BlackSearch blackSearch, BlackPageInfo bPi);

	public int insertReport(Report report);
	
	public int updateReport(Report report, HttpServletRequest request);
	
	public int updateBlack(Member member, HttpServletRequest request);
	
	public int deleteReport(int reportNo);


}
