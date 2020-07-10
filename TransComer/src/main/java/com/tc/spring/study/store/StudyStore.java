package com.tc.spring.study.store;

import java.util.ArrayList;

import com.tc.spring.study.domain.Study;
import com.tc.spring.study.domain.StudyPageInfo;
import com.tc.spring.study.domain.StudySearch;

public interface StudyStore {
	
	
	/**
	 * 게시글 전체수 조회
	 * @return
	 */
	public int getListCount();
	
	/**
	 * 조회수 증가
	 * @param studyNo
	 * @return
	 */
	public int addReadCount(int studyNo);
	/**
	 * 스터디 전체 리스트 조회
	 * @return
	 */
	public ArrayList<Study> selectStudyList(StudyPageInfo pi);
	
	/**
	 * 스터디 한개 상세 조회
	 * @param studyNo
	 * @return
	 */
	public Study selectStudyOne(int studyNo);
	/**
	 * 스터디 삽입
	 * @param study
	 * @return
	 */
	public int insertStudy(Study study);
	/**
	 * 스터디 수정
	 * @param studyNo
	 * @return
	 */
	public int updateStudy(Study study);
	/**
	 * 스터디 삭제
	 * @param studyNo
	 * @return
	 */
	public int deleteStudy(int studyNo);
	
	/**
	 * 스터디 검색
	 * @param search
	 * @return
	 */
	public ArrayList SearchStudyList(StudySearch search);
}

