package com.tc.spring.simple.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("simpleStore")
public class SimpleStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
