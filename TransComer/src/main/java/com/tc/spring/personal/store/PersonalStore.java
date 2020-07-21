package com.tc.spring.personal.store;

import java.util.ArrayList;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalPageInfo;
import com.tc.spring.personal.domain.PersonalReqRep;
import com.tc.spring.personal.domain.PersonalSearch;
import com.tc.spring.review.domain.Review;

public interface PersonalStore {

	/**
	 * 
	 * @return
	 */
	public ArrayList<Personal> selectPersonalList(PersonalPageInfo pi);

	public Personal selectOne(int personalNo);
	
	public int getListCount();

	public int addReadCount(int personalNo);

	public int insertPersonal(Personal personal);

	public int updatePersonal(Personal personal);

	public int deletePersonal(int personalNo);
	
	public ArrayList<Personal> searchPersonalList(PersonalSearch search, PersonalPageInfo pi);

	public int getSearchListCount(PersonalSearch search);
	
	public int insertRequest(PersonalReqRep personalReqRep);


}