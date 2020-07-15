package com.tc.spring.alarm.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.tc.spring.alarm.domain.Alarm;
import com.tc.spring.alarm.domain.AlarmPageInfo;
import com.tc.spring.alarm.service.AlarmService;
import com.tc.spring.common.Pagination;
import com.tc.spring.simple.domain.SimpleResponse;

@Controller
public class AlarmController {

	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping("alarmList.tc")
	public void getAlarmList(HttpServletResponse response, String memberId) throws JsonIOException, IOException {
		
		ArrayList<Alarm> alarmList = alarmService.getAlarmList(memberId);

		
		for (Alarm alarm : alarmList) {
			alarm.setAlarmContent(URLEncoder.encode(alarm.getAlarmContent(), "utf-8"));
		}

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(alarmList, response.getWriter());
		
	}
	
	/*
	 * public ModelAndView selectAlarmList(ModelAndView
	 * mv, @RequestParam(value="page", required=false)Integer page) {
	 * 
	 * int arCurrentPage = (page != null) ? page : 1; int arListCount =
	 * alarmService.getArListCount(); AlarmPageInfo aPi =
	 * Pagination.getAlarmPageInfo(arCurrentPage, arListCount); ArrayList<Alarm>
	 * arList = alarmService.selectAlarmList(aPi);
	 * 
	 * if (!arList.isEmpty()) { mv.addObject("aPi", aPi); mv.addObject("arList",
	 * arList); mv.setViewName("alarm/alarmList"); } else {
	 * mv.setViewName("common/errorPage"); }
	 * 
	 * return mv; }
	 */
	
	@RequestMapping("alarmView.tc")
	public String alarmView() {
		return "alarm/alarmList";
	}
	
	public String insertAlarm(Alarm alarm, Model model,  HttpServletRequest request) {
		return null;
	}
	
	@RequestMapping("deleteAlarm.tc")
	public String deleteAlarm(int alarmNo, RedirectAttributes rd) {
		int result = alarmService.deleteAlarm(alarmNo);
		
		if (result > 0) {
			rd.addFlashAttribute("msg", "알람이 삭제되었습니다.");
			return "redirect:alarmList.tc";
		} else {
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("readAlarm.tc")
	public String readAlarm(int alarmNo) {
		
		int result = alarmService.readAlarm(alarmNo);
		
		if (result > 0) {
			return "redirect:alarmList.tc";
		} else {
			return "common/errorPage";
		}
		
		
	}
	
	
}