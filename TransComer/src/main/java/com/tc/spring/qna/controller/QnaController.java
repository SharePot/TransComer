package com.tc.spring.qna.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.common.Pagination;
import com.tc.spring.qna.domain.Qna;
import com.tc.spring.qna.domain.QnaPageInfo;
import com.tc.spring.qna.domain.QnaSearch;
import com.tc.spring.qna.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("qlist.tc")
	public ModelAndView selectQnaList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = qnaService.getListCount();
		QnaPageInfo qPi = Pagination.getQnaPageInfo(currentPage, listCount);
		
		ArrayList<Qna> qList = qnaService.selectList(qPi);
		
		if(!qList.isEmpty()) {
			mv.addObject("qList", qList);
			mv.addObject("qPi", qPi);
			mv.setViewName("qna/qnaListView");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
   //qna 검색
   @RequestMapping("qnaSearch.tc")
   public String sqnaSearch(QnaSearch  qnaSearch, Model model, @RequestParam(value="page", required=false)Integer page) {
	   int currentPage = (page != null) ? page : 1;
	   int listCount = qnaService.getListCount();
	   QnaPageInfo qPi = Pagination.getQnaPageInfo(currentPage, listCount);
	   
      ArrayList<Qna> searchList=qnaService.searchList(qPi, qnaSearch);
      
      model.addAttribute("searchList",searchList);
      model.addAttribute("qnaSearch",qnaSearch);
      return "qna/qnaListView";
   }

	
	@RequestMapping("qdetail.tc")
	public ModelAndView qnaDetail(ModelAndView mv, int qnaNo, @RequestParam("page") Integer page) {
		int currentPage = page != null ? page : 1;
		
		qnaService.addReadCount(qnaNo); // 조회수 증가
		Qna qna = qnaService.selectQna(qnaNo); // 게시글 상세조회
		if ( qna != null ) {
			// 메소드 체이닝 방식
			mv.addObject("qna", qna).addObject("currentPage", currentPage)
			.setViewName("qna/qnaDetailView");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패!").setViewName("common/errorPage");
		}
		return mv;

	}
	
	// qna 게시물 등록 화면
	@RequestMapping("qnaWriterView.tc")
	public String qnaWriterView() {
		return "qna/qnaWriteForm";
	}
	
	@RequestMapping(value="qnaInsert.tc", method=RequestMethod.POST)
	public String qnaInsert(Qna qna, Model model, @RequestParam(name="uploadFile",required=false)MultipartFile uploadFile, HttpServletRequest request) {
		
		if(!uploadFile.getOriginalFilename().equals("")) {
	         String filePath=saveFile(uploadFile, request);
	         if(filePath !=null) {
	            qna.setFilePath(uploadFile.getOriginalFilename());
	         }
	      }
	      
	      
	      int result=0;
	      String path=null;
	      result=qnaService.insertQna(qna,uploadFile,request);
	      if(result>0) {
	         path="redirect:qnaList.tc";
	      }else {
	         model.addAttribute("msg","스터디 게시물 등록 실패");
	         path="common/errorPage";
	      }
	      return path;

	}
	
	public String qnaUpdate(Qna qna, Model model, HttpServletRequest request) {
		return null;
	}
	
	public String qnadelete(int qnaNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
		return null;
	}
	
}
