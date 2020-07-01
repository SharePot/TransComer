package com.tc.spring.simple.service;

import java.util.ArrayList;

import com.tc.spring.simple.domain.SimpleRequest;
import com.tc.spring.simple.domain.SimpleResponse;

public interface SimpleService {
	
	
	// -------------------- 단순의뢰 질문 --------------------
	
	/**
	 * 단순의뢰 질문 전체조회
	 * @return
	 */
	public ArrayList<SimpleRequest> selectSimpleReqList();
	
	/**
	 * 단순의뢰 질문 상세조회
	 * @param simpleWriter
	 * @return
	 */
	public SimpleRequest SimpleReqDetail(int simpleNo);
	
	/**
	 * 단순의뢰 질문 작성
	 * @param simpleReq
	 * @return
	 */
	public int simpleReqInsert(SimpleRequest simpleReq);
	
	/**
	 * 단순의뢰 질문 수정
	 * @param simpleReq
	 * @return
	 */
	public int simpleReqUpdate(SimpleRequest simpleReq);
	
	/**
	 * 단순의뢰 질문 삭제
	 * @param simpleReq
	 * @return
	 */
	public int simpleReqDelete(int simpleNo);
	
	
	
	// -------------------- 단순의뢰 답변 --------------------
	
	/**
	 * 단순의뢰 답변 전체조회
	 * @return
	 */
	public ArrayList<SimpleResponse> getSimpleResList();
	
	/**
	 * 단순의뢰 답변 작성
	 * @param simpleRes
	 * @return
	 */
	public int simpleResInsert(SimpleResponse simpleRes);
	
	/**
	 * 단순의뢰 답변 수정
	 * @param simpleRes
	 * @return
	 */
	public int simpleResUpdate(SimpleResponse simpleRes);
	
	/**
	 * 단순의뢰 답변 삭제
	 * @param simpleRes
	 * @return
	 */
	public int simpleResDelete(int simpleReplyNo);
	
}
