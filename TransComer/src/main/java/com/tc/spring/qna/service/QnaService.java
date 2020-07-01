package com.tc.spring.qna.service;

import java.util.ArrayList;

import com.tc.spring.qna.domain.Qna;
import com.tc.spring.qna.domain.QnaPageInfo;

public interface QnaService {

	// 전체 조회
	public ArrayList<Qna> selectList(QnaPageInfo qPi);
	
	//  QnA 등록
	public int insertQna(Qna qna);
	
	// QnA 상세조회
	public Qna selectQna(int qnaNo);
	
	// QnA 수정
	public int updateQna(Qna qna);
	
	// Qna 삭제
	public int deleteQna(int qnaNo);
	
	/*
	// Qna 댓글 조회
	public ArrayList<>selectReplyList(int memberId);
	
	// Qna 댓글 등록
	public int insertReply()
	*/
	
}
