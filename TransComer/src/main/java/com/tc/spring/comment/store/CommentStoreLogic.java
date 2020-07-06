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
	public ArrayList<Comment> selectCommentList(CommentPageInfo cPi,int shareNo,int qnaNo,int studyNo) {
		int offset=(cPi.getCommentCurrentPage()-1) * cPi.getCommentBoardLimit();
		RowBounds rowBounds=new RowBounds(offset, cPi.getCommentBoardLimit());
		return (ArrayList)sqlSession.selectList("commentMapper.selectCommentList",null,rowBounds);
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
	public int getCommentListCount() {
		return sqlSession.selectOne("commentMapper.getCommentListCount");
	}
}
