package com.tc.spring.personal.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalPageInfo;
import com.tc.spring.personal.domain.PersonalSearch;
import com.tc.spring.personal.store.PersonalStore;

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
	public Personal selectOne() {
		// TODO Auto-generated method stub
		return null;
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
	public int insertPersonal(Personal personal) {
		personal.setPersonalContent(personal.getPersonalContent().replace("\n", "<br>"));
		return personalStore.insertPersonal(personal);
	}

	/*
	 * @Override public int insertPersonal(Personal personal, MultipartFile file,
	 * HttpServletRequest request) {
	 * personal.setPersonalContent(personal.getPersonalContent().replace("\n",
	 * "<br>")); return personalStore.insertPersonal(personal); }
	 */

	@Override
	public int updatePersonal() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePersonal() {
		// TODO Auto-generated method stub
		return 0;
	}

	/* 검색 */
	@Override
	public ArrayList<Personal> searchPersonalList(PersonalSearch search, PersonalPageInfo pi) {
		ArrayList<Personal> searchP = personalStore.searchPersonalList(search, pi);
		return personalStore.searchPersonalList(search, pi);
	}

	@Override
	public int getSearchListCount(PersonalSearch search) {
		//System.out.println("====서비스가 가져온 갯수 : " + personalStore.getSearchListCount(search));
		return personalStore.getSearchListCount(search);
	}

}