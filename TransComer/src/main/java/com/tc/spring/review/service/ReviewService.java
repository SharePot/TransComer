package com.tc.spring.review.service;

import java.util.ArrayList;

import com.tc.spring.review.domain.Review;
import com.tc.spring.review.domain.ReviewPageInfo;

public interface ReviewService {

	public ArrayList<Review> selectList(int personalNo);
	
	public int insertReview(Review review);
	
	public Review selectReview(int reviewNo);

}
