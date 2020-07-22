
package com.tc.spring.member.store;

import java.util.ArrayList;
import java.util.Map;

import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.MemberPageInfo;
import com.tc.spring.member.domain.MemberSearch;
import com.tc.spring.member.domain.PointChange;
import com.tc.spring.member.domain.PointRefund;
import com.tc.spring.member.domain.Profile;

public interface MemberStore {
	
	
	
	public Member loginMember(Member member);
	
	public int checkIdDup(String memberId);

	public ArrayList<Member> selectMemberList(MemberPageInfo pi);
	
	public Member selectMemberOne(String memberId);
	
	public int insertMember(Member member);
	
	public int updateMember(Member member);
	
	public int deleteMember(String memberId);
	
	public int getMemberListCount();
	
	public int getMemberSearchListCount(MemberSearch search);
	
	public ArrayList<Member> selectMemberSearchList(MemberPageInfo pi,MemberSearch search);
	
	public String findId(String memberEemail);

	public int findPassword(Map<String, Object> vo);

	public int updatePwd(Map<String, Object> set);

	public int checkMember(Member member);

	
	public int payMent(Map<String, Object> map);

	public Member userRefrash(String id);
	
	//포인트 환급=======================================================
	public ArrayList<PointRefund> selectPointRefundList(MemberPageInfo pi);
	
	public int getPointRefundListCount();
	
	public PointRefund selectPointRefundOne(int refundNo);
	
	public int insertPointRefund(PointRefund pointRf);
	
	public int updatePointRefund(PointRefund pointRf);
	
	public ArrayList<PointRefund> selectPointRefundCheck(String refundYn);
	//포인트 변동=====================================================
	
	public ArrayList<PointChange> selectPointChangeList(MemberPageInfo pi);
	
	public int getPointChangeCount();
	
	public int getPointChangeMemberCount(String memberId);
	
	public ArrayList<PointChange> selectPointChangeMemberList(MemberPageInfo pi,String memberId);
	
	public int insertPointChange(PointChange pc);
	
	public int updateMemberPoint(Member member);
	
	
	//프로필====================================================

	public ArrayList<Profile> selectProfileList();
	
	public Profile countProfile(int memberNo);
	
	public Profile selectProfileOne(int memberNo);
	
	public int insertProfile(Profile profile);
	
	public int updateProfile(Profile profile);
	
	public int deleteProfile(int memberNo);
	
	public int updateStatusY(int memberNo);
	
	public int updateStatusN(int memberNo);
}
