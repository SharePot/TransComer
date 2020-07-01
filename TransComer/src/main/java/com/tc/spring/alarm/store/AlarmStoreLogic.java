package com.tc.spring.alarm.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("alarmStore")
public class AlarmStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
