package com.tc.spring.simple.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.simple.domain.SimpleRequest;
import com.tc.spring.simple.domain.SimpleResponse;

@Repository("simpleStore")
public class SimpleStoreLogic implements SimpleStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

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
	public ArrayList<SimpleResponse> selectSimpleResList() {
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
