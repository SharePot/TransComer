package com.tc.spring.study.domain;

public class StudySearch {
	
	private String studySearchCondition;
	private String studySearchValue;

	public StudySearch() {}

	public StudySearch(String studySearchCondition, String studySearchValue) {
		super();
		this.studySearchCondition = studySearchCondition;
		this.studySearchValue = studySearchValue;
	}

	/**
	 * @return the studySearchCondition
	 */
	public String getStudySearchCondition() {
		return studySearchCondition;
	}

	/**
	 * @param studySearchCondition the studySearchCondition to set
	 */
	public void setStudySearchCondition(String studySearchCondition) {
		this.studySearchCondition = studySearchCondition;
	}

	/**
	 * @return the studySearchValue
	 */
	public String getStudySearchValue() {
		return studySearchValue;
	}

	/**
	 * @param studySearchValue the studySearchValue to set
	 */
	public void setStudySearchValue(String studySearchValue) {
		this.studySearchValue = studySearchValue;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "StudySearch [studySearchCondition=" + studySearchCondition + ", studySearchValue=" + studySearchValue
				+ "]";
	}
	
	
	
}
