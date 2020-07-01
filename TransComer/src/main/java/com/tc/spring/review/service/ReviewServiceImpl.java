package com.tc.spring.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.review.store.ReviewStore;

@Service("reivewService")
public class ReviewServiceImpl {

	@Autowired
	private ReviewStore reviewStore;
}
