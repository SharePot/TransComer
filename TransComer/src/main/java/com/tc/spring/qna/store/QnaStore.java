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
	
	// 관리자 문의 게시글 수
	public int getAdminListCount();
	
	// 검색 게시글 수
	public int getSearchListCount(QnaSearch qnaSearch);
	
	// 전체 조회
	public ArrayList<Qna> selectList(QnaPageInfo qPi);
	
	// 관리자 문의 조회
	public ArrayList<Qna> selectAdminQnaList(QnaPageInfo qPi);

	// 조회수 증가
	public int addReadCount(int qnaNo);
	
	// 글 검색
	public ArrayList<Qna> searchQnaList(QnaSearch qnaSearch, QnaPageInfo qPi);
	
	// QnA 등록
	public int insertQna(Qna qna);

	// QnA 상세조회
	public Qna selectQna(int qnaNo);
	
	// QnA 최신글 번호 조회
	public int selectQnaLatestNo(String memberId);

	// QnA 수정
	public int updateQna(Qna qna);

	// Qna 삭제
	public int deleteQna(int qnaNo);
}
