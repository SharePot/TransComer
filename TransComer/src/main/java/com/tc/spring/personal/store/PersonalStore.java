package com.tc.spring.personal.store;

import java.util.ArrayList;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalPageInfo;
import com.tc.spring.personal.domain.PersonalReqRep;
import com.tc.spring.personal.domain.PersonalSearch;

public interface PersonalStore {

	/**
	 * 1:1의뢰 게시판 전체 조회 서비스
	 * 
	 * @param pi
	 * @return
	 */
	public ArrayList<Personal> selectPersonalList(PersonalPageInfo pi);

	/**
	 * 1:1의뢰 게시판 상세조회용 서비스
	 * 
	 * @param personalNo
	 * @return
	 */
	public Personal selectOne(int personalNo);

	/**
	 * 1:1 의뢰 게시판 전체 수 조회
	 * 
	 * @return
	 */
	public int getListCount();

	/**
	 * 1:1 의뢰 게시판 상세 조회시 조회수 증가
	 * 
	 * @param personalNo
	 * @return
	 */
	public int addReadCount(int personalNo);

	/**
	 * 1:1의뢰 게시판 등록 서비스
	 * 
	 * @param personal
	 * @return
	 */
	public int insertPersonal(Personal personal);

	/**
	 * 1:1의뢰 게시판 수정용 서비스
	 * 
	 * @param personal
	 * @return
	 */
	public int updatePersonal(Personal personal);

	/**
	 * 1:1의뢰 게시판 삭제용 서비스
	 * 
	 * @param
	 * @return
	 */
	public int deletePersonal(int personalNo);

	/**
	 * 1:1 게시판 검색
	 * 
	 * @param search
	 * @return
	 */
	public ArrayList<Personal> searchPersonalList(PersonalSearch search, PersonalPageInfo pi);

	/**
	 * 1:1 의뢰 게시판 검색한 결과 갯수 조회
	 * 
	 * @param search
	 * @return
	 */
	public int getSearchListCount(PersonalSearch search);

	/**
	 * 1:1 의뢰 신청 등록
	 * 
	 * @param personalReqRep
	 * @return
	 */
	public int insertRequest(PersonalReqRep personalReqRep);

	/**
	 * 1:1 파일의 마지막 번호를 불러옴
	 * 
	 * @param memberId
	 * @return
	 */
	public int selectPersonalLastNo(String memberId);

	// ================ 0723 ~ 현꾸 작성 ==============
	/**
	 * 의뢰 신청한 목록 보기
	 * 
	 * @param memberId
	 * @return
	 */
	public ArrayList<PersonalReqRep> selectDoReqRepList(String memberId);

	/**
	 * 의뢰 신청글 갯수
	 * 
	 * @param memberId
	 * @return
	 */
	public int doReqRepListCnt(String memberId);

	/**
	 * 의뢰 받은 목록 보기
	 * 
	 * @param memberId
	 * @return
	 */
	public ArrayList<PersonalReqRep> selectGetReqRepList(String memberId);

	/**
	 * 의뢰 받은글 갯수
	 * 
	 * @param memberId
	 * @return
	 */
	public int getReqRepListCnt(String memberId);

	/**
	 * 의뢰 신청 데이터 한개 상세 조회
	 * 
	 * @param pReqNo
	 * @return
	 */
	public PersonalReqRep selectReqRepOne(int pReqNo);

	/**
	 * 의뢰 신청 글 상태바꾸기 (Accept : 'C', 'Y', 'R',)
	 * 
	 * @param personalReqRep
	 * @return
	 */
	public int updateReqRepAccept(PersonalReqRep personalReqRep);

	/**
	 * 의뢰 결과 글 작성 - 번역 결과 내용 업데이트, Accept : 'F'
	 * 
	 * @param personalReqRep
	 * @return
	 */
	public int updateReqRepResult(PersonalReqRep personalReqRep);

	/**
	 * 의뢰 결과 글 구매 확정하기(CheckBuy : 'Y')
	 * 
	 * @param pReqNo
	 * @return
	 */
	public int updateReqRepCheckBuyY(int pReqNo);
	
	/**
	 * 해당 유저의 해당 글 과거 구매완료 기록이 있는지 확인
	 * @param personalReqRep
	 * @return
	 */
	public int checkBuyYHistory(PersonalReqRep personalReqRep);		
}