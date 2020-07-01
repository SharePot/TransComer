package com.tc.spring.study.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.study.domain.Study;
import com.tc.spring.study.service.StudyService;

@Controller
public class StudyController {

	@Autowired
	private StudyService studyService;

	public ModelAndView studyList(ModelAndView mv) {
		return mv;
	}

	public String studySearch(Study study, Model model) {
		return "";
	}

	public String studyDetail(int studyNo, Model model) {
		return "";
	}

	public String insertStudy(Study study, Model model) {
		return "";
	}

	public String updateStudy(Study study, Model model, HttpServletRequest request) {
		return "";
	}

	public String deleteStudy(int shareNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
		return "";
	}
}
