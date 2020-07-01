package com.tc.spring.comment.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.comment.domain.Comment;
import com.tc.spring.comment.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	public ModelAndView commentList(ModelAndView mv) {
		return mv;
	}
	
	public String insertComment(Comment comment, Model model, HttpServletRequest request) {
		return null;
	}
	
	public String updateComment(Comment comment, Model model, HttpServletRequest request) {
		return null;
	}

	public String deleteComment(int commentNo, Model model, HttpServletRequest request, RedirectAttributes rd) {
		return null;
	}
		
}
