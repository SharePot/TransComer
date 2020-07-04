package com.tc.spring.study.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.study.domain.Study;
import com.tc.spring.study.domain.StudySearch;
import com.tc.spring.study.store.StudyStore;

@Service("studyService")
public class StudyServiceImpl implements StudyService {

	@Autowired
	private StudyStore studyStore;

	@Override
	public ArrayList<Study> selectStudyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Study selectStudyOne(int studyNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertStudy(Study study) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateStudy(int studyNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStudy(int studyNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList SearchStudyList(StudySearch search) {
		// TODO Auto-generated method stub
		return null;
	}
}
