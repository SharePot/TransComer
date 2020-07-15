package com.tc.spring.study.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.study.domain.Study;
import com.tc.spring.study.domain.StudyPageInfo;
import com.tc.spring.study.domain.StudySearch;

@Repository("studyStore")
public class StudyStoreLogic implements StudyStore{

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public int getListCount() {
		return sqlSession.selectOne("studyMapper.getStudyListCount");
	}

	@Override
	public int addReadCount(int studyNo) {
		return sqlSession.update("studyMapper.updateStudyCount",studyNo);
	}

	@Override
	public ArrayList<Study> selectStudyList(StudyPageInfo pi) {
		int offset=(pi.getStudyCurrentPage() -1)* pi.getStudyBoardLimit();
		RowBounds rowbounds =new RowBounds(offset,pi.getStudyBoardLimit());
		return (ArrayList)sqlSession.selectList("studyMapper.selectStudyList",null,rowbounds);
	}

	@Override
	public Study selectStudyOne(int studyNo) {
		return sqlSession.selectOne("studyMapper.selectStudyOne",studyNo);
	}

	@Override
	public int insertStudy(Study study) {
		return sqlSession.insert("studyMapper.insertStudy",study);
	}

	@Override
	public int updateStudy(Study study) {
		return sqlSession.update("studyMapper.updateStudy",study);
	}

	@Override
	public int deleteStudy(int studyNo) {
		return sqlSession.delete("studyMapper.deleteStudy",studyNo);
	}

	@Override
	public ArrayList<Study> searchStudyList(StudySearch search,StudyPageInfo pi) {
		int offset=(pi.getStudyCurrentPage() -1)* pi.getStudyBoardLimit();
		RowBounds rowbounds =new RowBounds(offset,pi.getStudyBoardLimit());
		return (ArrayList)sqlSession.selectList("studyMapper.searchStudyList",search,rowbounds);
	}

	@Override
	public int getSearchListCount(StudySearch search) {
		return sqlSession.selectOne("studyMapper.getStudySearchListCount",search);
	}

	
}
