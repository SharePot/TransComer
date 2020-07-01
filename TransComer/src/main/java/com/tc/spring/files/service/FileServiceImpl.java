package com.tc.spring.files.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.files.store.FileStore;

@Service("fileService")
public class FileServiceImpl {

	@Autowired
	private FileStore fileStore;
}
