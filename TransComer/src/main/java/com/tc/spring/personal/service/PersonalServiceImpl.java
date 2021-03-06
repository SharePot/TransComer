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

@Service("personalService")
public class PersonalServiceImpl implements PersonalService {

	@Autowired
	private PersonalStore personalStore;

	@Override
	public ArrayList<Personal> selectPersonalList(PersonalPageInfo pi) {
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
		// ArrayList<Personal> searchP = personalStore.searchPersonalList(search, pi);
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
	public ArrayList<PersonalReqRep> selectDoReqRepList(String memberId) {
		return personalStore.selectDoReqRepList(memberId);
	}

	// 의뢰 신청글 갯수
	@Override
	public int doReqRepListCnt(String memberId) {
		return personalStore.doReqRepListCnt(memberId);
	}

	// 의뢰 받은 목록
	@Override
	public ArrayList<PersonalReqRep> selectGetReqRepList(String memberId) {
		return personalStore.selectGetReqRepList(memberId);
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
	
	// 의뢰 결과 작성 날짜 입력
	@Override
	public int insertConfirmDate(int pReqNo) {
		return personalStore.insertConfirmDate(pReqNo);
	}

	// 의뢰 신청 글 상태바꾸기 (Accept : 'C', 'Y', 'R',)
	@Override
	public int updateReqRepAccept(PersonalReqRep personalReqRep) {
		return personalStore.updateReqRepAccept(personalReqRep);
	}
	
	// 의뢰 결과 글 구매 자동 확정
	@Override
	public ArrayList<PersonalReqRep> selectAutoReqRepList(){
		return personalStore.selectAutoReqRepList();
	}

	// 의뢰 결과 글 구매 확정하기(CheckBuy : 'Y')
	@Override
	public int updateReqRepCheckBuyY(int pReqNo) {
		return personalStore.updateReqRepCheckBuyY(pReqNo);
	}

	// 해당 유저의 해당 글 과거 구매완료 기록이 있는지 확인
	@Override
	public int checkBuyYHistory(PersonalReqRep personalReqRep) {
		// TODO Auto-generated method stub
		return personalStore.checkBuyYHistory(personalReqRep);
	}

	
}