
package com.tc.spring.member.domain;

import java.sql.Date;

public class Profile {
   
   public int profileNo;
   public int memberNo;
   public String memberId;
   public String pLang1;
   public String pLang2;
   public String pLang3;
   public String tLang1;
   public String tLang2;
   public String tLang3;
   public String pLangGrade1;
   public String pLangGrade2;
   public String pLangGrade3;
   public String tLangGrade1;
   public String tLangGrade2;
   public String tLangGrade3;
   public String introduce;
   public String profileFilePath;
   public Date profileDate;
   public String profileStatus;
   
   public Profile() {}

public int getProfileNo() {
	return profileNo;
}

public void setProfileNo(int profileNo) {
	this.profileNo = profileNo;
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

public String getpLang1() {
	return pLang1;
}

public void setpLang1(String pLang1) {
	this.pLang1 = pLang1;
}

public String getpLang2() {
	return pLang2;
}

public void setpLang2(String pLang2) {
	this.pLang2 = pLang2;
}

public String getpLang3() {
	return pLang3;
}

public void setpLang3(String pLang3) {
	this.pLang3 = pLang3;
}

public String gettLang1() {
	return tLang1;
}

public void settLang1(String tLang1) {
	this.tLang1 = tLang1;
}

public String gettLang2() {
	return tLang2;
}

public void settLang2(String tLang2) {
	this.tLang2 = tLang2;
}

public String gettLang3() {
	return tLang3;
}

public void settLang3(String tLang3) {
	this.tLang3 = tLang3;
}

public String getpLangGrade1() {
	return pLangGrade1;
}

public void setpLangGrade1(String pLangGrade1) {
	this.pLangGrade1 = pLangGrade1;
}

public String getpLangGrade2() {
	return pLangGrade2;
}

public void setpLangGrade2(String pLangGrade2) {
	this.pLangGrade2 = pLangGrade2;
}

public String getpLangGrade3() {
	return pLangGrade3;
}

public void setpLangGrade3(String pLangGrade3) {
	this.pLangGrade3 = pLangGrade3;
}

public String gettLangGrade1() {
	return tLangGrade1;
}

public void settLangGrade1(String tLangGrade1) {
	this.tLangGrade1 = tLangGrade1;
}

public String gettLangGrade2() {
	return tLangGrade2;
}

public void settLangGrade2(String tLangGrade2) {
	this.tLangGrade2 = tLangGrade2;
}

public String gettLangGrade3() {
	return tLangGrade3;
}

public void settLangGrade3(String tLangGrade3) {
	this.tLangGrade3 = tLangGrade3;
}

public String getIntroduce() {
	return introduce;
}

public void setIntroduce(String introduce) {
	this.introduce = introduce;
}

public String getProfileFilePath() {
	return profileFilePath;
}

public void setProfileFilePath(String profileFilePath) {
	this.profileFilePath = profileFilePath;
}

public Date getProfileDate() {
	return profileDate;
}

public void setProfileDate(Date profileDate) {
	this.profileDate = profileDate;
}

public String getProfileStatus() {
	return profileStatus;
}

public void setProfileStatus(String profileStatus) {
	this.profileStatus = profileStatus;
}

@Override
public String toString() {
	return "Profile [profileNo=" + profileNo + ", memberNo=" + memberNo + ", memberId=" + memberId + ", pLang1="
			+ pLang1 + ", pLang2=" + pLang2 + ", pLang3=" + pLang3 + ", tLang1=" + tLang1 + ", tLang2=" + tLang2
			+ ", tLang3=" + tLang3 + ", pLangGrade1=" + pLangGrade1 + ", pLangGrade2=" + pLangGrade2 + ", pLangGrade3="
			+ pLangGrade3 + ", tLangGrade1=" + tLangGrade1 + ", tLangGrade2=" + tLangGrade2 + ", tLangGrade3="
			+ tLangGrade3 + ", introduce=" + introduce + ", profileFilePath=" + profileFilePath + ", profileDate="
			+ profileDate + ", profileStatus=" + profileStatus + "]";
}

   

}

