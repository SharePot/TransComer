package com.tc.spring.files.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.files.service.FileService;

@Controller
public class FileController {

	@Autowired
	private FileService fileService;
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		return null;
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		
	}
}
