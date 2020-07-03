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
	public ArrayList<Review> selectList(ReviewPageInfo rPi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Review selectReview(int reviewNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
