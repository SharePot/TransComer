package com.tc.spring.review.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.tc.spring.member.domain.Member;
import com.tc.spring.personal.domain.Personal;
import com.tc.spring.review.domain.Review;
import com.tc.spring.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	// 리뷰 리스트
	public ModelAndView selcetReviewList(HttpServletResponse response, int personalNo) throws JsonIOException, IOException {
		ArrayList<Review> rList = reviewService.selectList(personalNo);
		
		for(Review review : rList) {
			review.setRevContent(URLEncoder.encode(review.getRevContent(), "utf-8"));
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList, response.getWriter());
		return null;
	}
	
	
	public String reviewDetail(int reviewNo, Model model) {
		return null;
	}
	
	
	// 리뷰 작성
	@RequestMapping("pReview.tc")
	@ResponseBody
	public String reviewInsert(Review review, Personal personal, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String memberId = loginUser.getMemberId();
		review.setMemberId(memberId);
		int result = reviewService.insertReview(review);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	

	
	
	
}
