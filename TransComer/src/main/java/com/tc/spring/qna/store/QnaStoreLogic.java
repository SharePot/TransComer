package com.tc.spring.qna.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.qna.domain.Qna;

@Repository("qnaStore")
public class QnaStoreLogic implements QnaStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Qna> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertQna(Qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Qna selectQna(int qnaNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateQna(Qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQna(int qnaNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
