package com.tc.spring.personal.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalPageInfo;
import com.tc.spring.personal.domain.PersonalReqRep;
import com.tc.spring.personal.domain.PersonalSearch;
import com.tc.spring.review.domain.Review;

@Repository("personalStore")
public class PersonalStoreLogic implements PersonalStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Personal> selectPersonalList(PersonalPageInfo pi) {
		System.out.println("Store 도착");
		int offset = (pi.getCurrentPage() - 1) * pi.getPersonalLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getPersonalLimit());
		return (ArrayList) sqlSession.selectList("personalMapper.selectList", null, rowBounds);
	}

	@Override
	public Personal selectOne(int personalNo) {
		return sqlSession.selectOne("personalMapper.selectPersonalOne", personalNo);
	}

	@Override
	public int getListCount() {
		return sqlSession.selectOne("personalMapper.getListCount");
	}

	@Override
	public int addReadCount(int personalNo) {
		return sqlSession.update("personalMapper.updateCount", personalNo);
	}

	@Override
	public int insertPersonal(Personal personal) {
		return sqlSession.insert("personalMapper.insertPersonal", personal);
	}

	@Override
	public int updatePersonal(Personal personal) {
		System.out.println("---store 결과 : " + sqlSession.update("personalMapper.updatePersonal", personal));
		System.out.println(">> store에 있습니다, personal :" + personal.toString());
		return sqlSession.update("personalMapper.updatePersonal", personal);
	}

	@Override
	public int deletePersonal(int personalNo) {
		return sqlSession.update("personalMapper.deletePersonal", personalNo);
	}

	@Override
	public ArrayList<Personal> searchPersonalList(PersonalSearch search, PersonalPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getPersonalLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getPersonalLimit());
		return (ArrayList) sqlSession.selectList("personalMapper.searchPersonalList", search, rowBounds);
	}

	@Override
	public int getSearchListCount(PersonalSearch search) {
		return sqlSession.selectOne("personalMapper.getSearchListCount", search);
	}

	@Override
	public int insertRequest(PersonalReqRep personalReqRep) {
		return sqlSession.insert("personalMapper.insertRequest", personalReqRep);
	}

	public int selectPersonalLastNo(String memberId) {
		return sqlSession.selectOne("personalMapper.selectPersonalLastNo", memberId);
	}

	// ================ 0723 ~ 현꾸 작성 ==============
	// 의뢰 신청한 목록
	@Override
	public ArrayList<PersonalReqRep> selectDoReqRepList(String memberId, PersonalPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getPersonalLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getPersonalLimit());
		return (ArrayList) sqlSession.selectList("personalMapper.selectDoReqRepList", memberId, rowBounds);
	}

	// 의뢰 신청글 갯수
	@Override
	public int doReqRepListCnt(String memberId) {
		return sqlSession.selectOne("personalMapper.doReqRepListCnt", memberId);
	}

	// 의뢰 받은 목록
	@Override
	public ArrayList<PersonalReqRep> selectGetReqRepList(String memberId, PersonalPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getPersonalLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getPersonalLimit());
		return (ArrayList) sqlSession.selectList("personalMapper.selectGetReqRepList", memberId, rowBounds);
	}

	// 의뢰 받은글 갯수
	@Override
	public int getReqRepListCnt(String memberId) {
		return sqlSession.selectOne("personalMapper.getReqRepListCnt", memberId);
	}

	// 의뢰 신청 데이터 한개 상세 조회
	@Override
	public PersonalReqRep selectReqRepOne(int pReqNo) {
		return sqlSession.selectOne("personalMapper.selectReqRepOne", pReqNo);
	}

	// 의뢰 신청 글 상태바꾸기 (Accept : 'C', 'Y', 'R',)
	@Override
	public int updateReqRepAccept(PersonalReqRep personalReqRep) {
		return sqlSession.update("personalMapper.updateReqRepAccept", personalReqRep);
	}

	// 의뢰 결과 글 작성 - 번역 결과 내용 업데이트
	@Override
	public int updateReqRepResult(PersonalReqRep personalReqRep) {
		return sqlSession.update("personalMapper.updateReqRepResult", personalReqRep);
	}

	// 의뢰 결과 글 구매 확정하기(CheckBuy : 'Y')
	@Override
	public int updateReqRepCheckBuyY(int pReqNo) {
		return sqlSession.update("personalMapper.updateReqRepCheckBuyY", pReqNo);
	}

}
