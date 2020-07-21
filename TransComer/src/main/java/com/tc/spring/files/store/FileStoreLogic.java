package com.tc.spring.files.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.files.domain.Files;

@Repository("fileStore")
public class FileStoreLogic implements FileStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Files> selectFileList(Files files) {
		return (ArrayList)sqlSession.selectList("filesMapper.selectFileList", files);
	}
	
	@Override
	public int insertFile(Files files) {
		return sqlSession.insert("filesMapper.insertFiles", files);
	}
	
	@Override
	public int updateFile(Files files) {
		return sqlSession.update("filesMapper.updateFiles", files);
	}

	@Override
	public int deleteFile(String filePath) {
		return sqlSession.delete("filesMapper.deleteFiles", filePath);
	}

	
	
}
