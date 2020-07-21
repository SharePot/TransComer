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

	@Override
	public ArrayList<Review> selectList(int personalNo) {
		return reviewStore.selectList(personalNo);
	}

	@Override
	public int insertReview(Review review) {
		return reviewStore.insertReview(review);
	}

	@Override
	public Review selectReview(int reviewNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
