package com.tc.spring.chat.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("chatStore")
public class ChatStoreLogic {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
