package com.tc.spring.simple.store;

import java.util.ArrayList;

import com.tc.spring.simple.domain.SimplePageInfo;
import com.tc.spring.simple.domain.SimpleRequest;
import com.tc.spring.simple.domain.SimpleResponse;
import com.tc.spring.simple.domain.SimpleSearch;

public interface SimpleStore {
	
	// -------------------- 단순의뢰 질문 --------------------
	public int getSReqListCount();
	
	
	public int addSReqReadCount(int simpleNo);
	
	public ArrayList<SimpleRequest> selectSimpleReqList(SimplePageInfo spi);
	
	public SimpleRequest selectOne(int simpleNo);
	
	public int simpleReqInsert(SimpleRequest simpleReq);
	
	public int simpleReqUpdate(SimpleRequest simpleReq);
	
	public int simpleReqDelete(int simpleNo);
	
	public int getSearchsReListCount(SimpleSearch simpleSearch);
	
	public ArrayList<SimpleRequest> sReqSearchList(SimpleSearch simpleSearch, SimplePageInfo spi);
	
	// -------------------- 단순의뢰 답변 --------------------
	
	public ArrayList<SimpleResponse> selectSimpleResList(int simpleNo);
	
	public ArrayList<SimpleResponse> sResOne(int simpleNo);
	
	public int simpleResInsert(SimpleResponse simpleRes);
	
	public int simpleResUpdate(SimpleResponse simpleRes);
	
	public int simpleResDelete(int simpleReplyNo);
	
	public int adoptReply(int simpleReplyNo);
	
	public int adoptRequest(int sReqNo);
	
	public int memberAdoptCount(String simpleReplyWriter);
	
}
