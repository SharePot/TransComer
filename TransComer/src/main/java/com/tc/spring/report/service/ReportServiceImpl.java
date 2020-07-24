package com.tc.spring.report.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.tc.spring.member.domain.Member;
import com.tc.spring.report.domain.BlackPageInfo;
import com.tc.spring.report.domain.BlackSearch;
import com.tc.spring.report.domain.Report;
import com.tc.spring.report.domain.ReportPageInfo;
import com.tc.spring.report.domain.ReportSearch;
import com.tc.spring.report.store.ReportStore;

@Service("reportService")
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportStore reportStore;

	@Override
	public int getReportListCount() {
		return reportStore.getReportListCount();
	}
	
	@Override
	public int getBlackListCount() {
		return reportStore.getBlackListCount();
	}
	
	@Override
	public int getReportSearchListCount(ReportSearch reportSearch) {
		return reportStore.getReportSearchListCount(reportSearch);
	}
	
	@Override
	public int getBlackSearchListCount(BlackSearch blackSearch) {
		return reportStore.getBlackSearchListCount(blackSearch);
	}
	
	@Override
	public ArrayList<Report> selectReportList(ReportPageInfo rPi) {
		return reportStore.selectReportList(rPi);
	}
	
	@Override
	public ArrayList<Report> searchReportList(ReportSearch reportSearch, ReportPageInfo rPi) {
		return reportStore.searchReportList(reportSearch, rPi);
	}
	
	@Override
	public ArrayList<Member> selectBlackList(BlackPageInfo bPi) {
		return reportStore.selectBlackList(bPi);
	}
	
	@Override
	public ArrayList<Member> searchBlackList(BlackSearch blackSearch, BlackPageInfo bPi) {
		return reportStore.searchBlackList(blackSearch, bPi);
	}

	@Override
	public int insertReport(Report report) {
		return reportStore.insertReport(report);
	}

	@Override
	public int updateReport(Report report, HttpServletRequest request) {
		return reportStore.updateReport(report);
	}
	
	@Override
	public int updateBlack(Member member, HttpServletRequest request) {
		return reportStore.updateBlack(member);
	}
	
	@Override
	public int deleteReport(int reportNo) {
		return reportStore.deleteReport(reportNo);
	}
	

}
