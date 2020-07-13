package com.tc.spring.study.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.study.domain.Study;
import com.tc.spring.study.domain.StudyPageInfo;
import com.tc.spring.study.domain.StudySearch;
import com.tc.spring.study.store.StudyStore;

@Service("studyService")
public class StudyServiceImpl implements StudyService {

	@Autowired
	private StudyStore studyStore;

	@Override
	public int getListCount() {
		return studyStore.getListCount();
	}
	
	@Override
	public ArrayList<Study> selectStudyList(StudyPageInfo pi) {
		return studyStore.selectStudyList(pi);
	}

	@Override
	public Study selectStudyOne(int studyNo) {
		return studyStore.selectStudyOne(studyNo);
	}

	@Override
	public int insertStudy(Study study, MultipartFile file, HttpServletRequest request) {
		study.setStudyContent(study.getStudyContent().replace("\n", "<br>"));
		return studyStore.insertStudy(study);
	}

	@Override
	public int updateStudy(Study study) {
		study.setStudyContent(study.getStudyContent().replace("\n", "<br>"));
		return studyStore.updateStudy(study);
	}

	@Override
	public int deleteStudy(int studyNo) {
		return studyStore.deleteStudy(studyNo);
	}

	@Override
	public ArrayList<Study> searchStudyList(StudySearch search) {
		return studyStore.searchStudyList(search);
	}

	@Override
	public int addReadCount(int studyNo) {
		return studyStore.addReadCount(studyNo);
	}


}
