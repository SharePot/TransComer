package com.tc.spring.review.store;

import java.util.ArrayList;

import com.tc.spring.review.domain.Review;
import com.tc.spring.review.domain.ReviewPageInfo;

public interface ReviewStore {

	/**
	 * 해당 글번호의 리뷰 리스트 불러오기
	 * @param personalNo
	 * @return
	 */
	public ArrayList<Review> selectList(int personalNo);

	/**
	 * 리뷰 등록, 데이터 삽입
	 * @param review
	 * @return
	 */
	public int insertReview(Review review);

	/**
	 * 리뷰 번호에 해당하는 리뷰 하나 선택
	 * @param reviewNo
	 * @return
	 */
	public Review selectReview(int reviewNo);
	
	/**
	 * 해당 글번호의 별점 평균을 불러오기 (소수점 첫째자리까지)
	 * @param pesonalNo
	 * @return
	 */
	public double selectStarRageAvg(int personalNo);
	
	/**
	 * 해당 유저가 별점 리뷰를 받았는지 확인
	 * @param memberId
	 * @return
	 */
	public int checkHasReview(String memberId);
	
	/**
	 * 해당 유저의 평균 평점을 가져온다
	 * @param memberId
	 * @return
	 */
	public double selectMemberStarRageAvg(String memberId);
}
