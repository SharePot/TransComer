package com.tc.spring.personal.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalPageInfo;
import com.tc.spring.personal.domain.PersonalReqRep;
import com.tc.spring.personal.domain.PersonalSearch;
import com.tc.spring.personal.store.PersonalStore;
import com.tc.spring.review.domain.Review;

@Service("personalService")
public class PersonalServiceImpl implements PersonalService {

	@Autowired
	private PersonalStore personalStore;

	@Override
	public ArrayList<Personal> selectPersonalList(PersonalPageInfo pi) {
		System.out.println("Service 도착");
		return personalStore.selectPersonalList(pi);
	}

	@Override
	public Personal selectOne(int personalNo) {

		return personalStore.selectOne(personalNo);
	}

	@Override
	public int getListCount() {
		return personalStore.getListCount();
	}

	@Override
	public int addReadCount(int personalNo) {
		return personalStore.addReadCount(personalNo);
	}

	@Override
	public int insertPersonal(Personal personal, MultipartFile file, HttpServletRequest request) {
		// textarea의 갱행문자를 <br>로 변경
		personal.setPersonalContent(personal.getPersonalContent().replace("\n", "<br>"));
		return personalStore.insertPersonal(personal);
	}

	@Override
	public int updatePersonal(Personal personal) {
		// textarea의 갱행문자를 <br>로 변경
		personal.setPersonalContent(personal.getPersonalContent().replace("\n", "<br>"));
		System.out.println("---service 결과 : " + personalStore.updatePersonal(personal));
		return personalStore.updatePersonal(personal);
	}

	@Override
	public int deletePersonal(int personalNo) {
		return personalStore.deletePersonal(personalNo);
	}

	/* 검색 */
	@Override
	public ArrayList<Personal> searchPersonalList(PersonalSearch search, PersonalPageInfo pi) {
		ArrayList<Personal> searchP = personalStore.searchPersonalList(search, pi);
		return personalStore.searchPersonalList(search, pi);
	}

	@Override
	public int getSearchListCount(PersonalSearch search) {
		// System.out.println("====서비스가 가져온 갯수 : " +
		// personalStore.getSearchListCount(search));
		return personalStore.getSearchListCount(search);
	}

	@Override
	public int insertRequest(PersonalReqRep personalReqRep, HttpServletRequest request) {
		// textarea의 갱행문자를 <br>로 변경
		personalReqRep.setpReqContent(personalReqRep.getpReqContent().replace("\n", "<br>"));
		personalReqRep.setpReqDetail(personalReqRep.getpReqDetail().replace("\n", "<br>"));

		return personalStore.insertRequest(personalReqRep);
	}

	@Override
	public int selectPersonalLastNo(String memberId) {
		return personalStore.selectPersonalLastNo(memberId);
	}

	// ================ 0723 ~ 현꾸 작성 ==============
	// 의뢰 신청한 목록
	@Override
	public ArrayList<PersonalReqRep> selectDoReqRepList(String memberId, PersonalPageInfo pi) {
		return personalStore.selectDoReqRepList(memberId, pi);
	}

	// 의뢰 신청글 갯수
	@Override
	public int doReqRepListCnt(String memberId) {
		return personalStore.doReqRepListCnt(memberId);
	}

	// 의뢰 받은 목록
	@Override
	public ArrayList<PersonalReqRep> selectGetReqRepList(String memberId, PersonalPageInfo pi) {
		return personalStore.selectGetReqRepList(memberId, pi);
	}

	// 의뢰 받은글 갯수
	@Override
	public int getReqRepListCnt(String memberId) {
		return personalStore.getReqRepListCnt(memberId);
	}

	// 의뢰 신청 데이터 한개 상세 조회
	@Override
	public PersonalReqRep selectReqRepOne(int pReqNo) {
		return personalStore.selectReqRepOne(pReqNo);
	}

	// 의뢰 결과 글 작성 - 번역 결과 내용 업데이트
	@Override
	public int updateReqRepResult(PersonalReqRep personalReqRep) {
		return personalStore.updateReqRepResult(personalReqRep);
	}

	// 의뢰 신청 글 승인하기(Accept : 'Y')
	@Override
	public int updateReqRepAcceptY(int pReqNo) {
		return personalStore.updateReqRepAcceptY(pReqNo);
	}

	// 의뢰 신청 글 반려하기(Accept : 'R')
	@Override
	public int updateReqRepAcceptR(int pReqNo) {
		return personalStore.updateReqRepAcceptR(pReqNo);
	}

	// 의뢰 결과 글 구매 확정하기(CheckBuy : 'Y')
	@Override
	public int updateReqRepCheckBuyY(int pReqNo) {
		return personalStore.updateReqRepCheckBuyY(pReqNo);
	}

}