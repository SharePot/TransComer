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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.tc.spring.comment.domain.Comment;
import com.tc.spring.member.domain.Member;
import com.tc.spring.personal.domain.Personal;
import com.tc.spring.review.domain.Review;
import com.tc.spring.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	// 리뷰 리스트
	@RequestMapping("pReviewList.tc")
	public void reviewList(HttpServletResponse response, int personalNo) throws JsonIOException, IOException {
		ArrayList<Review> rList = reviewService.selectList(personalNo);

		for (Review review : rList) {
			review.setRevContent(URLEncoder.encode(review.getRevContent(), "utf-8"));
		}

		// System.out.println("댓글 보기 : " + rList.toString());

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList, response.getWriter());
	}

	public String reviewDetail(int reviewNo, Model model) {
		return null;
	}

	// 리뷰 작성
	@RequestMapping("pReview.tc")
	@ResponseBody
	public String reviewInsert(Review review, HttpSession session) {
		System.out.println("------리뷰작성 함수 시작------");
		Member loginUser = (Member) session.getAttribute("loginUser");
		String memberId = loginUser.getMemberId();
		review.setMemberId(memberId);
		System.out.println("review 객체 : " + review);
		int result = reviewService.insertReview(review);
		if (result > 0) {
			System.out.println("리뷰작성 함수 끝- 성공");
			return "success";
		} else {
			System.out.println("리뷰작성 함수 끝- 실패");
			return "fail";
		}
	}

	// 현꾸 작성 ============================
	@RequestMapping(".tc")
	@ResponseBody
	public double selectStarRageAvg(int personalNo) {
		return reviewService.selectStarRageAvg(personalNo);
	}
	
	
}
