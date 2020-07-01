package com.tc.spring.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.qna.store.QnaStore;

@Service("qnaService")
public class QnaServiceImpl {

	@Autowired
	private QnaStore qnaStore;
}
