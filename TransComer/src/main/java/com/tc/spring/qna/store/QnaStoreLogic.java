package com.tc.spring.qna.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("qnaStore")
public class QnaStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
