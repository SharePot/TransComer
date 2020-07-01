package com.tc.spring.qna.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.qna.domain.Qna;
import com.tc.spring.qna.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	public ModelAndView selectQnaList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		return null;
	}
	
	public String qnaDetail(int qnaNo, Model model) {
		return null;
	} 
	
	public String qnaInsert(Qna qna, Model model, HttpServletRequest request) {
		return null;
	}
	
	public String qnaUpdate(Qna qna, Model model, HttpServletRequest request) {
		return null;
	}
	
	public String qnadelete(int qnaNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
		return null;
	}
	
}
