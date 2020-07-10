package com.tc.spring.personal.store;

import java.util.ArrayList;

import com.tc.spring.personal.domain.Personal;

public interface PersonalStore {

	/**
	 * 
	 * @return
	 */
	public ArrayList<Personal> selectPersonalList();

	public Personal selectOne();

	public int insertPersonl();

	public int updatePersonal();

	public int deletePersonal();

}