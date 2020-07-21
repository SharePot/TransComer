package com.tc.spring.comment.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
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
	public ArrayList<Comment> selectCommentList(Comment comment) {
		return (ArrayList)sqlSession.selectList("commentMapper.selectCommentList",comment);
	}

	@Override
	public int insertComment(Comment comment) {
		return sqlSession.insert("commentMapper.insertComment",comment);
	}

	@Override
	public int updateComment(Comment comment) {
		return sqlSession.update("commentMapper.updateComment",comment);
	}

	@Override
	public int deleteComment(int commentNo) {
		return sqlSession.delete("commentMapper.deleteComment",commentNo);
	}

	@Override
	public int getCommentListCount(Comment comment) {
		return sqlSession.selectOne("commentMapper.getCommentListCount",comment);
	}
}
