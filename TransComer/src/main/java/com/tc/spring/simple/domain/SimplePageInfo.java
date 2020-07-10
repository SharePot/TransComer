package com.tc.spring.simple.domain;

public class SimplePageInfo {
	
	private int spCurrentPage;
	private int spListCount;
	private int spPageLimit;
	private int spMaxPage;
	private int spStartPage;
	private int spEndPage;
	private int spBoardLimit;

	public SimplePageInfo() {}

	public SimplePageInfo(int spCurrentPage, int spListCount, int spPageLimit, int spMaxPage, int spStartPage,
			int spEndPage, int spBoardLimit) {
		super();
		this.spCurrentPage = spCurrentPage;
		this.spListCount = spListCount;
		this.spPageLimit = spPageLimit;
		this.spMaxPage = spMaxPage;
		this.spStartPage = spStartPage;
		this.spEndPage = spEndPage;
		this.spBoardLimit = spBoardLimit;
	}

	public int getSpCurrentPage() {
		return spCurrentPage;
	}

	public void setSpCurrentPage(int spCurrentPage) {
		this.spCurrentPage = spCurrentPage;
	}

	public int getSpListCount() {
		return spListCount;
	}

	public void setSpListCount(int spListCount) {
		this.spListCount = spListCount;
	}

	public int getSpPageLimit() {
		return spPageLimit;
	}

	public void setSpPageLimit(int spPageLimit) {
		this.spPageLimit = spPageLimit;
	}

	public int getSpMaxPage() {
		return spMaxPage;
	}

	public void setSpMaxPage(int spMaxPage) {
		this.spMaxPage = spMaxPage;
	}

	public int getSpStartPage() {
		return spStartPage;
	}

	public void setSpStartPage(int spStartPage) {
		this.spStartPage = spStartPage;
	}

	public int getSpEndPage() {
		return spEndPage;
	}

	public void setSpEndPage(int spEndPage) {
		this.spEndPage = spEndPage;
	}

	public int getSpBoardLimit() {
		return spBoardLimit;
	}

	public void setSpBoardLimit(int spBoardLimit) {
		this.spBoardLimit = spBoardLimit;
	}

	@Override
	public String toString() {
		return "SimplePageInfo [spCurrentPage=" + spCurrentPage + ", spListCount=" + spListCount + ", spPageLimit="
				+ spPageLimit + ", spMaxPage=" + spMaxPage + ", spStartPage=" + spStartPage + ", spEndPage=" + spEndPage
				+ ", spBoardLimit=" + spBoardLimit + "]";
	}

}
