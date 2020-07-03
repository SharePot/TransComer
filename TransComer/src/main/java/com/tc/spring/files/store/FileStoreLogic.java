package com.tc.spring.files.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.files.domain.Files;

@Repository("fileStore")
public class FileStoreLogic implements FileStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertFile(Files files) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFile(int fileNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
