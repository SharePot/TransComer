package com.tc.spring.report.store;

import java.util.ArrayList;

import com.tc.spring.member.domain.Member;
import com.tc.spring.report.domain.BlackPageInfo;
import com.tc.spring.report.domain.Report;
import com.tc.spring.report.domain.ReportPageInfo;


public interface ReportStore {

	public int getReportListCount();
	
	public int getBlackListCount();
	
	public ArrayList<Report> selectReportList(ReportPageInfo rPi);

	public ArrayList<Member> selectBlackList(BlackPageInfo bPi);

	public int insertReport(Report report);
	
	public int updateReport(Report report);
	
	public int updateBlack(Member member);
	
	public int deleteReport(int reportNo);
}
