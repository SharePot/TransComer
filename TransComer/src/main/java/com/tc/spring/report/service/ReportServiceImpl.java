package com.tc.spring.report.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.tc.spring.report.domain.Report;
import com.tc.spring.report.domain.ReportPageInfo;
import com.tc.spring.report.store.ReportStore;

@Service("reportService")
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportStore reportStore;

	@Override
	public ArrayList<Report> selectAlarmList(ReportPageInfo rPi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertAlarm(Report report) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAlarm(int reportNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
