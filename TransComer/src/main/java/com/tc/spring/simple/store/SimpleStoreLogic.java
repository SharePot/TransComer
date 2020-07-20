package com.tc.spring.simple.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.simple.domain.SimplePageInfo;
import com.tc.spring.simple.domain.SimpleRequest;
import com.tc.spring.simple.domain.SimpleResponse;
import com.tc.spring.simple.domain.SimpleSearch;

@Repository("simpleStore")
public class SimpleStoreLogic implements SimpleStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 단순의뢰 게시글 전체 수 조회
	@Override
	public int getSReqListCount() {
		return sqlSession.selectOne("simpleMapper.getSReqListCount");
	}
	
	// 단순의뢰 게시글 전체조회
	@Override
	public ArrayList<SimpleRequest> selectSimpleReqList(SimplePageInfo spi) {
		int offset = (spi.getSpCurrentPage() - 1) * spi.getSpBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, spi.getSpBoardLimit());
		return (ArrayList)sqlSession.selectList("simpleMapper.selectList", null, rowBounds);
	}
	
	// 단순의뢰 게시글 상세보기
	@Override
	public SimpleRequest selectOne(int simpleNo) {
		return sqlSession.selectOne("simpleMapper.selectOne", simpleNo);
	}
	
	// 나의 단순의뢰 질문 보기
	@Override
	public ArrayList<SimpleRequest> mySimpleList(SimplePageInfo spi, String simpleWriter) {
		int offset = (spi.getSpCurrentPage() - 1) * spi.getSpBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, spi.getSpBoardLimit());
		return (ArrayList)sqlSession.selectList("simpleMapper.mySimpleList", simpleWriter, rowBounds);
	}
	
	// 단순의뢰 게시글 조회수
	@Override
	public int addSReqReadCount(int simpleNo) {
		return sqlSession.update("simpleMapper.updateCount", simpleNo);
	}
	
	// 단순의뢰 게시글 작성
	@Override
	public int simpleReqInsert(SimpleRequest simpleReq) {
		return sqlSession.insert("simpleMapper.insertSReq", simpleReq);
	}

	// 단순의뢰 게시글 수정
	@Override
	public int simpleReqUpdate(SimpleRequest simpleReq) {
		return sqlSession.update("simpleMapper.updateSReq", simpleReq);
	}

	// 단순의뢰 게시글 삭제
	@Override
	public int simpleReqDelete(int simpleNo) {
		return sqlSession.update("simpleMapper.deleteSReq", simpleNo);
	}
	
	// 단순의뢰 질문 검색 수 조회
	@Override
	public int getSearchsReListCount(SimpleSearch simpleSearch) {
		return sqlSession.selectOne("simpleMapper.getSearchsReListCount", simpleSearch);
	}
	
	// 단순의뢰 질문 검색
	@Override
	public ArrayList<SimpleRequest> sReqSearchList(SimpleSearch simpleSearch, SimplePageInfo spi) {
		int offset = (spi.getSpCurrentPage() - 1)* spi.getSpBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, spi.getSpBoardLimit());
		return (ArrayList)sqlSession.selectList("simpleMapper.searchSReq", simpleSearch, rowbounds);
	}

	// 단순의뢰 답변 조회
	@Override
	public ArrayList<SimpleResponse> selectSimpleResList(int simpleNo) {
		return (ArrayList)sqlSession.selectList("simpleMapper.selectResList", simpleNo);
	}
	
	// 단순의뢰 답변 한 개
	@Override
	public ArrayList<SimpleResponse> sResOne(int simpleNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("simpleMapper.sResOne", simpleNo);
	}
	
	// 단순의뢰 답변 작성
	@Override
	public int simpleResInsert(SimpleResponse simpleRes) {
		return sqlSession.insert("simpleMapper.insertReply", simpleRes);
	}

	// 단순의뢰 답변 수정
	@Override
	public int simpleResUpdate(SimpleResponse simpleRes) {
		return sqlSession.update("simpleMapper.updateReply", simpleRes);
	}

	// 단순의뢰 답변 삭제
	@Override
	public int simpleResDelete(int simpleReplyNo) {
		return sqlSession.update("simpleMapper.deleteReply",simpleReplyNo);
	}

	// 단순의뢰 답변 채택 처리
	@Override
	public int adoptReply(int simpleReplyNo) {
		return sqlSession.update("simpleMapper.adoptReply", simpleReplyNo);
	}

	// 단순의뢰 질문 채택 처리
	@Override
	public int adoptRequest(int sReqNo) {
		return sqlSession.update("simpleMapper.adoptRequest", sReqNo);
	}

	// 단순의뢰 답변자 채택 카운팅
	@Override
	public int memberAdoptCount(String simpleReplyWriter) {
		return sqlSession.update("simpleMapper.memberAdoptCount", simpleReplyWriter);
	}








}
