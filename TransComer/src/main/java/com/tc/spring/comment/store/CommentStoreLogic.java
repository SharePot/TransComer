package com.tc.spring.comment.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("commentStore")
public class CommentStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
