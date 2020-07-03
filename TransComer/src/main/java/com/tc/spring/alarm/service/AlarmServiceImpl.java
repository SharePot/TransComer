package com.tc.spring.alarm.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.alarm.domain.Alarm;
import com.tc.spring.alarm.domain.AlarmPageInfo;
import com.tc.spring.alarm.store.AlarmStore;

@Service("alarmService")
public class AlarmServiceImpl implements AlarmService {

	@Autowired
	private AlarmStore alarmStore;

	@Override
	public ArrayList<Alarm> selectAlarmList(AlarmPageInfo aPi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertAlarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAlarm(int alarmNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
