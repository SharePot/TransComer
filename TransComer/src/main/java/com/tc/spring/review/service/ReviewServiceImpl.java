package com.tc.spring.review.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.review.domain.Review;
import com.tc.spring.review.domain.ReviewPageInfo;
import com.tc.spring.review.store.ReviewStore;

@Service("reivewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewStore reviewStore;

	// 해당 글번호의 리뷰 리스트 불러오기
	@Override
	public ArrayList<Review> selectList(int personalNo) {
		return reviewStore.selectList(personalNo);
	}

	// 리뷰 등록, 데이터 삽입
	@Override
	public int insertReview(Review review) {
		return reviewStore.insertReview(review);
	}

	// 리뷰 번호에 해당하는 리뷰 하나 선택
	@Override
	public Review selectReview(int reviewNo) {
		return null;
	}

	// 해당 글번호의 별점 평균을 불러오기 (소수점 첫째자리까지)
	@Override
	public double selectStarRageAvg(int personalNo) {
		return reviewStore.selectStarRageAvg(personalNo);
	}

	// 해당 유저가 별점 리뷰를 받았는지 확인
	@Override
	public int checkHasReview(String memberId) {
		return reviewStore.checkHasReview(memberId);
	}

	// 해당 유저의 평균 평점을 가져온다
	@Override
	public double selectMemberStarRageAvg(String memberId) {
		return reviewStore.selectMemberStarRageAvg(memberId);
	}
}
