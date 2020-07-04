package com.tc.spring.study.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.study.domain.Study;
import com.tc.spring.study.domain.StudySearch;

@Repository("studyStore")
public class StudyStoreLogic implements StudyStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Study> selectStudyList() {
		return (ArrayList)sqlSession.selectList("studyMapper.selectStudyList");
	}

	@Override
	public Study selectStudyOne(int studyNo) {
		return null;
	}

	@Override
	public int insertStudy(Study study) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateStudy(Study study) {
		return 0;
	}

	@Override
	public int deleteStudy(int studyNo) {
		return sqlSession.delete("studyMapper.deleteStudy",studyNo);
	}

	@Override
	public ArrayList SearchStudyList(StudySearch search) {
		return (ArrayList)sqlSession.selectList("studyMapper.searchStudyList",search);
	}
}
