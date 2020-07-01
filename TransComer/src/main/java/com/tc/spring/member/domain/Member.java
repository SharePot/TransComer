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
	private int addpCount;
	private Date enrollDate;
	
	public Member() {}

	public Member(int memberNo, String memberId, String memberPw, String memberName, String email, String address,
			String phone, int point, String account, String status, int contentCount, int addpCount, Date enrollDate) {
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
		this.addpCount = addpCount;
		this.enrollDate = enrollDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getContentCount() {
		return contentCount;
	}

	public void setContentCount(int contentCount) {
		this.contentCount = contentCount;
	}

	public int getAddpCount() {
		return addpCount;
	}

	public void setAddpCount(int addpCount) {
		this.addpCount = addpCount;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", email=" + email + ", address=" + address + ", phone=" + phone + ", point=" + point
				+ ", account=" + account + ", status=" + status + ", contentCount=" + contentCount + ", addpCount="
				+ addpCount + ", enrollDate=" + enrollDate + "]";
	}
	
	
	

}
