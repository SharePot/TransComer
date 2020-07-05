package com.tc.spring.study.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.common.Pagination;
import com.tc.spring.study.domain.Study;
import com.tc.spring.study.domain.StudyPageInfo;
import com.tc.spring.study.domain.StudySearch;
import com.tc.spring.study.service.StudyService;
import com.tc.spring.study.store.StudyStore;

@Controller
public class StudyController {

	@Autowired
	private StudyService studyService;

	//스터디 전체 목록
	@RequestMapping("studyList.tc")
	public ModelAndView studyList(ModelAndView mv,@RequestParam(value="page",required=false)Integer page) {
		
		int currentPage=(page!=null) ? page : 1;
		int listCount = studyService.getListCount();
		/*
		StudyPageInfo pi=Pagination.getPageInfo(currentPage,listCount);
		ArrayList<Study> list=studyService.selectStudyList();
		if(!list.isEmpty()) {
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("study/studyListView");
		}else {
			mv.addObject("msg","스터디 게시판 조회 실패");
			mv.setViewName("common/errorPage");
		}*/
		return mv;
	}

	//스터디 검색
	@RequestMapping("studySearch.tc")
	public String studySearch(StudySearch search, Model model) {
		ArrayList<Study> searchList=studyService.searchStudyList(search);
		
		model.addAttribute("searchList",searchList);
		model.addAttribute("search",search);
		return "study/studyListView";
	}

	//스터디 게시물 상세
	@RequestMapping("studyDetail.tc")
	public String studyDetail(int studyNo, Model model) {
		Study study=studyService.selectStudyOne(studyNo);
		if(study !=null) {
			model.addAttribute("study",study);
			return "study/studyDetailView";
		}else {
			model.addAttribute("msg","스터디 게시물 조회 실패");
			return "common/errorPage";
		}
	}

	//스터디 게시물 등록 화면
	@RequestMapping("studyWriterView.tc")
	public String studyWrigerView() {
		return "study/studyWriteForm";
	}
	
	
	//스터디 게시물 등록
	@RequestMapping(value="studyInsert.tc",method=RequestMethod.POST)
	public String insertStudy(Study study, Model model) {
		int result=studyService.insertStudy(study);
		if(result>0) {
			//model.addAttribute(arg0)
		}
		return "";
	}

	public String updateStudy(Study study, Model model, HttpServletRequest request) {
		return "";
	}

	public String deleteStudy(int shareNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
		return "";
	}
}
