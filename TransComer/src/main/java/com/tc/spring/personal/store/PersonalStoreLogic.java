package com.tc.spring.personal.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("personalStore")
public class PersonalStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
