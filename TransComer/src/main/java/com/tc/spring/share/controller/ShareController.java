package com.tc.spring.share.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.common.Pagination;
import com.tc.spring.files.controller.FileController;
import com.tc.spring.files.domain.Files;
import com.tc.spring.member.controller.MemberController;
import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.PointChange;
import com.tc.spring.member.service.MemberService;
import com.tc.spring.share.domain.Share;
import com.tc.spring.share.domain.SharePageInfo;
import com.tc.spring.share.domain.ShareSearch;
import com.tc.spring.share.service.ShareService;

@Controller
public class ShareController {


	@Autowired
	private ShareService shareService;
	@Autowired
	private FileController fController;
	
	@Autowired
	private MemberController mController;
	
	@Autowired
	private MemberService mService;
	
	// 공유 글 전체 목록 보기
	@RequestMapping("slist.tc")
	public ModelAndView selectShareList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
//		int listCount = shareService.getListCount();
		int listCount = 2;
		
		SharePageInfo sPi = Pagination.getSharePageInfo(currentPage, listCount);
		
		ArrayList<Share> sList = shareService.selectAllList(sPi);
		if(!sList.isEmpty()) {
			mv.addObject("slist", sList);
			mv.addObject("sPi", sPi);
			mv.setViewName("share/shareBoardListView"); //페이지
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 글 검색 목록 보기
	@RequestMapping(value="ssearch.tc", method=RequestMethod.GET)
	public ModelAndView searchShareList(ShareSearch shareSearch, ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = shareService.getSearchListCount(shareSearch);
		SharePageInfo sPi = Pagination.getSharePageInfo(currentPage, listCount);
		
		ArrayList<Share> sList = shareService.searchShareList(shareSearch, sPi);
		
		if(!sList.isEmpty()) {
			mv.addObject("slist", sList);
			mv.addObject("sPi", sPi);
			mv.addObject("sSearch", shareSearch);
			mv.setViewName("share/shareSharchListView"); //페이지
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 글 상세보기
	@RequestMapping("sdetail.tc")
	public ModelAndView shareDetail(ModelAndView mv, int shareNo){
		int result = shareService.addReadCount(shareNo); // 조회수 증가
		System.out.println("result :" + result);
		ArrayList<HashMap<String, Object>> share = shareService.selectShare(shareNo);
		
		if ( share != null ) {
			// 메소드 체이닝 방식
			mv.addObject("share", share)
			.setViewName("share/shareDetailView");
		} else {
			mv.addObject("msg", "게시글 상세조회 실패!").setViewName("common/errorPage");
		}
		return mv;

	}
	
	// 게시물 등록 페이지 이동
	@RequestMapping("shareWriterView.tc")
	public String shareWriterView() {
		return "share/sharePut";
	}
	
	// 실제 DB 등록
	@RequestMapping(value="shareInsert.tc", method=RequestMethod.POST)
	public String shareInsert(Share share, Model model, HttpServletRequest request, MultipartFile[] uploadFile, Files f) {
		
		int resultShare = shareService.insertShare(share);
		String path = null;
		if (resultShare > 0) {
			if(uploadFile.length > 0) {
		         for(int i=0; i<uploadFile.length; i++) {
		            if(!uploadFile[i].getOriginalFilename().contentEquals("")) {
		               String renameFileName = saveFile(uploadFile[i], request);
		               if(renameFileName != null) {   // 파일이 잘 저장된 경우
		            	   f.setFileName(uploadFile[i].getOriginalFilename());
		            	   f.setFilePath(renameFileName);
		            	   f.setMemberId(share.getMemberId());
		               }
		            }
		            
		            int resultFile = shareService.insertFile(f);
		           }
		      }
			path = "redirect:slist.tc";
		} else {
			model.addAttribute("msg", "게시물 등록 실패");
			path = "common/errorPage";
		}

		return path;
	}
	
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
	      String savePath = root + "\\uploadFiles";
	      File folder = new File(savePath);
	      
	      if(!folder.exists()){
	         folder.mkdirs();
	      }
	      
	      String originFileName = uploadFile.getOriginalFilename();
	      UUID uuid = UUID.randomUUID();
	      String renameFileName = uuid.toString() + "." + originFileName.substring(originFileName.lastIndexOf(".")+1);
	      String filePath = folder + "\\" +renameFileName;
	      try {
	         uploadFile.transferTo(new File(filePath));
	      }catch(Exception e) {
	         System.out.println("파일 전송 에러 : " + e.getMessage());
	      }
	      
	      return renameFileName;
	}

	/*// 게시글 수정 화면
	@RequestMapping("supview.tc")
	public String shareUpdateView(int shareNo, Model model) {
		model.addAttribute("share", shareService.selectShare(shareNo));
		return "share/";
	}
	
	
	// 게시글 수정
	@RequestMapping(value="supdate.tc", method=RequestMethod.POST)
	public String qnaUpdate(Share share, Files files, Model model, HttpServletRequest request, MultipartFile reloadFile, String memberId) {
		
		int resultShare = shareService.updateShare(share);
		int resultFile = 0;
		if(resultShare > 0) {
			if (!reloadFile.getOriginalFilename().equals("")) {
				resultFile = fController.updateFile(files, model, request, reloadFile, memberId);
			}
			return "redirect:sdetail.tc?shareNo="+share.getShareNo();
		} else {
			model.addAttribute("msg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}*/
	
	// 게시글 삭제
	/*@RequestMapping("sdelete.tc")
	public String shareDelete(int shareNo, Files files, Model model, HttpServletRequest request, RedirectAttributes rd, String memberId) {
		// Share share = shareService.selectShare(shareNo);
		int resultShare = shareService.deleteShare(shareNo);
		int resultFile = 0;
		
		if(resultShare > 0) {
			resultFile = fController.deleteFile(files, request, memberId);
			rd.addFlashAttribute("msg","게시글 삭제 성공");
			return "redirect:slist.tc";
		}else {
			model.addAttribute("msg","게시글 삭제 실패");
			return "common/errorPage";
		}
	}*/
	
	// 관리자 - 번역공유 승인 신청 리스트 페이지 이동
	@RequestMapping("adminShareList.tc")
	public ModelAndView adminShareList(ModelAndView mv) {
		ArrayList<Share> shareList = shareService.adminShareList();
		if (!shareList.isEmpty()) {
			// 리스트가 비어있지 않으면
			mv.addObject("shareList", shareList);
			mv.setViewName("admin/adminShareList");
		} else {
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 관리자 - 번역공유 신청글을 승인/반려를 하기위한 상세페이지 이동
	@RequestMapping("adminSelectShareOne.tc")
	public String adminShareOne(int shareNo, Model model) {
		Share share = shareService.adminSelectShareOne(shareNo);
		if (share != null) {
			model.addAttribute("share", share);
			return "admin/adminShareDetailCheck";
		} else {
			return "common/errorPage";
		}
	}

	// 관리자 - 번역공유 신청글 '승인'(Y)하기
	@RequestMapping(value = "updateShareYnY.tc", method = RequestMethod.GET)
	public String updateShareYnY(@RequestParam int shareNo,String memberId) {
		int result = shareService.updateShareYnY(shareNo);
		
		/*포인트 변동 내역 추가 및 업데이트를 위한 코드*/
		PointChange pointChange= new PointChange();
		pointChange.setPointContent("번역 공유 승인");
		pointChange.setPointAmount(3000);
		pointChange.setPointStatus("ADD");
		pointChange.setMemberId(memberId);
		
		Member member=mService.selectMemberOne(memberId);
		member.setPoint(member.getPoint()+3000);
		
		int insertPointChange=mController.pointChangeInsert(pointChange);
		int updateMemberPhoint=mController.updateMemberPoint(member);
		
		
		if (result > 0 && insertPointChange>0 && updateMemberPhoint>0) {
			return "redirect:/adminShareList.tc";
		} else {
			return "common/errorPage";
		}
	}

	// 관리자 - 번역공유 신청글 '반려'(N)하기
	@RequestMapping(value = "updateShareYnR.tc", method = RequestMethod.GET)
	public String updateShareYnR(@RequestParam int shareNo) {
		int result = shareService.updateShareYnR(shareNo);
		if (result > 0) {
			return "redirect:/adminShareList.tc";
		} else {
			return "common/errorPage";
		}
	}
	
	
	/*// 관리자 목록 보기
	@RequestMapping("sAdminlist.tc")
	public ModelAndView selectShareAdminList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount = shareService.getAdminListCount();
		SharePageInfo sPi = Pagination.getSharePageInfo(currentPage, listCount);
		
		ArrayList<Share> sAdminList = shareService.selectAdminShareList(sPi);
		
		if(!sAdminList.isEmpty()) {
			mv.addObject("salist", sAdminList);
			mv.addObject("sPi", sPi);
			mv.setViewName("admin/");
		} else {
			mv.addObject("msg", "관리자 문의글 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}*/

	/*
	 * public String shareDetail(int shareNo, Model model) { return ""; }
	 * 
	 * public String insertShareS(Share share, Model model,
	 * 
	 * @RequestParam(name = "", required = false) MultipartFile uploadFile,
	 * HttpServletRequest request) { return ""; }
	 * 
	 * public String saveImgFile(MultipartFile file, HttpServletRequest request) {
	 * return ""; }
	 * 
	 * public String saveZipFile(MultipartFile file, HttpServletRequest request) {
	 * return ""; }
	 * 
	 * public String deleteShare(int shareNo, Model model, HttpServletRequest
	 * request, RedirectAttributes rd) { return ""; }
	 * 
	 * public void deleteImgFile(String fileName, HttpServletRequest request) { }
	 * 
	 * public void deleteZipFile(String fileName, HttpServletRequest request) { }
	 */
}
