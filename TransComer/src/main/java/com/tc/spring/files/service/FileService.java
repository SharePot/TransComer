package com.tc.spring.files.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.files.domain.Files;

public interface FileService {

	public int insertFile(Files files, MultipartFile file, HttpServletRequest request);
	
	public int updateFile(Files files);
	
	public int deleteFile(String filePath);
}
