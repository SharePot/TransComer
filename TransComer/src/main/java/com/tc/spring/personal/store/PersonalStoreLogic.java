package com.tc.spring.personal.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalPageInfo;
import com.tc.spring.personal.domain.PersonalSearch;
import com.tc.spring.review.domain.Review;

@Repository("personalStore")
public class PersonalStoreLogic implements PersonalStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Personal> selectPersonalList(PersonalPageInfo pi) {
		System.out.println("Store 도착");
		int offset = (pi.getCurrentPage() - 1) * pi.getPersonalLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getPersonalLimit());
		return (ArrayList) sqlSession.selectList("personalMapper.selectList", null, rowBounds);
	}

	@Override
	public Personal selectOne(int personalNo) {
		return sqlSession.selectOne("personalMapper.selectPersonalOne", personalNo);
	}

	@Override
	public int getListCount() {
		return sqlSession.selectOne("personalMapper.getListCount");
	}

	@Override
	public int addReadCount(int personalNo) {
		return sqlSession.update("personalMapper.updateCount", personalNo);
	}

	@Override
	public int insertPersonal(Personal personal) {
		return sqlSession.insert("personalMapper.insertPersonal", personal);
	}

	@Override
	public int updatePersonal(Personal personal) {
		System.out.println("---store 결과 : " + sqlSession.update("personalMapper.updatePersonal", personal));
		System.out.println(">> store에 있습니다, personal :" + personal.toString());
		return sqlSession.update("personalMapper.updatePersonal", personal);
	}

	@Override
	public int deletePersonal(int personalNo) {
		return sqlSession.update("personalMapper.deletePersonal", personalNo);
	}

	@Override
	public ArrayList<Personal> searchPersonalList(PersonalSearch search, PersonalPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getPersonalLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getPersonalLimit());
		return (ArrayList) sqlSession.selectList("personalMapper.searchPersonalList", search, rowBounds);
	}

	@Override
	public int getSearchListCount(PersonalSearch search) {
		return sqlSession.selectOne("personalMapper.getSearchListCount", search);
	}
	
	@Override
	public int insertReview(Review review) {
		return sqlSession.insert("personalMapper.insertReview", review);
	}
	
	
}
