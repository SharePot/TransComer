package com.tc.spring.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.common.Pagination;
import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.MemberPageInfo;
import com.tc.spring.member.domain.PointChange;
import com.tc.spring.member.domain.PointRefund;
import com.tc.spring.member.domain.Profile;
import com.tc.spring.member.service.MemberService;


@SessionAttributes({"loginUser"})
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
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
	      
	   }
	
	@RequestMapping("loginPage.tc")
	public String loginPage() {
		return "member/login";
	}
	
	   @RequestMapping("logout.tc")
	   public String memberLogout(SessionStatus status) {
	      status.setComplete();
	      return "redirect:home.tc";
	      
	   }
	   
	   @RequestMapping("memberDetail.tc")
		public String memberSelectOne(Model model,int memberNo) {
			model.addAttribute("member",memberService.selectMemberOne(memberNo));
			return "member/memberDetail";
		   
		}
		
	
	public ModelAndView memberLogic(Member member,ModelAndView mv) {
		return null;
		
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
	
	
	public ModelAndView PointChageList(ModelAndView mv,Integer page) {
		return null;
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
	public String pointRefundInsert(PointRefund pointRefund, Model model, HttpServletRequest request) {
		int result=memberService.insertPointRefund(pointRefund);
		if(result>0) {
			return "";
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
			return "pointRefundList";
		}else{
			model.addAttribute("msg","포인트 환급 확정 및 반려 실패");
			return "common/errorPage";
		}
	}
	
	
	
	

	
	//=============================================================================
	
	public ModelAndView profileList(ModelAndView mv) {
		return null;
	}
	
	public String profileInsert(Profile profile, Model model, HttpServletRequest request) {
	
		return null;
	}
	
	public String ProfileUpdate (Profile profile,Model model,HttpServletRequest request) {
	
		return null;
	}
	
	public String profileDelete(int memberNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
	
		return null;
	}
	
	
}
