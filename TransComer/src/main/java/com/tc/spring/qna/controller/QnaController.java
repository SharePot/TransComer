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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	
	@Autowired
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
	
	// Qna 검색 목록 보기
	@RequestMapping(value="qsearch.tc", method=RequestMethod.GET)
	public ModelAndView searchQnaList(QnaSearch qnaSearch, ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = qnaService.getSearchListCount(qnaSearch);
		QnaPageInfo qPi = Pagination.getQnaPageInfo(currentPage, listCount);
		
		ArrayList<Qna> qList = qnaService.searchQnaList(qnaSearch, qPi);
		
		if(!qList.isEmpty()) {
			mv.addObject("qlist", qList);
			mv.addObject("qPi", qPi);
			mv.addObject("qSearch", qnaSearch);
			mv.setViewName("qna/qnaSearchListView");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// Qna 관리자 목록 보기
	@RequestMapping("qAdminlist.tc")
	public ModelAndView selectQnaAdminList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = qnaService.getAdminListCount();
		QnaPageInfo qPi = Pagination.getQnaPageInfo(currentPage, listCount);
		
		ArrayList<Qna> qAdminList = qnaService.selectAdminQnaList(qPi);
		
		if(!qAdminList.isEmpty()) {
			mv.addObject("qalist", qAdminList);
			mv.addObject("qPi", qPi);
			mv.setViewName("admin/adminQnaList");
		} else {
			mv.addObject("msg", "관리자 문의글 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// Qna 상세보기
	@RequestMapping("qdetail.tc")
	public ModelAndView qnaDetail(ModelAndView mv, int qnaNo) {
		
		qnaService.addReadCount(qnaNo); // 조회수 증가
		Qna qna = qnaService.selectQna(qnaNo); // 게시글 상세조회
		
		Files fCategory = new Files();
		fCategory.setQnaNo(qnaNo);
		fCategory.setShareNo(0);
		fCategory.setStudyNo(0);
		fCategory.setPersonalNo(0);
		
		ArrayList<Files> fileList = fController.selectFileList(fCategory); // 해당 게시글 파일
		
		if ( qna != null ) {
			// 메소드 체이닝 방식
			mv.addObject("qna", qna)
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
	public String qnaInsert(Qna qna, Files files, Model model, 
			@RequestParam(name="uploadFile", required=false)MultipartFile[] uploadFile, MultipartHttpServletRequest request,  HttpServletRequest requestH, String memberId) {
		
		int resultQna = 0;
		int resultFile = 0;
		String path = null;
		resultQna = qnaService.insertQna(qna, requestH);
		
		if (resultQna > 0) {
			int qnaLatestNo = qnaService.selectQnaLatestNo(memberId);
			files.setQnaNo(qnaLatestNo);
			
			for (int i = 0; i < uploadFile.length; i++) {
				if (!uploadFile[i].getOriginalFilename().equals("")) {
					resultFile = fController.insertFile(files, model, uploadFile[i], requestH, memberId);
				}
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
		
		Files fCategory = new Files();
		fCategory.setQnaNo(qnaNo);
		fCategory.setShareNo(0);
		fCategory.setStudyNo(0);
		fCategory.setPersonalNo(0);
		
		ArrayList<Files> fileList = fController.selectFileList(fCategory); // 해당 게시글 파일
		
		model.addAttribute("qna", qnaService.selectQna(qnaNo));
		model.addAttribute("flist", fileList);
		return "qna/qnaUpdateForm";
	}
	
	// Qna 게시글 수정
	@RequestMapping(value="qupdate.tc", method=RequestMethod.POST)
	public String qnaUpdate(Qna qna, Model model, MultipartHttpServletRequest request, HttpServletRequest requestH,
			@RequestParam(name="reloadFile", required=false)MultipartFile[] reloadFile, String memberId) {
		int resultQna = qnaService.updateQna(qna);
		int resultFile = 0;
		
		if(resultQna > 0) {
			Files fCategory = new Files();
			fCategory.setQnaNo(qna.getQnaNo());
			fCategory.setShareNo(0);
			fCategory.setStudyNo(0);
			fCategory.setPersonalNo(0);
			
			ArrayList<Files> fileList = fController.selectFileList(fCategory);
			
			for(int i = 0; i < reloadFile.length; i++) {
				if (!reloadFile[i].getOriginalFilename().equals("")) {
					resultFile = fController.updateFile(fileList.get(i), model, requestH, reloadFile[i], memberId);
				}
			}
			return "redirect:qdetail.tc?qnaNo="+qna.getQnaNo();
		} else {
			model.addAttribute("msg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}
	
	// Qna 게시글 삭제
	@RequestMapping(value="qdelete.tc", method=RequestMethod.GET)
	@ResponseBody
	public void qnaDelete(int qnaNo, Model model, HttpServletRequest request, RedirectAttributes rd, String memberId) {
		Qna qna = qnaService.selectQna(qnaNo);
		int resultQna = qnaService.deleteQna(qnaNo);
		int resultFile = 0;
		
		if(resultQna > 0) {
			
			Files fCategory = new Files();
			fCategory.setQnaNo(qnaNo);
			fCategory.setShareNo(0);
			fCategory.setStudyNo(0);
			fCategory.setPersonalNo(0);
			
			ArrayList<Files> fileList = fController.selectFileList(fCategory);
			
			for(int i = 0; i < fileList.size(); i++) {
				if (!fileList.isEmpty()) {
					String del = "yes";
					resultFile = fController.deleteFile(fileList.get(i), request, memberId, del);
				}
			}
			
			/*rd.addFlashAttribute("msg","게시글 삭제 성공");
			return "redirect:qlist.tc";*/
		}
	}
	
}
