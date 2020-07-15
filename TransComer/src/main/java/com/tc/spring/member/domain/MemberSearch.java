package com.tc.spring.member.domain;

public class MemberSearch {
	
	private String memberSearchCondition;
	private String memberSearchValue;

	public MemberSearch() {}

	public MemberSearch(String memberSearchCondition, String memberSearchValue) {
		super();
		this.memberSearchCondition = memberSearchCondition;
		this.memberSearchValue = memberSearchValue;
	}

	/**
	 * @return the memberSearchCondition
	 */
	public String getMemberSearchCondition() {
		return memberSearchCondition;
	}

	/**
	 * @param memberSearchCondition the memberSearchCondition to set
	 */
	public void setMemberSearchCondition(String memberSearchCondition) {
		this.memberSearchCondition = memberSearchCondition;
	}

	/**
	 * @return the memberSearchValue
	 */
	public String getMemberSearchValue() {
		return memberSearchValue;
	}

	/**
	 * @param memberSearchValue the memberSearchValue to set
	 */
	public void setMemberSearchValue(String memberSearchValue) {
		this.memberSearchValue = memberSearchValue;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "MemberSearch [memberSearchCondition=" + memberSearchCondition + ", memberSearchValue="
				+ memberSearchValue + "]";
	}
	
	

}
