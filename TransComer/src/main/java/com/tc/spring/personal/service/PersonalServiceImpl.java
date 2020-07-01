package com.tc.spring.personal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.personal.store.PersonalStore;

@Service("personalService")
public class PersonalServiceImpl {

	@Autowired
	private PersonalStore personalStore;
}
