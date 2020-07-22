package com.tc.spring.share.controller;

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

import com.tc.spring.share.domain.Share;
import com.tc.spring.share.service.ShareService;

@Controller
public class ShareController {

	@Autowired
	private ShareService shareService;

	public ModelAndView shareList(ModelAndView mv) {
		return mv;
	}

	public String shareSearch(Share share, Model model) {
		return "";
	}

	public String shareDetail(int shareNo, Model model) {
		return "";
	}

	public String insertShareS(Share share, Model model,
			@RequestParam(name = "", required = false) MultipartFile uploadFile, HttpServletRequest request) {
		return "";
	}

	public String saveImgFile(MultipartFile file, HttpServletRequest request) {
		return "";
	}

	public String saveZipFile(MultipartFile file, HttpServletRequest request) {
		return "";
	}

	public String deleteShare(int shareNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
		return "";
	}

	public void deleteImgFile(String fileName, HttpServletRequest request) {
	}

	public void deleteZipFile(String fileName, HttpServletRequest request) {
		
	}

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
	public String updateShareYnY(@RequestParam int shareNo) {
		int result = shareService.updateShareYnY(shareNo);
		if (result > 0) {
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
	
	
}
