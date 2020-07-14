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
	
	// 알람 멤버별 조회
	@Override
	public Alarm selectAlarmList(int memberNo) {
		return sqlSession.selectOne("alarmMapper.selectAlarmList", memberNo);
	}
	
	@Override
	public int readAlarm(int alarmNo) {
		return sqlSession.update("alarmMapper.readAlarm", alarmNo);
	}
	
	@Override
	public int insertAlarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAlarm(int alarmNo) {
		return sqlSession.delete("alarmMapper.deleteAlarm", alarmNo);
	}


}
