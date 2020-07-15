package com.tc.spring.personal.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalPageInfo;
import com.tc.spring.personal.domain.PersonalSearch;

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
	public Personal selectOne() {
		// TODO Auto-generated method stub
		return null;
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
	public int updatePersonal() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePersonal() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Personal> searchPersonalList(PersonalSearch search, PersonalPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getPersonalLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getPersonalLimit());
		return (ArrayList) sqlSession.selectList("personalMapper.searchPersonalList", search, rowBounds);
	}

	@Override
	public int getSearchListCount(PersonalSearch search) {
		//System.out.println("===스토어가 가져온 갯수 : " + sqlSession.selectOne("personalMapper.getSearchListCount",search));
		return sqlSession.selectOne("personalMapper.getSearchListCount", search);
	}
}
