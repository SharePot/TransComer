package com.tc.spring.simple.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.simple.domain.SimpleRequest;
import com.tc.spring.simple.domain.SimpleResponse;
import com.tc.spring.simple.store.SimpleStore;

@Service("simpleService")
public class SimpleServiceImpl implements SimpleService {

	@Autowired
	private SimpleStore simpleStore;

	@Override
	public ArrayList<SimpleRequest> selectSimpleReqList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SimpleRequest SimpleReqDetail(int simpleNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int simpleReqInsert(SimpleRequest simpleReq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int simpleReqUpdate(SimpleRequest simpleReq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int simpleReqDelete(int simpleNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<SimpleResponse> getSimpleResList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int simpleResInsert(SimpleResponse simpleRes) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int simpleResUpdate(SimpleResponse simpleRes) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int simpleResDelete(int simpleReplyNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
