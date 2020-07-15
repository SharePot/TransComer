package com.tc.spring.member.service;

import java.util.ArrayList;

import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.MemberPageInfo;
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
	
	public Profile selectProfileOne();
	
	public int insertPointChange(Profile profile);
	
	public int updateProfile(Profile profile);
	
	public int deleteProfile(int memberNo);
	
}
