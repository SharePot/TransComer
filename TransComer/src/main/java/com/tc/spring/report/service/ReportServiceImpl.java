package com.tc.spring.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.tc.spring.report.store.ReportStore;

@Service("reportService")
public class ReportServiceImpl {

	@Autowired
	private ReportStore reportStore;
}
