package com.tc.spring.alarm.domain;

public class AlarmPageInfo {
	
	private int arCurrentPage;
	private int arListCount;
	private int arPageLimit;
	private int arMaxPage;
	private int arStartPage;
	private int arEndPage;
	private int arBoardLimit;
	
	public AlarmPageInfo() {}

	public AlarmPageInfo(int arCurrentPage, int arListCount, int arPageLimit, int arMaxPage, int arStartPage,
			int arEndPage, int arBoardLimit) {
		super();
		this.arCurrentPage = arCurrentPage;
		this.arListCount = arListCount;
		this.arPageLimit = arPageLimit;
		this.arMaxPage = arMaxPage;
		this.arStartPage = arStartPage;
		this.arEndPage = arEndPage;
		this.arBoardLimit = arBoardLimit;
	}

	public int getArCurrentPage() {
		return arCurrentPage;
	}

	public void setArCurrentPage(int arCurrentPage) {
		this.arCurrentPage = arCurrentPage;
	}

	public int getArListCount() {
		return arListCount;
	}

	public void setArListCount(int arListCount) {
		this.arListCount = arListCount;
	}

	public int getArPageLimit() {
		return arPageLimit;
	}

	public void setArPageLimit(int arPageLimit) {
		this.arPageLimit = arPageLimit;
	}

	public int getArMaxPage() {
		return arMaxPage;
	}

	public void setArMaxPage(int arMaxPage) {
		this.arMaxPage = arMaxPage;
	}

	public int getArStartPage() {
		return arStartPage;
	}

	public void setArStartPage(int arStartPage) {
		this.arStartPage = arStartPage;
	}

	public int getArEndPage() {
		return arEndPage;
	}

	public void setArEndPage(int arEndPage) {
		this.arEndPage = arEndPage;
	}

	public int getArBoardLimit() {
		return arBoardLimit;
	}

	public void setArBoardLimit(int arBoardLimit) {
		this.arBoardLimit = arBoardLimit;
	}

	@Override
	public String toString() {
		return "AlarmPageInfo [arCurrentPage=" + arCurrentPage + ", arListCount=" + arListCount + ", arPageLimit="
				+ arPageLimit + ", arMaxPage=" + arMaxPage + ", arStartPage=" + arStartPage + ", arEndPage=" + arEndPage
				+ ", arBoardLimit=" + arBoardLimit + "]";
	}
	
	

}
