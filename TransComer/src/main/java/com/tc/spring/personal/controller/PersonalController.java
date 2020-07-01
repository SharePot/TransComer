package com.tc.spring.personal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tc.spring.personal.service.PersonalService;

@Controller
public class PersonalController {

	@Autowired
	private PersonalService personalService;
}
