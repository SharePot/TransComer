package com.tc.spring.simple.service;

import java.util.ArrayList;

import com.tc.spring.simple.domain.SimplePageInfo;
import com.tc.spring.simple.domain.SimpleRequest;
import com.tc.spring.simple.domain.SimpleResponse;
import com.tc.spring.simple.domain.SimpleSearch;

public interface SimpleService {

	// -------------------- 단순의뢰 질문 --------------------

	/**
	 * 게시판 전체 수 조회
	 * 
	 * @return
	 */

	public int getSReqListCount();

	/**
	 * 게시글 조회수
	 * 
	 * @param simpleNo
	 * @return
	 */
	public int addSReqReadCount(int simpleNo);

	/**
	 * 단순의뢰 질문 전체조회
	 * 
	 * @return
	 */
	public ArrayList<SimpleRequest> selectSimpleReqList(SimplePageInfo spi);

	/**
	 * 단순의뢰 질문 상세조회
	 * 
	 * @param simpleWriter
	 * @return
	 */
	public SimpleRequest selectOne(int simpleNo);

	/**
	 * 나의 단순의뢰 질문 보기
	 * 
	 * @param spi
	 * @param simpleWriter
	 * @return
	 */
	public ArrayList<SimpleRequest> mySimpleList(SimplePageInfo spi, String simpleWriter);

	/**
	 * 단순의뢰 질문 작성
	 * 
	 * @param simpleReq
	 * @return
	 */
	public int simpleReqInsert(SimpleRequest simpleReq);
	
	/**
	 * 답변 채택수 가져오기
	 * 
	 * @param memberId
	 * @return
	 */
	public int selectAdoptionCount(String memberId);

	/**
	 * 단순의뢰 질문 수정
	 * 
	 * @param simpleReq
	 * @return
	 */
	public int simpleReqUpdate(SimpleRequest simpleReq);

	/**
	 * 단순의뢰 질문 삭제
	 * 
	 * @param simpleReq
	 * @return
	 */
	public int simpleReqDelete(int simpleNo);

	/**
	 * 게시판 검색 수 조회
	 * 
	 * @param simpleSearch
	 * @return
	 */
	public int getSearchsReListCount(SimpleSearch simpleSearch);

	/**
	 * 단순의뢰 질문 검색
	 * 
	 * @param simpleRequest
	 * @return
	 */
	public ArrayList<SimpleRequest> sReqSearchList(SimpleSearch simpleSearch, SimplePageInfo spi);
	
	
	public ArrayList<SimpleRequest> mySReqSearchList(SimpleSearch simpleSearch, SimplePageInfo spi);
	public int getMySearchsReListCount(SimpleSearch simpleSearch);

	// -------------------- 단순의뢰 답변 --------------------

	/**
	 * 단순의뢰 답변 조회
	 * 
	 * @param simpleNo
	 * @return
	 */
	public ArrayList<SimpleResponse> getSimpleResList(int simpleNo);

	public ArrayList<SimpleResponse> sResOne(int simpleNo);

	/**
	 * 단순의뢰 답변 작성
	 * 
	 * @param simpleRes
	 * @return
	 */
	public int simpleResInsert(SimpleResponse simpleRes);

	/**
	 * 단순의뢰 답변 수정
	 * 
	 * @param simpleRes
	 * @return
	 */
	public int simpleResUpdate(SimpleResponse simpleRes);

	/**
	 * 단순의뢰 답변 삭제
	 * 
	 * @param simpleRes
	 * @return
	 */
	public int simpleResDelete(int simpleReplyNo);

	/**
	 * 단순의뢰 답변 채택 처리
	 * 
	 * @param simpleReplyNo
	 * @return
	 */
	public int adoptReply(int simpleReplyNo);

	/**
	 * 단순의뢰 질문 채택 처리
	 * 
	 * @param sReqNo
	 * @return
	 */
	public int adoptRequest(int sReqNo);

	/**
	 * 단순의뢰 답변자 채택 카운팅
	 * 
	 * @param simpleReplyWriter
	 * @return
	 */
	public int memberAdoptCount(String simpleReplyWriter);

}
