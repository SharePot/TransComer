package com.tc.spring.files.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.files.domain.Files;
import com.tc.spring.files.store.FileStore;

@Service("fileService")
public class FileServiceImpl implements FileService{

	@Autowired
	private FileStore fileStore;

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
