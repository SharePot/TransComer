package com.tc.spring.personal.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.personal.domain.Personal;

@Repository("personalStore")
public class PersonalStoreLogic implements PersonalStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Personal> selectList() {
		return (ArrayList)sqlSession.selectList("personalMapper.selectList");
	}

	@Override
	public Personal selectOne() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPersonl() {
		// TODO Auto-generated method stub
		return 0;
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
}
