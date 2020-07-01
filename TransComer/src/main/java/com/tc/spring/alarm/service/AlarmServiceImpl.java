package com.tc.spring.alarm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.alarm.store.AlarmStore;

@Service("alarmService")
public class AlarmServiceImpl {

	@Autowired
	private AlarmStore alarmStore;
}
