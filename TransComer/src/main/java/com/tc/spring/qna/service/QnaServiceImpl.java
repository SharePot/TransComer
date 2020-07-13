package com.tc.spring.qna.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.qna.domain.Qna;
import com.tc.spring.qna.domain.QnaPageInfo;
import com.tc.spring.qna.domain.QnaSearch;
import com.tc.spring.qna.store.QnaStore;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaStore qnaStore;

	@Override
	public int getListCount() {
		return qnaStore.getListCount();
	}
	
	@Override
	public int getAdminListCount() {
		return qnaStore.getAdminListCount();
	}
	
	@Override
	public ArrayList<Qna> selectList(QnaPageInfo qPi) {
		return qnaStore.selectList(qPi);
	}
	
	@Override
	public ArrayList<Qna> selectAdminQnaList(QnaPageInfo qPi) {
		return qnaStore.selectAdminQnaList(qPi);
	}
	
	@Override
	public int addReadCount(int qnaNo) {
		return qnaStore.addReadCount(qnaNo);
	}
	
	@Override
	public ArrayList<Qna> searchList(QnaPageInfo qPi, QnaSearch qnaSearch) {
		return qnaStore.searchList(qPi, qnaSearch);
	}
	
	@Override
	public Qna selectQna(int qnaNo) {
		return qnaStore.selectQna(qnaNo);
	}

	@Override
	public int insertQna(Qna qna, HttpServletRequest request) {
		return qnaStore.insertQna(qna);
	}


	@Override
	public int updateQna(Qna qna) {
		return qnaStore.updateQna(qna);
	}

	@Override
	public int deleteQna(int qnaNo) {
		return qnaStore.deleteQna(qnaNo);
	}
	

}
