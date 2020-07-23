package com.tc.spring.alarm.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.alarm.domain.Alarm;
import com.tc.spring.alarm.domain.AlarmPageInfo;

@Repository("alarmStore")
public class AlarmStoreLogic implements AlarmStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 알람 전체 수
	@Override
	public int getArListCount() {
		return sqlSession.selectOne("alarmMapper.getArListCount");
	}
	
	@Override
	public int readAlarm(int alarmNo) {
		return sqlSession.update("alarmMapper.readAlarm", alarmNo);
	}
	
	@Override
	public int insertAlarm(Alarm alarm) {
		return sqlSession.insert("alarmMapper.insertAlarm", alarm);
	}

	@Override
	public int deleteAlarm(int alarmNo) {
		return sqlSession.delete("alarmMapper.deleteAlarm", alarmNo);
	}

	@Override
	public ArrayList<Alarm> getAlarmList(String memberId) {
		return (ArrayList)sqlSession.selectList("alarmMapper.selectAlarmList", memberId);
	}

}