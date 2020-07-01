package com.tc.spring.files.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tc.spring.files.service.FileService;

@Controller
public class FileController {

	@Autowired
	private FileService fileService;
}
