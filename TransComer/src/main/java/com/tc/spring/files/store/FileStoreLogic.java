package com.tc.spring.files.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("fileStore")
public class FileStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
