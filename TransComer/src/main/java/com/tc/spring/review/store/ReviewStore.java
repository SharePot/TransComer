package com.tc.spring.review.store;

import java.util.ArrayList;

import com.tc.spring.review.domain.Review;
import com.tc.spring.review.domain.ReviewPageInfo;

public interface ReviewStore {

	public ArrayList<Review> selectList(int personalNo);

	public int insertReview(Review review);

	public Review selectReview(int reviewNo);
}
