package com.tc.spring.alarm.store;

import java.util.ArrayList;

import com.tc.spring.alarm.domain.Alarm;
import com.tc.spring.alarm.domain.AlarmPageInfo;

public interface AlarmStore {

	public Alarm selectAlarmList(int memberNo);
	
	public int readAlarm (int alarmNo);

	public int insertAlarm(Alarm alarm);
	
	public int deleteAlarm(int alarmNo);
	
	public int getArListCount();
	
}
