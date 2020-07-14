package com.tc.spring.simple.domain;

public class SimpleSearch {
	
	private String searchCondition;
	private String searchValue;
	
	public SimpleSearch() {}

	public SimpleSearch(String searchCondition, String searchValue) {
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
		return "SimpleSearch [searchCondition=" + searchCondition + ", searchValue=" + searchValue + "]";
	}
	
}
