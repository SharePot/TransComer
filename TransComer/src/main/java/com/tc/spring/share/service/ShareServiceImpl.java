package com.tc.spring.share.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.share.store.ShareStore;

@Service("shareService")
public class ShareServiceImpl {

	@Autowired
	private ShareStore shareStore;
}
