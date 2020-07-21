package com.tc.spring.files.store;

import java.util.ArrayList;

import com.tc.spring.files.domain.Files;

public interface FileStore {
	
	public ArrayList<Files> selectFileList(Files files);

	public int insertFile(Files files);
	
	public int updateFile(Files files);
	
	public int deleteFile(String filePath);
}
