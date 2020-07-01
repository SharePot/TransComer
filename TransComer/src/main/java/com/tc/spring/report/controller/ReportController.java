package com.tc.spring.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tc.spring.report.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
}
