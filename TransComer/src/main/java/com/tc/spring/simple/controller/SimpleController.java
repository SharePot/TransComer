package com.tc.spring.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.simple.domain.SimpleRequest;
import com.tc.spring.simple.domain.SimpleResponse;
import com.tc.spring.simple.service.SimpleService;

@Controller
public class SimpleController {

	@Autowired
	private SimpleService simpleService;
	
	// -------------------- 단순의뢰 질문 --------------------
	
	// 단순의뢰 질문 전체 조회
	public ModelAndView selectSimpleReqList(ModelAndView mv) {
		
		return null;
	}
	
	// 단순의뢰 질문 상세 조회
	public ModelAndView simpleReqDetail(ModelAndView mv, int simpleNo) {
		return null;
	}
	
	// 단순의뢰 질문 작성
	public String simpleReqInsert(SimpleRequest simpleReq, Model model) {
		
		return null;
	}
	
	// 단순의뢰 질문 수정
	public String simpleReqUpdate(SimpleRequest simpleReq, Model model) {
		
		return null;
	}
	
	// 단순의뢰 질문 삭제
	public String simpleReqDelete(int simpleNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
		
		return null;
	}
	
	// -------------------- 단순의뢰 답변 --------------------
	
	// 단순의뢰 답변 전체 조회
	public ModelAndView getSimpleResList(HttpServletResponse response, int simpleReplyNo) {
		return null;
	}
	
	// 단순의뢰 답변 작성
	public String simpleResInsert(SimpleResponse simpleRes, HttpSession session ) {
		return null;
	}
	
	// 단순의뢰 답변 수정
	public String simpleResUpdate(SimpleResponse simpleRes) {
		return null;
	}
	
	// 단순의뢰 답변 삭제
	public String simpleResDelete(int simpleReplyNo) {
		return null;
	}
	
	
	
}
