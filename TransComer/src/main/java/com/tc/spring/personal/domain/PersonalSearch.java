package com.tc.spring.personal.domain;

public class PersonalSearch {
	
	private String searchCondition;
	private String searchValue;
	
	public PersonalSearch() {}

	public PersonalSearch(String searchCondition, String searchValue) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	@Override
	public String toString() {
		return "PersonalSearch [searchCondition=" + searchCondition + ", searchValue=" + searchValue + "]";
	}

	
}
