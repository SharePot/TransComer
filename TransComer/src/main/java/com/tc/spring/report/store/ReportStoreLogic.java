package com.tc.spring.report.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.report.domain.Report;
import com.tc.spring.report.domain.ReportPageInfo;

@Repository("reportStore")
public class ReportStoreLogic implements ReportStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

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
