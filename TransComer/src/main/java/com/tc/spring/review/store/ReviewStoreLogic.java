package com.tc.spring.review.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reviewStore")
public class ReviewStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
