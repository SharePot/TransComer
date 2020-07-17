package com.tc.spring.personal.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalPageInfo;
import com.tc.spring.personal.domain.PersonalSearch;
import com.tc.spring.review.domain.Review;
import com.tc.spring.study.domain.StudySearch;

public interface PersonalService {

	public ArrayList<Personal> selectPersonalList(PersonalPageInfo pi);

	/**
	 * 1:1의뢰 게시판 전체 조회 서비스
	 * @param personalNoint 
	 * 
	 * @param
	 * @return list
	 */

	public Personal selectOne(int personalNo);

	/**
	 * 1:1의뢰 게시판 상세조회용 서비스
	 * 
	 * @param
	 * @return
	 */

	public int getListCount();

	/**
	 * 1:1 의뢰 게시판 전체 수 조회
	 * 
	 * @param personalNo
	 * @return
	 */

	public int addReadCount(int personalNo);

	/**
	 * 1:1 의뢰 게시판 상세 조회시 조회수 증가
	 * 
	 * @param personalNo
	 * @return
	 */

	public int insertPersonal(Personal personal, MultipartFile file, HttpServletRequest request);

	/**
	 * 1:1의뢰 게시판 등록 서비스
	 * 
	 * @param
	 * @return
	 */

	public int updatePersonal(Personal personal);

	/**
	 * 1:1의뢰 게시판 수정용 서비스
	 * 
	 * @param
	 * @return
	 */

	public int deletePersonal(int personalNo);

	/**
	 * 1:1의뢰 게시판 삭제용 서비스
	 * 
	 * @param
	 * @return
	 */

	public ArrayList<Personal> searchPersonalList(PersonalSearch search, PersonalPageInfo pi);

	/**
	 * 1:1 게시판 검색
	 * 
	 * @param search
	 * @return
	 */

	public int getSearchListCount(PersonalSearch search);
	/**
	 * 1:1 의뢰 게시판 검색한 결과 갯수 조회
	 * 
	 * @param personalNo
	 * @return
	 */

	public int insertReview(Review review);
}