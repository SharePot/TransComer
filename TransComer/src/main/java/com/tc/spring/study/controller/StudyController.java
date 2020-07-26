package com.tc.spring.study.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.comment.controller.CommentController;
import com.tc.spring.common.Pagination;
import com.tc.spring.files.controller.FileController;
import com.tc.spring.files.domain.Files;
import com.tc.spring.study.domain.Study;
import com.tc.spring.study.domain.StudyPageInfo;
import com.tc.spring.study.domain.StudySearch;
import com.tc.spring.study.service.StudyService;
import com.tc.spring.study.store.StudyStore;

@Controller
public class StudyController {

	@Autowired
	private StudyService studyService;
	
	@Autowired
	private CommentController cController;
	
	@Autowired
	private FileController fController;

	//스터디 전체 목록
	@RequestMapping("studyList.tc")
	public ModelAndView studyList(ModelAndView mv,@RequestParam(value="page",required=false)Integer page) {
		
		int currentPage=(page!=null) ? page : 1;
		int studyListCount = studyService.getListCount();
	
		int shareNo=0;
		int qnaNo=0;
		String commentCondition="study";
		StudyPageInfo pi=Pagination.getStudyPageInfo(currentPage,studyListCount);
		ArrayList<Study> list=studyService.selectStudyList(pi);
		
		for (int i=0; i<list.size(); i++) {
			int commentCount=cController.getCommentListCount(shareNo, list.get(i).getStudyNo(), qnaNo, commentCondition);
			list.get(i).setCommentCount(commentCount);
		}
		
		
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("study/studyListView");
		
		return mv;
	}

	//스터디 검색
	@RequestMapping("studySearch.tc")
	public String studySearch(StudySearch search, Model model,@RequestParam(value="page",required=false)Integer page) {
		int currentPage=(page!=null) ? page : 1;
		int studyListCount = studyService.getSearchListCount(search);
		StudyPageInfo pi=Pagination.getStudyPageInfo(currentPage,studyListCount);
		ArrayList<Study> searchList=studyService.searchStudyList(search,pi);
		
		model.addAttribute("list",searchList);
		model.addAttribute("search",search);
		model.addAttribute("pi",pi);
		return "study/studyListView";
	}

	//스터디 게시물 상세
	@RequestMapping("studyDetail.tc")
	public ModelAndView studyDetail(ModelAndView mv,int studyNo,@RequestParam(name="page",required=false)Integer page) {
		
		int currentPage=page !=null ? page : 1;
		studyService.addReadCount(studyNo);//조회수 증가
		
		Study study=studyService.selectStudyOne(studyNo);
		if(study !=null) {
			mv.addObject("study",study)
			.addObject("currentPage",currentPage)
			.setViewName("study/studyDetailView");
		}else {
			mv.addObject("msg","스터디 게시물 조회 실패")
			.setViewName("common/errorPage");
		}
		return mv;
	}

	//스터디 게시물 등록 화면
	@RequestMapping("studyWriterView.tc")
	public String studyWriterView() {
		return "study/studyInsertForm";
	}
	
	
	//스터디 게시물 등록
	@RequestMapping(value="studyInsert.tc",method=RequestMethod.POST)
	public String insertStudy(Study study, Files files, Model model,
			@RequestParam(name="uploadFile",required=false)MultipartFile[] uploadFile, MultipartHttpServletRequest request, HttpServletRequest requestH, String memberId) {
		
		int resultStudy=0;
		int resultFile=0;
		String path=null;
		resultStudy=studyService.insertStudy(study, request);
		
		
		if(resultStudy > 0) {
			int studyLatestNo = studyService.selectStudyLatestNo(memberId);
			files.setStudyNo(studyLatestNo);
			
			for (int i = 0; i < uploadFile.length; i++ ) {
				if (!uploadFile[i].getOriginalFilename().equals("")) {
					resultFile = fController.insertFile(files, model, uploadFile[i], requestH, memberId);
				}
			}
			path="redirect:studyList.tc";
		}else {
			model.addAttribute("msg","스터디 게시물 등록 실패");
			path="common/errorPage";
		}
		
		return path;
	}
	
	
	
	//파일저장
		public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root=request.getSession().getServletContext().getRealPath("resources");
		String savePath=root+ "\\uploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		String filePath=folder+"\\"+file.getOriginalFilename();
		
		try {
			file.transferTo(new File(filePath));
		}catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return filePath;
		
		}
		
		
		//스터디 수정폼
		@RequestMapping("studyUploadView.tc")
		public String studyUpdateView(int studyNo,Model model) {
			
			Files fCategory = new Files();
			fCategory.setQnaNo(0);
			fCategory.setShareNo(0);
			fCategory.setStudyNo(studyNo);
			fCategory.setpReqNo(0);
			
			ArrayList<Files> fileList = fController.selectFileList(fCategory); // 해당 게시글 파일
			
			model.addAttribute("study",studyService.selectStudyOne(studyNo));
			model.addAttribute("flist", fileList);
			return "study/studyUpdateForm";
		}
		
		//스터디 수정
	@RequestMapping(value="studyUpdate.tc",method=RequestMethod.POST)	
	
	
	public String updateStudy(Study study, Model model, HttpServletRequest requestH, MultipartHttpServletRequest request,
			@RequestParam(name="reloadFile", required=false)MultipartFile[] reloadFile, @RequestParam(value="page", required=false)Integer page, String memberId) {
		
		
		int resultStudy=studyService.updateStudy(study);
		int resultFile = 0;
		
		if(resultStudy>0) {
			Files fCategory = new Files();
			fCategory.setQnaNo(0);
			fCategory.setShareNo(0);
			fCategory.setStudyNo(study.getStudyNo());
			fCategory.setpReqNo(0);
			
			ArrayList<Files> fileList = fController.selectFileList(fCategory);
			
			for(int i = 0; i < reloadFile.length; i++) {
				if (!reloadFile[i].getOriginalFilename().equals("")) {
					resultFile = fController.updateFile(fileList.get(i), model, requestH, reloadFile[i], memberId);
				}
			}
			return "redirect:studyDetail.tc?studyNo="+study.getStudyNo();
		}else {
			model.addAttribute("msg","스터디 게시물 수정 실패");
			return "common/errorPage";
			
		}
	}

	//스터디 삭제
	@RequestMapping("studyDelete.tc")
	public String deleteStudy(int studyNo, Model model, HttpServletRequest request, RedirectAttributes rd, String memberId) {
		Study study=studyService.selectStudyOne(studyNo);
		int resultStudy=studyService.deleteStudy(studyNo);
		int resultFile=0;
		if(resultStudy>0) {
			Files fCategory = new Files();
			fCategory.setQnaNo(0);
			fCategory.setShareNo(0);
			fCategory.setStudyNo(studyNo);
			fCategory.setpReqNo(0);
			
			ArrayList<Files> fileList = fController.selectFileList(fCategory);
			
			for(int i = 0; i < fileList.size(); i++) {
				if (!fileList.isEmpty()) {
					String del = "yes";
					resultFile = fController.deleteFile(fileList.get(i), request, memberId, del);
				}
			}
			
			rd.addFlashAttribute("msg","스터디 삭제 성공");
			return "redirect:studyList.tc";
		}else {
			model.addAttribute("msg","스터디 삭제 성공");
		}
		return "common/errorPage";
	}
	
}
