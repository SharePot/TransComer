package com.tc.spring.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tc.spring.study.service.StudyService;

@Controller
public class StudyController {

	@Autowired
	private StudyService studyService;
}
