package com.tc.spring.comment.store;

import java.util.ArrayList;

import com.tc.spring.comment.domain.Comment;
import com.tc.spring.comment.domain.CommentPageInfo;

public interface CommentStore {

	public ArrayList<Comment> selectCommentList(Comment comment);

	public int getCommentListCount(Comment comment);
	
	public int insertComment(Comment comment);
	
	public int updateComment(Comment comment);
	
	public int deleteComment(int commentNo);
}
