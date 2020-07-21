package com.tc.spring.files.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.files.domain.Files;
import com.tc.spring.files.store.FileStore;

@Service("fileService")
public class FileServiceImpl implements FileService{

	@Autowired
	private FileStore fileStore;
	
	@Override
	public ArrayList<Files> selectFileList(Files files) {
		return fileStore.selectFileList(files);
	}

	@Override
	public int insertFile(Files files, MultipartFile file, HttpServletRequest request) {
		return fileStore.insertFile(files);
	}
	
	@Override
	public int updateFile(Files files) {
		return fileStore.updateFile(files);
	}

	@Override
	public int deleteFile(String filePath) {
		return fileStore.deleteFile(filePath);
	}
	
}
