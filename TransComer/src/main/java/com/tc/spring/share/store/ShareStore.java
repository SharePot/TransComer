package com.tc.spring.share.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.tc.spring.files.domain.Files;
import com.tc.spring.share.domain.Share;
import com.tc.spring.share.domain.SharePageInfo;
import com.tc.spring.share.domain.ShareSearch;

public interface ShareStore {
	
	// 전체 게시글 수
		public int getListCount();
		
		// 관리자 문의 게시글 수
		public int getAdminListCount();
		
		// 검색 게시글 수
		public int getSearchListCount(ShareSearch shareSearch);
		
		// 조회수 증가
		public int addReadCount(int ShareNo);
		
		// 글 검색
		public ArrayList<Share> searchShareList(ShareSearch shareSearch, SharePageInfo sPi);

		// 글 등록
		public int insertShare(Share share);
		
		
		// 글 상세조회
		public Share selectShare(int shareNo);

		// 글  수정
		public int updateShare(Share share);

		// 글 제
		public int deleteShare(int shareNo);

		public ArrayList<Share> selectAllList(SharePageInfo sPi);

		public int insertFile(Files f);
		
		public int selectShareLatestNo(String memberId);

		/**
		 * 관리자가 번역공유 신청글 전체 조회
		 * @return
		 */
		public ArrayList<Share> adminShareList();
		
		/**
		 * 관리자가 번역공유 신청글 상세 조회
		 * @param shareNo
		 * @return
		 */
		public Share adminSelectShareOne(int shareNo);
		
		/**
		 * 관리자가 번역공유 신청글 '승인'(Y)하기
		 * @param shareNo
		 * @return
		 */
		public int updateShareYnY(int shareNo);
		
		/**
		 * 관리자가 번역공유 신청글 '반려'(R)하기
		 * @param shareNo
		 * @return
		 */
		public int updateShareYnR(int shareNo);
}	
	
	/**
	 * 자료공유 전체 리스트 조회
	 * 
	 * @return
	 */
	/* public ArrayList<Share> selectShareList(); */

	/**
	 * 자료공유 한개 상세 조회
	 * 
	 * @param shareNo
	 * @return
	 */
	/* public Share selectShareOne(int shareNo); */

	/**
	 * 자료공유 삽입
	 * 
	 * @param share
	 * @return
	 */
	/* public int insertShare(Share share); */

	/**
	 * 자료공유 삭제
	 * 
	 * @param shareNo
	 * @return
	 */
	/* public int deleteShare(int shareNo); */

