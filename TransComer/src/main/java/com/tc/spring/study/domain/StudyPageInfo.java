package com.tc.spring.study.domain;

public class StudyPageInfo {
	
	private int studyCurrentPage;
	private int studyListCount;
	private int studyPageLimit;
	private int studyMaxPage;
	private int studyStartPage;
	private int studyEndPage;
	private int studyBoardLimit;
	
	public StudyPageInfo() {}

	public StudyPageInfo(int studyCurrentPage, int studyListCount, int studyPageLimit, int studyMaxPage,
			int studyStartPage, int studyEndPage, int studyBoardLimit) {
		super();
		this.studyCurrentPage = studyCurrentPage;
		this.studyListCount = studyListCount;
		this.studyPageLimit = studyPageLimit;
		this.studyMaxPage = studyMaxPage;
		this.studyStartPage = studyStartPage;
		this.studyEndPage = studyEndPage;
		this.studyBoardLimit = studyBoardLimit;
	}

	/**
	 * @return the studyCurrentPage
	 */
	public int getStudyCurrentPage() {
		return studyCurrentPage;
	}

	/**
	 * @param studyCurrentPage the studyCurrentPage to set
	 */
	public void setStudyCurrentPage(int studyCurrentPage) {
		this.studyCurrentPage = studyCurrentPage;
	}

	/**
	 * @return the studyListCount
	 */
	public int getStudyListCount() {
		return studyListCount;
	}

	/**
	 * @param studyListCount the studyListCount to set
	 */
	public void setStudyListCount(int studyListCount) {
		this.studyListCount = studyListCount;
	}

	/**
	 * @return the studyPageLimit
	 */
	public int getStudyPageLimit() {
		return studyPageLimit;
	}

	/**
	 * @param studyPageLimit the studyPageLimit to set
	 */
	public void setStudyPageLimit(int studyPageLimit) {
		this.studyPageLimit = studyPageLimit;
	}

	/**
	 * @return the studyMaxPage
	 */
	public int getStudyMaxPage() {
		return studyMaxPage;
	}

	/**
	 * @param studyMaxPage the studyMaxPage to set
	 */
	public void setStudyMaxPage(int studyMaxPage) {
		this.studyMaxPage = studyMaxPage;
	}

	/**
	 * @return the studyStartPage
	 */
	public int getStudyStartPage() {
		return studyStartPage;
	}

	/**
	 * @param studyStartPage the studyStartPage to set
	 */
	public void setStudyStartPage(int studyStartPage) {
		this.studyStartPage = studyStartPage;
	}

	/**
	 * @return the studyEndPage
	 */
	public int getStudyEndPage() {
		return studyEndPage;
	}

	/**
	 * @param studyEndPage the studyEndPage to set
	 */
	public void setStudyEndPage(int studyEndPage) {
		this.studyEndPage = studyEndPage;
	}

	/**
	 * @return the studyBoardLimit
	 */
	public int getStudyBoardLimit() {
		return studyBoardLimit;
	}

	/**
	 * @param studyBoardLimit the studyBoardLimit to set
	 */
	public void setStudyBoardLimit(int studyBoardLimit) {
		this.studyBoardLimit = studyBoardLimit;
	}
	
	
	

}
