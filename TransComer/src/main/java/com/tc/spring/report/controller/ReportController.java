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
import com.tc.spring.report.domain.BlackSearch;
import com.tc.spring.report.domain.Report;
import com.tc.spring.report.domain.ReportPageInfo;
import com.tc.spring.report.domain.ReportSearch;
import com.tc.spring.report.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	// 관리자페이지 신고와 블랙리스트 목록 보기
	@RequestMapping("rANDblist.tc")
	public ModelAndView selectReportAndBlackList(ModelAndView mv, @RequestParam(value="rpage", required=false)Integer rpage, 
			@RequestParam(value="bpage", required=false)Integer bpage) {
		int reportCurrentPage = (rpage != null) ? rpage : 1;
		int reportListCount = reportService.getReportListCount();
		
		int blackCurrentPage = (bpage != null) ? bpage : 1;
		int blackListCount = reportService.getBlackListCount();
		
		ReportPageInfo rPi = Pagination.getReportPageInfo(reportCurrentPage, reportListCount);
		BlackPageInfo bPi = Pagination.getBlackPageInfo(blackCurrentPage, blackListCount);
		
		ArrayList<Report> rList = reportService.selectReportList(rPi);
		ArrayList<Member> bList = reportService.selectBlackList(bPi);
		
		if(!rList.isEmpty() || !bList.isEmpty()) {
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
	
	// 관리자 페이지 신고리스트 검색 목록 보기
	@RequestMapping(value="reportSearch.tc", method=RequestMethod.GET)
	public ModelAndView searchReportList(ReportSearch reportSearch, ModelAndView mv, @RequestParam(value="rpage", required=false)Integer rpage, 
	@RequestParam(value="bpage", required=false)Integer bpage) {
		
		int reportCurrentPage = (rpage != null) ? rpage : 1;
		int reportListCount = reportService.getReportSearchListCount(reportSearch);
		
		int blackCurrentPage = (bpage != null) ? bpage : 1;
		int blackListCount = reportService.getBlackListCount();
		
		ReportPageInfo rPi = Pagination.getReportPageInfo(reportCurrentPage, reportListCount);
		BlackPageInfo bPi = Pagination.getBlackPageInfo(blackCurrentPage, blackListCount);
		
		ArrayList<Report> rList = reportService.searchReportList(reportSearch, rPi);
		ArrayList<Member> bList = reportService.selectBlackList(bPi);
		
		if(!rList.isEmpty() || !bList.isEmpty()) {
			mv.addObject("rlist", rList);
			mv.addObject("blist", bList);
			mv.addObject("rsearch", reportSearch);
			mv.addObject("rPi", rPi);
			mv.addObject("bPi", bPi);
			mv.setViewName("admin/adminReportSearch");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 관리자 페이지 블랙리스트 검색 목록 보기
	@RequestMapping(value="blackSearch.tc", method=RequestMethod.GET)
	public ModelAndView searchBlackList(BlackSearch blackSearch, ModelAndView mv, @RequestParam(value="rpage", required=false)Integer rpage, 
			@RequestParam(value="bpage", required=false)Integer bpage) {
		int reportCurrentPage = (rpage != null) ? rpage : 1;
		int reportListCount = reportService.getReportListCount();
		
		int blackCurrentPage = (bpage != null) ? bpage : 1;
		int blackListCount = reportService.getBlackSearchListCount(blackSearch);
		
		ReportPageInfo rPi = Pagination.getReportPageInfo(reportCurrentPage, reportListCount);
		BlackPageInfo bPi = Pagination.getBlackPageInfo(blackCurrentPage, blackListCount);
		
		ArrayList<Report> rList = reportService.selectReportList(rPi);
		ArrayList<Member> bList = reportService.searchBlackList(blackSearch, bPi);
		
		if(!rList.isEmpty() || !bList.isEmpty()) {
			mv.addObject("rlist", rList);
			mv.addObject("blist", bList);
			mv.addObject("bsearch", blackSearch);
			mv.addObject("rPi", rPi);
			mv.addObject("bPi", bPi);
			mv.setViewName("admin/adminBlackSearch");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 신고 넣기
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
	
	// ajax로 처리했기 때문에 return으로 redirect:rANDblist.tc를 사용할 곳이 없게 된다.
	// 신고 승인 후 해당 아이디 목록 어떻게 처리할지 생각
	@RequestMapping("rupdate.tc")
	public void updateReport(Report report, HttpServletRequest request) {
		int result = 0;
		String path = null;
		
		result = reportService.updateReport(report, request);
	}
	
	// 블랙리스트 해제 (ajax 처리)
	@RequestMapping("bupdate.tc")
	public void updateBlack(Member member, HttpServletRequest request) {
		int result = 0;
		
		result = reportService.updateBlack(member, request);
	
	}
	
	// 신고 반려 및 경고(ajax 처리)
	@RequestMapping("rdelete.tc")
	public void deleteReport(int reportNo, HttpServletRequest request) {
		
		int result = reportService.deleteReport(reportNo);
	}
}
