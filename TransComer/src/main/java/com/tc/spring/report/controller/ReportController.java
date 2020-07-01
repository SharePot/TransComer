package com.tc.spring.report.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.report.domain.Report;
import com.tc.spring.report.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	public ModelAndView selectReportList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		return mv;
	}
	
	public String insertReport(Report report, Model model,  HttpServletRequest request) {
		return null;
	}
	
	public String deleteReport(int reportNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
		return null;
	}
}
