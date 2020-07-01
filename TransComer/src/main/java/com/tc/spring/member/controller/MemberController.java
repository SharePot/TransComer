package com.tc.spring.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.PointChange;
import com.tc.spring.member.domain.PointRefund;
import com.tc.spring.member.domain.Profile;
import com.tc.spring.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	public ModelAndView memberLogic(Member member,ModelAndView mv) {
		return null;
		
	}
	
	public String memberLogout(SessionStatus status) {
		
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
