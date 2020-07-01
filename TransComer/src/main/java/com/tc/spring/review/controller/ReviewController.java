package com.tc.spring.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tc.spring.review.domain.Review;
import com.tc.spring.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	public ModelAndView selcetReviewList(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		return null;
	}
	
	public String reviewDetail(int reviewNo, Model model) {
		return null;
	}
	
	public String reviewInsert(Review review, Model model, HttpServletRequest request) {
		return null;
	}
	
	
	
}
