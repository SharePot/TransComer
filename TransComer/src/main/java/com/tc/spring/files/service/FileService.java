package com.tc.spring.files.service;

import com.tc.spring.files.domain.Files;

public interface FileService {

	public int insertFile(Files files);
	
	public int deleteFile(int fileNo);
}
