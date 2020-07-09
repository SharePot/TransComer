package com.tc.spring.qna.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.common.Pagination;
import com.tc.spring.files.controller.FileController;
import com.tc.spring.files.domain.Files;
import com.tc.spring.qna.domain.Qna;
import com.tc.spring.qna.domain.QnaPageInfo;
import com.tc.spring.qna.domain.QnaSearch;
import com.tc.spring.qna.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	private FileController fController;
	
	// Qna 전체 목록 보기
	@RequestMapping("qlist.tc")
	public ModelAndView selectQnaList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = qnaService.getListCount();
		QnaPageInfo qPi = Pagination.getQnaPageInfo(currentPage, listCount);
		
		ArrayList<Qna> qList = qnaService.selectList(qPi);
		
		if(!qList.isEmpty()) {
			mv.addObject("qlist", qList);
			mv.addObject("qPi", qPi);
			mv.setViewName("qna/qnaListView");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// Qna 검색
	@RequestMapping("qnaSearch.tc")
	public String qnaSearch(QnaSearch qnaSearch, Model model,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = qnaService.getListCount();
		QnaPageInfo qPi = Pagination.getQnaPageInfo(currentPage, listCount);

		ArrayList<Qna> searchList = qnaService.searchList(qPi, qnaSearch);

		model.addAttribute("searchList", searchList);
		model.addAttribute("qnaSearch", qnaSearch);
		return "qna/qnaListView";
	}

	// Qna 상세보기
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
	
	// Qna 게시물 등록 화면
	@RequestMapping("qnaWriterView.tc")
	public String qnaWriterView() {
		return "qna/qnaWriteForm";
	}
	
	// Qna 게시글 등록
	@RequestMapping(value="qnaInsert.tc", method=RequestMethod.POST)
	public String qnaInsert(Qna qna, Files files, Model model, @RequestParam(name="uploadFile",required=false)MultipartFile uploadFile, HttpServletRequest request, String memberId) {
		
		System.out.println(qna.toString());
		int resultQna = 0;
		int resultFile = 0;
		String path = null;
		
		resultQna = qnaService.insertQna(qna, request);
		
		if (resultQna > 0) {
			if (!uploadFile.getOriginalFilename().equals("")) {
				resultFile = fController.insertFile(files, model, uploadFile, request, memberId);
			}
			path = "redirect:qlist.tc";
		} else {
			model.addAttribute("msg", "스터디 게시물 등록 실패");
			path = "common/errorPage";
		}
		return path;
	}
	
	// QnA 게시글 수정 화면
	@RequestMapping("qupview.tc")
	public String qnaUpdateView(int qnaNo, Model model) {
		model.addAttribute("qna", qnaService.selectQna(qnaNo));
		return "qna/qnaUpdateView";
	}
	
	
	// Qna 게시글 수정
	@RequestMapping(value="qupdate.tc", method=RequestMethod.POST)
	public String qnaUpdate(Qna qna, Files files, Model model, HttpServletRequest request, MultipartFile reloadFile, String memberId) {
		
		int resultQna = qnaService.updateQna(qna);
		int resultFile = 0;
		if(resultQna > 0) {
			resultFile = fController.updateFile(files, model, request, reloadFile, memberId);
			return "redirect:qdetail.tc?qnaNo="+qna.getQnaNo();
		} else {
			model.addAttribute("msg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}
	
	// Qna 게시글 삭제
	@RequestMapping("qdelete.tc")
	public String qnaDelete(int qnaNo, String fileName, Model model, HttpServletRequest request, RedirectAttributes rd, String memberId) {
		Qna qna = qnaService.selectQna(qnaNo);
		int resultQna = qnaService.deleteQna(qnaNo);
		int resultFile = 0;
		
		if(resultQna > 0) {
			resultFile = fController.deleteFile(fileName, request, memberId);
			rd.addFlashAttribute("msg","게시글 삭제 성공");
			return "redirect:qlist.tc";
		}else {
			model.addAttribute("msg","게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
}
