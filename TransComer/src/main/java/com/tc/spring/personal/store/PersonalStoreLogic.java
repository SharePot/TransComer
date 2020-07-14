package com.tc.spring.personal.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalSearch;

@Repository("personalStore")
public class PersonalStoreLogic implements PersonalStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Personal> selectPersonalList() {
		System.out.println("Store 도착");
		return (ArrayList)sqlSession.selectList("personalMapper.selectList");
	}

	@Override
	public Personal selectOne() {
		// TODO Auto-generated method stub
		return null;
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
	public ArrayList<Personal> searchPersonalList(PersonalSearch search) {
		return (ArrayList)sqlSession.selectList("personalMapper.searchPersonalList", search);
	}
}
