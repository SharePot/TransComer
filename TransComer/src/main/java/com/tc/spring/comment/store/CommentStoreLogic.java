package com.tc.spring.comment.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.comment.domain.Comment;
import com.tc.spring.comment.domain.CommentPageInfo;

@Repository("commentStore")
public class CommentStoreLogic implements CommentStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

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
