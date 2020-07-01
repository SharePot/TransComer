package com.tc.spring.share.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tc.spring.share.service.ShareService;

@Controller
public class ShareController {

	@Autowired
	private ShareService shareService;
}
