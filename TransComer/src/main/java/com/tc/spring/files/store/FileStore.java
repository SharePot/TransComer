package com.tc.spring.files.store;

import com.tc.spring.files.domain.Files;

public interface FileStore {

	public int insertFile(Files files);
	
	public int deleteFile(int fileNo);
}
