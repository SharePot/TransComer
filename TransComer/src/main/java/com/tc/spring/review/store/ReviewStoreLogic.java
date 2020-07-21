package com.tc.spring.review.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.review.domain.Review;
import com.tc.spring.review.domain.ReviewPageInfo;

@Repository("reviewStore")
public class ReviewStoreLogic implements ReviewStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Review> selectList(int personalNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewList", personalNo);
	}

	@Override
	public int insertReview(Review review) {
		return sqlSession.insert("reviewMapper.insertReview", review);
	}

	@Override
	public Review selectReview(int reviewNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
