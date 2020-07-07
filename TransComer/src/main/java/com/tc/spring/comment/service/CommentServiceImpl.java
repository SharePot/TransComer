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
	public ArrayList<Comment> selectCommentList(int shareNo,int qnaNo,int studyNo) {
		return commentStore.selectCommentList(shareNo, qnaNo, studyNo);
	}

	@Override
	public int insertComment(Comment comment) {
		return commentStore.insertComment(comment);
	}

	@Override
	public int updateComment(Comment comment) {
		return commentStore.updateComment(comment);
	}

	@Override
	public int deleteComment(int commentNo) {
		return commentStore.deleteComment(commentNo);
	}

	@Override
	public int getCommentListCount() {
		return commentStore.getCommentListCount();
	}
}
