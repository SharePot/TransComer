package com.tc.spring.simple.store;

import java.util.ArrayList;

import com.tc.spring.simple.domain.SimpleRequest;
import com.tc.spring.simple.domain.SimpleResponse;

public interface SimpleStore {
	
	// -------------------- 단순의뢰 질문 --------------------
	
	public ArrayList<SimpleRequest> selectSimpleReqList();
	
	public SimpleRequest SimpleReqDetail(int simpleNo);
	
	public int simpleReqInsert(SimpleRequest simpleReq);
	
	public int simpleReqUpdate(SimpleRequest simpleReq);
	
	public int simpleReqDelete(int simpleNo);
	
	// -------------------- 단순의뢰 답변 --------------------
	
	public ArrayList<SimpleResponse> selectSimpleResList();
	
	public int simpleResInsert(SimpleResponse simpleRes);
	
	public int simpleResUpdate(SimpleResponse simpleRes);
	
	public int simpleResDelete(int simpleReplyNo);
	
}
