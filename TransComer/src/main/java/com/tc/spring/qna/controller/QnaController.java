package com.tc.spring.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tc.spring.qna.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
}
