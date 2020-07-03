package com.tc.spring.alarm.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.alarm.domain.Alarm;
import com.tc.spring.alarm.domain.AlarmPageInfo;

@Repository("alarmStore")
public class AlarmStoreLogic implements AlarmStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

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
