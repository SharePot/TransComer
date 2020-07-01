package com.tc.spring.report.store;

import java.util.ArrayList;

import com.tc.spring.report.domain.Report;
import com.tc.spring.report.domain.ReportPageInfo;

public interface ReportStore {

	public ArrayList<Report> selectAlarmList(ReportPageInfo rPi);

	public int insertAlarm(Report report);
	
	public int deleteAlarm(int reportNo);
}
