package com.tc.spring.study.store;

import java.util.ArrayList;

import com.tc.spring.study.domain.Study;
import com.tc.spring.study.domain.StudySearch;

public interface StudyStore {
	
	/**
	 * 스터디 전체 리스트 조회
	 * @return
	 */
	public ArrayList<Study> selectStudyList();
	
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

