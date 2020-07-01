package com.tc.spring.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tc.spring.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
}
