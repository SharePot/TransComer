package com.tc.spring.simple.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.simple.domain.SimplePageInfo;
import com.tc.spring.simple.domain.SimpleRequest;
import com.tc.spring.simple.domain.SimpleResponse;
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

	@Override
	public int simpleResUpdate(SimpleResponse simpleRes) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int simpleResDelete(int simpleReplyNo) {
		return simpleStore.simpleResDelete(simpleReplyNo);
	}




}
