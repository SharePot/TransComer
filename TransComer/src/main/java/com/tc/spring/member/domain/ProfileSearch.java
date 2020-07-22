package com.tc.spring.member.domain;

public class ProfileSearch {

	private String searchCondition;
	private String searchValue;

	public ProfileSearch() {}

	public ProfileSearch(String searchCondition, String searchValue) {
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
		return "ProfileSearch [searchCondition=" + searchCondition + ", searchValue=" + searchValue + "]";
	}
	
	
}
