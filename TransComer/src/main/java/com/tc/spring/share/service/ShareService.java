package com.tc.spring.share.service;

import java.util.ArrayList;

import com.tc.spring.share.domain.Share;

public interface ShareService {

	/**
	 * 자료공유 전체 리스트 조회
	 * 
	 * @return
	 */
	public ArrayList<Share> selectShareList();

	/**
	 * 자료공유 한개 상세 조회
	 * 
	 * @param shareNo
	 * @return
	 */
	public Share selectShareOne(int shareNo);

	/**
	 * 자료공유 삽입
	 * 
	 * @param share
	 * @return
	 */
	public int insertShare(Share share);

	/**
	 * 자료공유 삭제
	 * 
	 * @param shareNo
	 * @return
	 */
	public int deleteShare(int shareNo);

	/**
	 * 관리자가 번역공유 신청글 전체 조회
	 * 
	 * @return
	 */
	public ArrayList<Share> adminShareList();

	/**
	 * 관리자가 번역공유 신청글 상세 조회
	 * 
	 * @param shareNo
	 * @return
	 */
	public Share adminSelectShareOne(int shareNo);

	/**
	 * 관리자가 번역공유 신청글 '승인'(Y)하기
	 * 
	 * @param shareNo
	 * @return
	 */
	public int updateShareYnY(int shareNo);

	/**
	 * 관리자가 번역공유 신청글 '반려'(R)하기
	 * 
	 * @param shareNo
	 * @return
	 */
	public int updateShareYnR(int shareNo);
}
