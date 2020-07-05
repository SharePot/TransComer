package com.tc.spring.study.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.study.domain.Study;
import com.tc.spring.study.domain.StudyPageInfo;
import com.tc.spring.study.domain.StudySearch;

public interface StudyService {
	
	/**
	 * 스터디 조회수 증가
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
	 * 스터디 게시판 전체 수 조회
	 * @return
	 */
	public int getListCount();
	
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
	public int insertStudy(Study study, MultipartFile file, HttpServletRequest request);
	/**
	 * 스터디 수정
	 * @param study
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
	public ArrayList searchStudyList(StudySearch search);



	
}
