package com.tc.spring.study.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("studyStore")
public class StudyStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
