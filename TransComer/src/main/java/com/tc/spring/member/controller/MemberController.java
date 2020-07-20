package com.tc.spring.member.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.common.Pagination;
import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.MemberPageInfo;
import com.tc.spring.member.domain.MemberSearch;
import com.tc.spring.member.domain.PointChange;
import com.tc.spring.member.domain.PointRefund;
import com.tc.spring.member.domain.Profile;
import com.tc.spring.member.service.MemberService;
import com.tc.spring.study.domain.Study;
import com.tc.spring.study.domain.StudyPageInfo;
import com.tc.spring.study.domain.StudySearch;


@SessionAttributes({"loginUser"})
@Controller
public class MemberController {

	
	@Autowired
	private MemberService memberService;
	
	//회원리스트
	@RequestMapping("memberList.tc")
	public ModelAndView memberList(ModelAndView mv,@RequestParam(value="page",required=false)Integer page) {
		int currentPage=(page!=null) ? page : 1;
		int memberListCount=memberService.getMemberListCount();
		
		MemberPageInfo pi=Pagination.getMemberPageInfo(currentPage, memberListCount);
		ArrayList<Member> list=memberService.selectMemberList(pi);
		
		if(!list.isEmpty()) {
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("member/memberList");
		}else {
			mv.addObject("msg","회원리스트 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
/*	//로그인
	@RequestMapping(value="login.tc",method=RequestMethod.POST)
	   public ModelAndView memberLogin(Member member,ModelAndView mv) {
	      Member loginUser = memberService.loginMember(member);
	      
	      if (loginUser != null) {
	         mv.addObject("loginUser", loginUser);
	         mv.setViewName("home");
	      } else {
	         mv.setViewName("common/errorPage");
	      }
	      
	      return mv;
	      
	   }*/
	
		//로그인
	@RequestMapping(value="login.tc",method=RequestMethod.POST)
	@ResponseBody
	   public String memberLogin(Member member,Model model) {
	      Member loginUser = memberService.loginMember(member);
	      
	      if (loginUser != null) {
	    	  model.addAttribute("loginUser", loginUser);
	    	  return "success";
	      } else {
	    	  return "fail";
	      }
	   }
	
	//로그인 페이지
	@RequestMapping("loginPage.tc")
	public String loginPage() {
		return "member/login";
	}
	
	//로그아웃
	   @RequestMapping("logout.tc")
	   public String memberLogout(SessionStatus status) {
	      status.setComplete();
	      return "redirect:home.tc";
	   }
	   
	   //멤버 세부사항
	   @RequestMapping("memberDetail.tc")
		public String memberSelectOne(Model model,int memberNo) {
			model.addAttribute("member",memberService.selectMemberOne(memberNo));
			return "member/memberDetail";
		}
		
	
	 //멤버 검색
		@RequestMapping("memberSearch.tc")
		public String memberSearch(MemberSearch search, Model model,@RequestParam(value="page",required=false)Integer page) {
			int currentPage=(page!=null) ? page : 1;
			int MemberSearchListCount = memberService.getMemberSearchListCount(search);
			MemberPageInfo pi=Pagination.getMemberPageInfo(currentPage, MemberSearchListCount);
			ArrayList<Member> searchList=memberService.selectMemberSearchList(pi, search);
			
			model.addAttribute("list",searchList);
			model.addAttribute("search",search);
			model.addAttribute("pi",pi);
			return "member/memberList";
		}
	//회원 마이페이지
		@RequestMapping("myPage.tc")
		   public String myPage() {
		      return "member/myPage";
		   }


	//관리자페이지
  @RequestMapping("adminPage.tc")
  	public String adminPage() {
		      return "member/adminPage";
		   }

	public String enrollView() {
		
		return null;
	}
	
	public String memberInsert(Member member,Model model,String post,String address1,String address2) {
		return null;
	}
	
	public String idDuplicateCheck(String userId) {
		return null;
	}
	
	public String myInfoView() {
		return null;
	}
	
	public String memberUpdate(Member mem,Model model, String post, String address1, String address2,RedirectAttributes rd) {
		
		return null;
	}
	
	public String memberDelete(String userId,Model model,SessionStatus status) {
		return null;
	}
	
	
	
	//포인트변동=============================================================================
	
	
	
	//관리자페이지에서 포인트 변동리스트 전체
	@RequestMapping("pointchangList.tc")
	public ModelAndView pointChageList(ModelAndView mv,@RequestParam(value="page",required=false) Integer page) {
		int currentPage=(page!=null) ? page :1;
		int pointChangeListCount=memberService.getPointRefundListCount();
		
		MemberPageInfo pi=Pagination.getMemberPageInfo(currentPage, pointChangeListCount);
		ArrayList<PointChange> list=memberService.selectPointChangeList(pi);
		
		if(!list.isEmpty()) {
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("member/pointChangeList");
		}else {
			mv.addObject("msg","포인트 변동 리스트 조회 실패");
			 mv.setViewName("common/errorPage");
		}
		
		
		return mv;
	}
	


	
	//회원 마이페이지에서 포인트 변동리스트 전체
		@RequestMapping("pointchangMemberList.tc")
		public String pointChageMemberList(String memberId,Model model,@RequestParam(value="page",required=false)Integer page) {
		int currentPage=(page!=null) ? page: 1;
			int pointChangeMemberListCount=memberService.getPointChangeMemberCount(memberId);
			MemberPageInfo pi=Pagination.getMemberPageInfo(currentPage, pointChangeMemberListCount);
			ArrayList<PointChange> list=memberService.selectPointChangeMemberList(pi, memberId);
			
			model.addAttribute("list",list);
			model.addAttribute("memberId",memberId);
			model.addAttribute("pi",pi);
			return "member/memberPointChangView";
		}
		
	
	public String pointChangeInsert(PointChange pc, Model model, HttpServletRequest request) {
	
		
		return null;
	}
	
	public String pointChangeUpdate (PointChange pointChange,Model model,HttpServletRequest request) {
	
		return null;
	}
	
	public String pointChangeDelete(int pointChangeNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
	
		return null;
	}
	
	//포인트 환급=============================================================================
	
	//포인트 환급 리스트 조회
	@RequestMapping("pointRefundList.tc")
	public ModelAndView pointRefundList(ModelAndView mv,@RequestParam(value="page",required=false)Integer page) {
		int currentPage=(page!=null) ? page : 1;
		int pointRefundListCount=memberService.getPointRefundListCount();
		
		MemberPageInfo pi=Pagination.getMemberPageInfo(currentPage, pointRefundListCount);
		ArrayList<PointRefund> list=memberService.selectPointRefundList(pi);
		
		if(!list.isEmpty()) {
			mv.addObject("list",list);
			mv.addObject("pi",pi);
			mv.setViewName("member/pointRefundList");
		}else {
			mv.addObject("msg","포인트 환급 리스트 조회 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//포인트 환급신청 화면
	@RequestMapping("pointRefundRequestView.tc")
	public String pointRefundRequestView() {
		return "member/pointRefundRequestForm";
	}
	
	//포인트 환급 신청
	@RequestMapping(value="pointRefundInsert.tc",method=RequestMethod.POST)
	public String pointRefundInsert(PointRefund pointRefund, Model model,String bank,String accountOwner,String account ) {
		pointRefund.setAccountInfo(bank+","+accountOwner+","+account);
		int result=memberService.insertPointRefund(pointRefund);
		if(result>0) {
			return "member/myPage";
		}else {
		model.addAttribute("msg","포인트 환급 신청 실패");	
		}
		return "common/errorPage";
	}
	//포인트 환급 확정화면
	@RequestMapping("pointRefundCheckView.tc")
	public String pointRefundCheckView(Model model,int refundNo) {
		model.addAttribute("pointRefund",memberService.selectPointRefundOne(refundNo));
		return "member/pointRefundCheckView";
		
	}

	
	//포인트 환급 확정 및 반려
	@RequestMapping(value="pointRefundUpdate.tc", method=RequestMethod.GET)
	public String pointRefundUpdate (PointRefund pointRefund,Model model) {
		int result=memberService.updatePointRefund(pointRefund);
		if(result>0) {
			return "pointRefundList.tc";
		}else{
			model.addAttribute("msg","포인트 환급 확정 및 반려 실패");
			return "common/errorPage";
		}
	}
	
	//=============================================================================
	
	// 프로필 등록 회원 전체 리스트
		@RequestMapping("profileList.tc")
		public ModelAndView profileList(ModelAndView mv) {
			ArrayList<Profile> pfList = memberService.selectProfileList();
			if (!pfList.isEmpty()) {
				mv.addObject("pfList", pfList);
				mv.setViewName("member/memberList");
			} else {
				mv.setViewName("common/errorPage");
			}

			return mv;

		}

		// 프로필 상세보기
		@RequestMapping("profileDetail.tc")
		public String profileDetail(int memberNo, Model model) {
			Profile profile = memberService.selectProfileOne(memberNo);
			if (profile != null) {
				model.addAttribute("profile", profile);
				return "member/profileList";
			} else {
				return "common/errorPage";
			}
		}

		// 프로필 등록 화면 열기
		@RequestMapping("profileInsertView.tc")
		public String profileInsertView() {
			return "member/profileInsertForm";

		}

		// 프로필 등록
		@RequestMapping(value = "profileInsert.tc", method = RequestMethod.POST)
		public String insertProfile(Profile profile, Model model, HttpServletRequest request,
				@RequestParam(name = "uploadFile", required = false) MultipartFile uploadFile) {

			if (!uploadFile.getOriginalFilename().equals("")) {
				String filePath = saveFile(uploadFile, request);

				if (filePath != null) {
					profile.setProfileFilePath(uploadFile.getOriginalFilename());
				}
			}

			int result = 0;
			String path = null;

			result = memberService.insertProfile(profile, uploadFile, request);
			System.out.println(profile.toString());

			if (result > 0) {
				path = "redirect:profileList.tc";
			} else {
				path = "common/errorPage";
			}

			return path;
		}

		// 파일 저장
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\uploadFiles";

			File folder = new File(savePath);

			if (!folder.exists()) {
				folder.mkdir();
			}

			String filePath = folder + "\\" + file.getOriginalFilename();

			try {
				file.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return filePath;

		}
	
}
