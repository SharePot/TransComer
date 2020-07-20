package com.tc.spring.simple.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.simple.domain.SimplePageInfo;
import com.tc.spring.simple.domain.SimpleRequest;
import com.tc.spring.simple.domain.SimpleResponse;
import com.tc.spring.simple.domain.SimpleSearch;
import com.tc.spring.simple.store.SimpleStore;

@Service("simpleService")
public class SimpleServiceImpl implements SimpleService {

	@Autowired
	private SimpleStore simpleStore;
	
	// 단순의뢰 게시글 전체 수 조회
	@Override
	public int getSReqListCount() {
		return simpleStore.getSReqListCount();
	}
	
	// 단순의뢰 게시글 전체 조회
	@Override
	public ArrayList<SimpleRequest> selectSimpleReqList(SimplePageInfo spi) {
		return simpleStore.selectSimpleReqList(spi);
	}

	// 단순의뢰 게시글 상세조회
	@Override
	public SimpleRequest selectOne(int simpleNo) {
		return simpleStore.selectOne(simpleNo);
	}
	
	// 나의 단순의뢰 질문 보기
	@Override
	public ArrayList<SimpleRequest> mySimpleList(SimplePageInfo spi, String simpleWriter) {
		return simpleStore.mySimpleList(spi, simpleWriter);
	}

	// 단순의뢰 게시글 조회수
	@Override
	public int addSReqReadCount(int simpleNo) {
		return simpleStore.addSReqReadCount(simpleNo);
	}
	
	// 단순의뢰 게시글 작성
	@Override
	public int simpleReqInsert(SimpleRequest simpleReq) {
		simpleReq.setSimpleContent(simpleReq.getSimpleContent().replace("\n", "<br>"));
		return simpleStore.simpleReqInsert(simpleReq);
	}

	// 단순의뢰 게시글 수정
	@Override
	public int simpleReqUpdate(SimpleRequest simpleReq) {
		simpleReq.setSimpleContent(simpleReq.getSimpleContent().replace("\n", "<br>"));
		return simpleStore.simpleReqUpdate(simpleReq);
	}

	// 단순의뢰 게시글 삭제
	@Override
	public int simpleReqDelete(int simpleNo) {
		return simpleStore.simpleReqDelete(simpleNo);
	}

	// 단순의뢰 질문 검색 수 조회
	@Override
	public int getSearchsReListCount(SimpleSearch simpleSearch) {
		return simpleStore.getSearchsReListCount(simpleSearch);
	}
	
	// 단순의뢰 질문 검색
	@Override
	public ArrayList<SimpleRequest> sReqSearchList(SimpleSearch simpleSearch, SimplePageInfo spi) {
		return simpleStore.sReqSearchList(simpleSearch, spi);
	}
	
	// 단순의뢰 답변 조회
	@Override
	public ArrayList<SimpleResponse> getSimpleResList(int simpleNo) {
		return simpleStore.selectSimpleResList(simpleNo);
	}
	
	// 단순의뢰 답변 한 개
	@Override
	public ArrayList<SimpleResponse> sResOne(int simpleNo) {
		return simpleStore.sResOne(simpleNo);
	}
	
	// 단순의뢰 답변 작성
	@Override
	public int simpleResInsert(SimpleResponse simpleRes) {
		return simpleStore.simpleResInsert(simpleRes);
	}

	// 단순의뢰 답변 수정
	@Override
	public int simpleResUpdate(SimpleResponse simpleRes) {
		return simpleStore.simpleResUpdate(simpleRes);
	}

	// 단순의뢰 답변 삭제
	@Override
	public int simpleResDelete(int simpleReplyNo) {
		return simpleStore.simpleResDelete(simpleReplyNo);
	}

	// 단순의뢰 답변 채택 처리
	@Override
	public int adoptReply(int simpleReplyNo) {
		return simpleStore.adoptReply(simpleReplyNo);
	}

	// 단순의뢰 질문 채택 처리
	@Override
	public int adoptRequest(int sReqNo) {
		return simpleStore.adoptRequest(sReqNo);
	}

	// 단순의뢰 답변자 채택 카운팅
	@Override
	public int memberAdoptCount(String simpleReplyWriter) {
		return simpleStore.memberAdoptCount(simpleReplyWriter);
	}








}
