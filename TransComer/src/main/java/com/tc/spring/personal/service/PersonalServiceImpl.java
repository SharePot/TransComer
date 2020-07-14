package com.tc.spring.personal.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalSearch;
import com.tc.spring.personal.store.PersonalStore;

@Service("personalService")
public class PersonalServiceImpl implements PersonalService {

	@Autowired
	private PersonalStore personalStore;

	@Override
	public ArrayList<Personal> selectPersonalList() {
		System.out.println("Service 도착");
		return personalStore.selectPersonalList();
	}

	@Override
	public Personal selectOne() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPersonal(Personal personal) {
		personal.setPersonalContent(personal.getPersonalContent().replace("\n", "<br>"));
		return personalStore.insertPersonal(personal);
	}
	
	/*@Override
	public int insertPersonal(Personal personal, MultipartFile file, HttpServletRequest request) {
		personal.setPersonalContent(personal.getPersonalContent().replace("\n", "<br>"));
		return personalStore.insertPersonal(personal);
	}*/

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
	
	/*검색*/
	@Override
	public ArrayList<Personal> searchPersonalList(PersonalSearch search) {
		return personalStore.searchPersonalList(search);
	}

}