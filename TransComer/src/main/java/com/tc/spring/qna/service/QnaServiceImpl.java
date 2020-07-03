package com.tc.spring.qna.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.qna.domain.Qna;
import com.tc.spring.qna.domain.QnaPageInfo;
import com.tc.spring.qna.store.QnaStore;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaStore qnaStore;

	@Override
	public ArrayList<Qna> selectList(QnaPageInfo qPi) {
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
