package com.tc.spring.qna.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.qna.domain.Qna;
import com.tc.spring.qna.domain.QnaPageInfo;
import com.tc.spring.qna.domain.QnaSearch;

public interface QnaService {

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
	
	// 게시글 검색
	public ArrayList<Qna> searchQnaList(QnaSearch qnaSearch, QnaPageInfo qPi);
	
	// 조회수 증가
	public int addReadCount(int qnaNo);
	
	// QnA 등록
	public int insertQna(Qna qna, HttpServletRequest request);
	
	// QnA 상세조회
	public Qna selectQna(int qnaNo);
	
	// QnA 최신글 번호 조회
	public int selectQnaLatestNo(String memberId);
	
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
