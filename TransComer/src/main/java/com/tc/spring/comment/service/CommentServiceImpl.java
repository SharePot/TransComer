package com.tc.spring.comment.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.comment.domain.Comment;
import com.tc.spring.comment.domain.CommentPageInfo;
import com.tc.spring.comment.store.CommentStore;

@Service("commentService")
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentStore commentStore;

	@Override
	public ArrayList<Comment> selectCommentList(CommentPageInfo cPi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertAlarm(Comment comment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComment(Comment comment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAlarm(int commentNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
