package com.tc.spring.qna.store;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.tc.spring.qna.domain.Qna;
import com.tc.spring.qna.domain.QnaPageInfo;
import com.tc.spring.qna.domain.QnaSearch;

/*@Repository("qnaStore")*/
public interface QnaStore {

	// 전체 게시글 수
	public int getListCount();
	
	// 전체 조회
	public ArrayList<Qna> selectList(QnaPageInfo qPi);

	// 조회수 증가
	public int addReadCount(int qnaNo);
	
	// 글 검색
	public ArrayList<Qna> searchList(QnaPageInfo qPi, QnaSearch qnaSearch);
	
	// QnA 등록
	public int insertQna(Qna qna);

	// QnA 상세조회
	public Qna selectQna(int qnaNo);

	// QnA 수정
	public int updateQna(Qna qna);

	// Qna 삭제
	public int deleteQna(int qnaNo);
}
