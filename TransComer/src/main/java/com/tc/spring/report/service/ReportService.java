package com.tc.spring.report.service;

import java.util.ArrayList;

import com.tc.spring.report.domain.Report;
import com.tc.spring.report.domain.ReportPageInfo;

public interface ReportService {
	
	public ArrayList<Report> selectAlarmList(ReportPageInfo rPi);

	public int insertAlarm(Report report);
	
	public int deleteAlarm(int reportNo);


}
