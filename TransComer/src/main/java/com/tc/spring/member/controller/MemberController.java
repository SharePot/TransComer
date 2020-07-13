package com.tc.spring.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.PointChange;
import com.tc.spring.member.domain.PointRefund;
import com.tc.spring.member.domain.Profile;
import com.tc.spring.member.service.MemberService;


@SessionAttributes({"loginUser"})
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping("mlist.tc")
	public ModelAndView memberList(ModelAndView mv) {
		ArrayList<Member>list=memberService.selectMemberList();
		
		if(!list.isEmpty()) {
			mv.addObject("list",list);
			mv.setViewName("member/memberListView");
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
	
	//=============================================================================
	
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
	
	//=============================================================================
	
	public ModelAndView PointRefundList(ModelAndView mv,Integer page) {
		return null;
	}
	
	public String PointRefundInsert(PointChange pc, Model model, HttpServletRequest request) {
	
		return null;
	}
	
	public String PointRefundUpdate (PointRefund pointRefund,Model model,HttpServletRequest request) {
	
		return null;
	}
	
	public String PointRefundDelete(int PointRefundNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
	
		return null;
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
