package com.tc.spring.simple.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.tc.spring.common.Pagination;
import com.tc.spring.member.domain.Member;
import com.tc.spring.simple.domain.SimplePageInfo;
import com.tc.spring.simple.domain.SimpleRequest;
import com.tc.spring.simple.domain.SimpleResponse;
import com.tc.spring.simple.domain.SimpleSearch;
import com.tc.spring.simple.service.SimpleService;

@Controller
public class SimpleController {

	@Autowired
	private SimpleService simpleService;
	
	// -------------------- 단순의뢰 질문 --------------------
	
	// 단순의뢰 질문 전체 조회
	@RequestMapping("sReqListView.tc")
	public ModelAndView selectSimpleReqList(ModelAndView mv, @RequestParam(value="spPage", required=false)Integer spPage) {
		
		int spCurrentPage = (spPage != null) ? spPage : 1;
		int spListCount = simpleService.getSReqListCount();
		SimplePageInfo spi = Pagination.getSimplePageInfo(spCurrentPage, spListCount);
		ArrayList<SimpleRequest> sReqList = simpleService.selectSimpleReqList(spi);
		
		if (!sReqList.isEmpty()) {
			mv.addObject("spi", spi);
			mv.addObject("sReqList", sReqList);
			mv.setViewName("simple/simpleListView");
		} else {
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 단순의뢰 질문 상세 조회
	@RequestMapping("sReqDetail.tc")
	public ModelAndView simpleReqDetail(ModelAndView mv, int simpleNo, @RequestParam(value="spPage", required=false)Integer spPage ) {
		
		int spCurrentPage = spPage != null ? spPage : 1;
		simpleService.addSReqReadCount(simpleNo); // 조회수
		SimpleRequest sReq = simpleService.selectOne(simpleNo);
		ArrayList<SimpleResponse> sRes = simpleService.sResOne(simpleNo);
		
		if (sReq != null) {
			mv.addObject("sReq", sReq).addObject("spCurrentPage", spCurrentPage).setViewName("simple/simpleDetailView");
			mv.addObject("sRes", sRes).setViewName("simple/simpleDetailView");
		} else {
			mv.setViewName("common/errorPage");
			
		}
		
		return mv;
	}
	
	// 내 단순의뢰 목록
	@RequestMapping("mySimpleList.tc")
	public ModelAndView mySimpleList(ModelAndView mv, HttpSession session,@RequestParam(value="spPage", required=false)Integer spPage) {
		
		int spCurrentPage = (spPage != null) ? spPage : 1;
		int spListCount = simpleService.getSReqListCount();
		SimplePageInfo spi = Pagination.getSimplePageInfo(spCurrentPage, spListCount);
		
		Member loginUser = (Member)session.getAttribute("loginUser"); 
		String simpleWriter = loginUser.getMemberId();
		
		ArrayList<SimpleRequest> sReqList = simpleService.mySimpleList(spi, simpleWriter);
		
		if (sReqList != null) {
			mv.addObject("myReq", sReqList).addObject("spi", spi).setViewName("simple/mySimpleList");
		} else {
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	// 단순의뢰 질문 작성 폼 열기
	@RequestMapping("sReqInsertView.tc")
	public String sReqInsertView() {
		return "simple/simpleInsertForm";
	}
	
	// 단순의뢰 질문 작성
	@RequestMapping(value="sReqInsert.tc", method= {RequestMethod.POST, RequestMethod.GET})
	public String simpleReqInsert(SimpleRequest simpleReq, Model model) {
		
		int result = simpleService.simpleReqInsert(simpleReq);
		if (result > 0) {
			return "redirect:home.tc";
		} else {
			return "common/errorPage";
		}
		
	}
	
	// 단순의뢰 질문 수정 폼 열기
	@RequestMapping("sReqUpdateView.tc")
	public String sReqUpdateView(int simpleNo, Model model) {
		model.addAttribute("sReq", simpleService.selectOne(simpleNo));
		return "simple/simpleUpdateForm";
	}
	
	// 단순의뢰 질문 수정
	@RequestMapping(value="sReqUpdate.tc", method= {RequestMethod.POST, RequestMethod.GET})
	public String simpleReqUpdate(SimpleRequest simpleReq, Model model) {
		
		int result = simpleService.simpleReqUpdate(simpleReq);
		
		if (result > 0) {
			return "redirect:sReqDetail.tc?simpleNo=" + simpleReq.getSimpleNo();
		} else {
			return "common/errorPage";
		}
		
	}
	
	// 단순의뢰 질문 삭제
	@RequestMapping("sReqDelete.tc")
	public String simpleReqDelete(int simpleNo) {
		int result = simpleService.simpleReqDelete(simpleNo);
		
		if (result > 0) {
			return "redirect:sReqListView.tc";
		} else {
			return "common/errorPage";
		}
		
	}
	
	// 단순의뢰 질문 검색
	@RequestMapping("sReqSearch.tc")
	public String simpleReqSearch (SimpleSearch simpleSearch, Model model, @RequestParam(value="spPage", required=false)Integer spPage) {
		int spCurrentPage = (spPage != null) ? spPage : 1;
		int spListCount = simpleService.getSearchsReListCount(simpleSearch);
		SimplePageInfo spi = Pagination.getSimplePageInfo(spCurrentPage, spListCount);
		ArrayList<SimpleRequest> sReqList = simpleService.sReqSearchList(simpleSearch, spi);
		
		model.addAttribute("sReqList", sReqList);
		model.addAttribute("simpleSearch", simpleSearch);
		model.addAttribute("spi", spi);
		return "simple/simpleListView";
		
	}
	
	// -------------------- 단순의뢰 답변 --------------------
	
	// 단순의뢰 답변 조회
	@RequestMapping("sResList.tc")
	public void getSimpleResList(HttpServletResponse response, int simpleNo) throws JsonIOException, IOException {
		
		ArrayList<SimpleResponse> sResList = simpleService.getSimpleResList(simpleNo);

		
		for (SimpleResponse sRes : sResList) {
			sRes.setSimpleReplyContent(URLEncoder.encode(sRes.getSimpleReplyContent(), "utf-8"));
		}

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(sResList, response.getWriter());
		
	}
	
	// 단순의뢰 답변 작성
	@RequestMapping("insertRes.tc")
	@ResponseBody
	public String simpleResInsert(SimpleResponse simpleRes, HttpSession session ) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String simpleReplyWriter = loginUser.getMemberId();
		
		simpleRes.setSimpleReplyWriter(simpleReplyWriter);
		int result = simpleService.simpleResInsert(simpleRes);
		
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
		
	}
	
	// 단순의뢰 답변 수정
	@RequestMapping("updateRes.tc")
	@ResponseBody
	public String simpleResUpdate(SimpleResponse simpleRes) {
		int result = simpleService.simpleResUpdate(simpleRes);
		
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
		
	}
	
	// 단순의뢰 답변 삭제
	@RequestMapping("deleteRes.tc")
	@ResponseBody
	public String simpleResDelete(int simpleReplyNo) {
		int result = simpleService.simpleResDelete(simpleReplyNo);
		
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 단순의뢰 채택 처리
	@RequestMapping("adoptReply.tc")
	@ResponseBody
	public String replyAdopt (int simpleReplyNo, int sReqNo, String simpleReplyWriter ) {
		
		int adoptReply = simpleService.adoptReply(simpleReplyNo);
		int adoptRequest = simpleService.adoptRequest(sReqNo);
		int memberAdoptCount = simpleService.memberAdoptCount(simpleReplyWriter);
		
		if (adoptReply > 0) {
			if (adoptRequest > 0) {
				if (memberAdoptCount > 0) {
					return "success";
				}
			}
			
			return "success";
			
		} else {
			return "fail";
		}
		
	}

	
}
