package com.tc.spring.personal.store;

import java.util.ArrayList;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalPageInfo;
import com.tc.spring.personal.domain.PersonalSearch;

public interface PersonalStore {

	/**
	 * 
	 * @return
	 */
	public ArrayList<Personal> selectPersonalList(PersonalPageInfo pi);

	public Personal selectOne();
	
	public int getListCount();

	public int addReadCount(int personalNo);

	public int insertPersonal(Personal personal);

	public int updatePersonal();

	public int deletePersonal();
	
	public ArrayList<Personal> searchPersonalList(PersonalSearch search, PersonalPageInfo pi);

	public int getSearchListCount(PersonalSearch search);


}