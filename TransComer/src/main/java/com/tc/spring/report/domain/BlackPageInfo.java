package com.tc.spring.report.domain;

public class BlackPageInfo {

	private int currentPage;
	private int listCount;
	private int pageLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int blackLimit;
	
	public BlackPageInfo() {}

	public BlackPageInfo(int currentPage, int listCount, int pageLimit, int maxPage, int startPage, int endPage,
			int blackLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.blackLimit = blackLimit;
	}

	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageLimit() {
		return pageLimit;
	}
	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getBlackLimit() {
		return blackLimit;
	}
	public void setBlackLimit(int blackLimit) {
		this.blackLimit = blackLimit;
	}
	
}
