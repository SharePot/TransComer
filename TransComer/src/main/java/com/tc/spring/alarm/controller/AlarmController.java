package com.tc.spring.alarm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.alarm.domain.Alarm;
import com.tc.spring.alarm.service.AlarmService;

@Controller
public class AlarmController {

	@Autowired
	private AlarmService alarmService;
	
	public ModelAndView selectAlarmList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		return mv;
	}
	
	public String insertAlarm(Alarm alarm, Model model,  HttpServletRequest request) {
		return null;
	}
	
	public String deleteAlarm(int alarmNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
		return null;
	}
	
}
