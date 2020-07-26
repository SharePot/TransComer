package com.tc.spring.simple.domain;

public class SimpleSearch {
	
	private String searchCondition;
	private String searchValue;
	private String simpleWriter;
	
	public SimpleSearch() {}

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

	public String getSimpleWriter() {
		return simpleWriter;
	}

	public void setSimpleWriter(String simpleWriter) {
		this.simpleWriter = simpleWriter;
	}

	@Override
	public String toString() {
		return "SimpleSearch [searchCondition=" + searchCondition + ", searchValue=" + searchValue + ", simpleWriter="
				+ simpleWriter + "]";
	}

	
	
}
