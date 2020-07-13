package com.tc.spring.report.controller;

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
import com.tc.spring.member.domain.Member;
import com.tc.spring.report.domain.BlackPageInfo;
import com.tc.spring.report.domain.Report;
import com.tc.spring.report.domain.ReportPageInfo;
import com.tc.spring.report.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	@RequestMapping("rANDblist.tc")
	public ModelAndView selectReportAndBlackList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int reportCurrentPage = (page != null) ? page : 1;
		int reportListCount = reportService.getReportListCount();
		
		int blackCurrentPage = (page != null) ? page : 1;
		int blackListCount = reportService.getBlackListCount();
		
		ReportPageInfo rPi = Pagination.getReportPageInfo(reportCurrentPage, reportListCount);
		BlackPageInfo bPi = Pagination.getBlackPageInfo(blackCurrentPage, blackListCount);
		
		ArrayList<Report> rList = reportService.selectReportList(rPi);
		ArrayList<Member> bList = reportService.selectBlackList(bPi);
		
		if(!rList.isEmpty()) {
			mv.addObject("rlist", rList);
			mv.addObject("blist", bList);
			mv.addObject("rPi", rPi);
			mv.addObject("bPi", bPi);
			mv.setViewName("admin/adminReportView");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="rinsert.tc", method=RequestMethod.POST)
	public String insertReport(Report report, Model model,  HttpServletRequest request) {
		int result = 0;
		String path = null;
		
		result = reportService.insertReport(report, request);
		
		if (result > 0) {
			// 나중에 바꿔줘야 할 값
			path = "redirect:qlist.tc";
		} else {
			model.addAttribute("msg", "신고 실패");
			path = "common/errorPage";
		}
		return path;
	}
	
	@RequestMapping("rupdate.tc")
	public String updateReport(Report report, Model model, HttpServletRequest request) {
		int result = 0;
		String path = null;
		
		result = reportService.updateReport(report, request);
		
		if (result > 0) {
			path = "redirect:rANDblist.tc";
		} else {
			model.addAttribute("msg", "신고 승인 실패");
			path = "common/errorPage";
		}
		return path;
	}
	
	@RequestMapping("bupdate.tc")
	public String updateBlack(Member member, Model model, HttpServletRequest request) {
		int result = 0;
		String path = null;
		
		result = reportService.updateBlack(member, request);
		
		if (result > 0) {
			path = "redurect:rANDblist.tc";
		} else {
			model.addAttribute("msg", "블랙리스트 해제 실패");
			path = "common/errorPage";
		}
		return path;
	}
	
	@RequestMapping("rdelete.tc")
	public String deleteReport(int reportNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
		
		int result = reportService.deleteReport(reportNo);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "신고 처리 완료");
			return "redirect:rANDblist.tc";
		}else {
			model.addAttribute("msg","신고 처리 실패");
			return "common/errorPage";
		}
	}
}
