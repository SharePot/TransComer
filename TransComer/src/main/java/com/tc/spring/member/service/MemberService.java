package com.tc.spring.member.service;

import java.util.ArrayList;

import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.PointChange;
import com.tc.spring.member.domain.PointRefund;
import com.tc.spring.member.domain.Profile;

public interface MemberService {

	public Member loginMember(Member member);
	
	public int checkIdDup(String memberId);

	public ArrayList<Member> selectMemberList();
	
	public Member selectMemberOne(String memberId);
	
	public int insertMember(Member member);
	
	public int updateMember(Member member);
	
	public int deleteMember(String memberId);
	
	
	//=======================================================
	public ArrayList<PointRefund> selectPointRefundList();
	
	public PointRefund selectPointRefundOne();
	
	public int insertPointRefund(PointRefund pointRf);
	
	public int updatePointRefund(PointRefund pointRf);
	
	public int deletePointRefund(int refundNo);
	
	//=====================================================
	
	public ArrayList<PointChange> selectPointChangeList();
	
	public PointChange selectPointChangeOne();
	
	public int insertPointChange(PointChange pc);
	
	public int updatePointChage(PointChange pc);
	
	public int deletePoingChange(int pointNo);
	
	//====================================================
	
	public ArrayList<Profile> selectProfileList();
	
	public Profile selectProfileOne();
	
	public int insertPointChange(Profile profile);
	
	public int updateProfile(Profile profile);
	
	public int deleteProfile(int memberNo);
	
}
