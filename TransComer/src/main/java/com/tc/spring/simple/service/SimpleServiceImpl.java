package com.tc.spring.simple.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.simple.store.SimpleStore;

@Service("simpleService")
public class SimpleServiceImpl {

	@Autowired
	private SimpleStore simpleStore;
}
