package com.tc.spring.member.domain;

import java.sql.Date;

public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String email;
	private String address;
	private String phone;
	private int point;
	private String account;
	private String status;
	private int contentCount;
	private int adoptCount;
	private Date enrollDate;
	private String profileStatus;
	
	public Member() {}
	
	public Member(int memberNo, String memberId, String memberPw, String memberName, String email, String address,
			String phone, int point, String account, String status, int contentCount, int adoptCount, Date enrollDate,
			String profileStatus) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.point = point;
		this.account = account;
		this.status = status;
		this.contentCount = contentCount;
		this.adoptCount = adoptCount;
		this.enrollDate = enrollDate;
		this.profileStatus = profileStatus;
	}

	/**
	 * @return the memberNo
	 */
	public int getMemberNo() {
		return memberNo;
	}

	/**
	 * @param memberNo the memberNo to set
	 */
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	/**
	 * @return the memberId
	 */
	public String getMemberId() {
		return memberId;
	}

	/**
	 * @param memberId the memberId to set
	 */
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	/**
	 * @return the memberPw
	 */
	public String getMemberPw() {
		return memberPw;
	}

	/**
	 * @param memberPw the memberPw to set
	 */
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	/**
	 * @return the memberName
	 */
	public String getMemberName() {
		return memberName;
	}

	/**
	 * @param memberName the memberName to set
	 */
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the point
	 */
	public int getPoint() {
		return point;
	}

	/**
	 * @param point the point to set
	 */
	public void setPoint(int point) {
		this.point = point;
	}

	/**
	 * @return the account
	 */
	public String getAccount() {
		return account;
	}

	/**
	 * @param account the account to set
	 */
	public void setAccount(String account) {
		this.account = account;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the contentCount
	 */
	public int getContentCount() {
		return contentCount;
	}

	/**
	 * @param contentCount the contentCount to set
	 */
	public void setContentCount(int contentCount) {
		this.contentCount = contentCount;
	}

	/**
	 * @return the adoptCount
	 */
	public int getAdoptCount() {
		return adoptCount;
	}

	/**
	 * @param adoptCount the adoptCount to set
	 */
	public void setAdoptCount(int adoptCount) {
		this.adoptCount = adoptCount;
	}

	/**
	 * @return the enrollDate
	 */
	public Date getEnrollDate() {
		return enrollDate;
	}

	/**
	 * @param enrollDate the enrollDate to set
	 */
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	/**
	 * @return the profileStatus
	 */
	public String getProfileStatus() {
		return profileStatus;
	}

	/**
	 * @param profileStatus the profileStatus to set
	 */
	public void setProfileStatus(String profileStatus) {
		this.profileStatus = profileStatus;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", email=" + email + ", address=" + address + ", phone=" + phone + ", point=" + point
				+ ", account=" + account + ", status=" + status + ", contentCount=" + contentCount + ", adoptCount="
				+ adoptCount + ", enrollDate=" + enrollDate + ", profileStatus=" + profileStatus + "]";
	}
	
}
