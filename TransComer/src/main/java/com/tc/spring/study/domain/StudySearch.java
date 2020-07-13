package com.tc.spring.study.domain;

public class StudySearch {
	
	private String studySearchCondition;
	private String studySearchValue;
	private String studyExistFile;

	public StudySearch() {}




	public StudySearch(String studySearchCondition, String studySearchValue, String studyExistFile) {
		super();
		this.studySearchCondition = studySearchCondition;
		this.studySearchValue = studySearchValue;
		this.studyExistFile = studyExistFile;
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




	/**
	 * @return the studyExistFile
	 */
	public String getStudyExistFile() {
		return studyExistFile;
	}




	/**
	 * @param studyExistFile the studyExistFile to set
	 */
	public void setStudyExistFile(String studyExistFile) {
		this.studyExistFile = studyExistFile;
	}




	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "StudySearch [studySearchCondition=" + studySearchCondition + ", studySearchValue=" + studySearchValue
				+ ", studyExistFile=" + studyExistFile + "]";
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	
	
	
	
}
