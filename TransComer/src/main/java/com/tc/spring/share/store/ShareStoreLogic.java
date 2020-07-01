package com.tc.spring.share.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("shareStore")
public class ShareStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
