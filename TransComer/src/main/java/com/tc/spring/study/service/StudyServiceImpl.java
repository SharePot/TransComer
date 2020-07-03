package com.tc.spring.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.study.store.StudyStore;

@Service("studyService")
public class StudyServiceImpl implements StudyService {

	@Autowired
	private StudyStore studyStore;
}
