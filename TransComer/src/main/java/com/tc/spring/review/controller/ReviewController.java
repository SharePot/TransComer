package com.tc.spring.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.tc.spring.member.domain.Member;
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

	// 해당글의 평균 별점 값을 가져온다.
	@RequestMapping("loadStarRageAvg.tc")
	@ResponseBody
	public void selectStarRageAvg(int personalNo, HttpServletResponse response) {
		int starRageInt = 0; // 정수부분 저장
		int starRageUnderInt = 0; // 소수부분저장

		if (!reviewService.selectList(personalNo).isEmpty()) {
			// 해당 글에 리뷰가 1개 이상이면 평균 별점을 가져온다
			double starRageFull = reviewService.selectStarRageAvg(personalNo); // 전체 평점
			starRageInt = ((int) (starRageFull * 10)) / 10; // 정수부분 저장
			starRageUnderInt = ((int) (starRageFull * 10)) % 10; // 소수부분저장
		}
		JsonObject starRage = new JsonObject();
		// starRage 세팅
		starRage.addProperty("starInt", starRageInt); // 정수부분 저장
		starRage.addProperty("starUnderInt", starRageUnderInt); // 소수부분 저장
		try {
			PrintWriter out = response.getWriter();
			out.print(starRage);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
