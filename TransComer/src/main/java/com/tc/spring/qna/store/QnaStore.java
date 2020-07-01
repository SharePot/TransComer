package com.tc.spring.qna.store;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.tc.spring.qna.domain.Qna;

/*@Repository("qnaStore")*/
public interface QnaStore {

	// 전체 조회
	public ArrayList<Qna> selectList();

	// QnA 등록
	public int insertQna(Qna qna);

	// QnA 상세조회
	public Qna selectQna(int qnaNo);

	// QnA 수정
	public int updateQna(Qna qna);

	// Qna 삭제
	public int deleteQna(int qnaNo);
}
