package com.tc.spring.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.member.store.MemberStore;

@Service("memberService")
public class MemberServiceImpl {

	@Autowired
	private MemberStore memberStore;
}
