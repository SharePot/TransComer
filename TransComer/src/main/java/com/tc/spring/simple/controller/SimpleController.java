package com.tc.spring.simple.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tc.spring.simple.service.SimpleService;

@Controller
public class SimpleController {

	@Autowired
	private SimpleService simpleService;
}
