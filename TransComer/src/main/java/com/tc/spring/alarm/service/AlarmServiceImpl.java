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
	
	// 알람 전체 수 
	@Override
	public int getArListCount() {
		return alarmStore.getArListCount();
	}

	// 알람 읽음 처리
	@Override
	public int readAlarm(int alarmNo) {
		return alarmStore.readAlarm(alarmNo);
	}
	
	@Override
	public int insertAlarm(Alarm alarm) {
		return alarmStore.insertAlarm(alarm);
	}

	@Override
	public int deleteAlarm(int alarmNo) {
		return alarmStore.deleteAlarm(alarmNo);
	}

	@Override
	public ArrayList<Alarm> getAlarmList(String memberId) {
		return alarmStore.getAlarmList(memberId);
	}


}