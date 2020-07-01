package com.tc.spring.share.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
}
