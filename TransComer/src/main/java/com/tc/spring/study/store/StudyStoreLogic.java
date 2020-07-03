package com.tc.spring.study.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.study.domain.Study;

@Repository("studyStore")
public class StudyStoreLogic implements StudyStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

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
}
