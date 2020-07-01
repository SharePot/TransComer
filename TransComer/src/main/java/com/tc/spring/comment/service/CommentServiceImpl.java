package com.tc.spring.comment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.comment.store.CommentStore;

@Service("commentService")
public class CommentServiceImpl {

	@Autowired
	private CommentStore commentStore;
}
