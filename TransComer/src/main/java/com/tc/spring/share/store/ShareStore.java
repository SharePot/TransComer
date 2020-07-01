package com.tc.spring.share.store;

import java.util.ArrayList;

import com.tc.spring.share.domain.Share;

public interface ShareStore {
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

}
