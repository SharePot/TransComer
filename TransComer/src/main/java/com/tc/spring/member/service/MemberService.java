package com.tc.spring.member.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.MemberPageInfo;
import com.tc.spring.member.domain.MemberSearch;
import com.tc.spring.member.domain.PointChange;
import com.tc.spring.member.domain.PointRefund;
import com.tc.spring.member.domain.Profile;

public interface MemberService {

	public Member loginMember(Member member);
	
	public int checkIdDup(String memberId);

	public ArrayList<Member> selectMemberList(MemberPageInfo pi);
	
	public Member selectMemberOne(int memberNo);
	
	public int insertMember(Member member);
	
	public int updateMember(Member member);
	
	public int deleteMember(String memberId);
	
	public int getMemberListCount();
	
	public int getMemberSearchListCount(MemberSearch search);
	
	public ArrayList<Member> selectMemberSearchList(MemberPageInfo pi,MemberSearch search);
	
	
	//=======================================================포인트 환급
	public ArrayList<PointRefund> selectPointRefundList(MemberPageInfo pi);
	
	public int getPointRefundListCount();
	
	public PointRefund selectPointRefundOne(int refundNo);
	
	public int insertPointRefund(PointRefund pointRf);
	
	public int updatePointRefund(PointRefund pointRf);
	
	public ArrayList<PointRefund> selectPointRefundCheck(String refundYn);
	
	
	
	//=====================================================포인트 변동
	
	public ArrayList<PointChange> selectPointChangeList();
	
	public PointChange selectPointChangeOne();
	
	public int insertPointChange(PointChange pc);
	
	public int updatePointChage(PointChange pc);
	
	public int deletePoingChange(int pointNo);
	
	//====================================================프로필
	
	
	public ArrayList<Profile> selectProfileList();
	
	public Profile selectProfileOne(int memberNo);
	
	public int insertProfile(Profile profile, MultipartFile file, HttpServletRequest request);
	
	public int updateProfile(Profile profile);
	
	public int deleteProfile(int memberNo);
}
