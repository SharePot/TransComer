package com.tc.spring.alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tc.spring.alarm.service.AlarmService;

@Controller
public class AlarmController {

	@Autowired
	private AlarmService alarmService;
}
