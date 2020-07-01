package com.tc.spring.alarm.service;

import java.util.ArrayList;

import com.tc.spring.alarm.domain.Alarm;
import com.tc.spring.alarm.domain.AlarmPageInfo;

public interface AlarmService {
	
	public ArrayList<Alarm> selectAlarmList(AlarmPageInfo aPi);

	public int insertAlarm(Alarm alarm);
	
	public int deleteAlarm(int alarmNo);
	
}
