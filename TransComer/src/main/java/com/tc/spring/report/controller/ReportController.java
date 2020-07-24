package com.tc.spring.report.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("reportForm.tc")
	public String reportForm() {
		return "member/reportForm";
	}
	
	// 신고 넣기
	@RequestMapping("rinsert.tc")
	@ResponseBody
	public String insertReport(Report report) {
		
		int result = reportService.insertReport(report);
		
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	/*ajax 에서 success로 넘어가는 조건은 http 요청에 성공했을 경우이다.
	그런데 @RequestMapping 메서드에 적용되면 해당 메소드의 리턴값을  http 응답데이터로 사용하는 @ResponseBody를
	빼먹었으니 요청데이터가 없었던것 같다.
	그럼 @RequestBody  와 @ResponseBody 에 대해서 알아보자.
	@RequestBody 와 @ResponseBody 어노테이션은 각각 HTTP 요청 몸체를 자바 객체로 변환하고 자바 객체를 HTTP 응답 몸체로 변환해주는데 사용된다.
	 */

	// ajax로 처리했기 때문에 return으로 redirect:rANDblist.tc를 사용할 곳이 없게 된다.
	// 신고 승인 후 해당 아이디 목록 어떻게 처리할지 생각
	@ResponseBody
	@RequestMapping("rupdate.tc")
	public void updateReport(Report report, HttpServletRequest request) {
		
		int result = reportService.updateReport(report, request);
	}
	
	// 블랙리스트 해제 (ajax 처리)
	@ResponseBody
	@RequestMapping("bupdate.tc")
	public void updateBlack(Member member, HttpServletRequest request) {
		
		int result = reportService.updateBlack(member, request);
	
	}
	
	// 신고 반려 (ajax 처리)
	@ResponseBody
	@RequestMapping("rdelete.tc")
	public void deleteReport(int reportNo, HttpServletRequest request) {
		
		int result = reportService.deleteReport(reportNo);
	}
}
