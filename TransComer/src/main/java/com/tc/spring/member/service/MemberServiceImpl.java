package com.tc.spring.member.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.MemberPageInfo;
import com.tc.spring.member.domain.MemberSearch;
import com.tc.spring.member.domain.PointChange;
import com.tc.spring.member.domain.PointRefund;
import com.tc.spring.member.domain.Profile;
import com.tc.spring.member.store.MemberStore;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberStore memberStore;

	@Override
	   public Member loginMember(Member member) {
	      return memberStore.loginMember(member);
	   }
	
	@Override
	public int checkIdDup(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Member> selectMemberList(MemberPageInfo pi) {
		ArrayList<Member> list=memberStore.selectMemberList(pi);
		return list;
	}

	@Override
	public Member selectMemberOne(int memberNo) {
		return memberStore.selectMemberOne(memberNo);
	}

	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}
	

	@Override
	public int getMemberListCount() {
		return memberStore.getMemberListCount();
	}
	
	@Override
	public int getMemberSearchListCount(MemberSearch search) {
		return memberStore.getMemberSearchListCount(search);
	}

	@Override
	public ArrayList<Member> selectMemberSearchList(MemberPageInfo pi, MemberSearch search) {
		return memberStore.selectMemberSearchList(pi, search);
	}

//포인트 환급=====================================================================================
	@Override
	public ArrayList<PointRefund> selectPointRefundList(MemberPageInfo pi) {
		return memberStore.selectPointRefundList(pi);
	}

	@Override
	public PointRefund selectPointRefundOne(int refundNo) {
		return memberStore.selectPointRefundOne(refundNo);
	}

	@Override
	public int insertPointRefund(PointRefund pointRf) {
		return memberStore.insertPointRefund(pointRf);
	}

	@Override
	public int updatePointRefund(PointRefund pointRf) {
		return memberStore.updatePointRefund(pointRf);
	}

	@Override
	public ArrayList<PointRefund> selectPointRefundCheck(String refundYn) {
		return memberStore.selectPointRefundCheck(refundYn);
	}

	@Override
	public int getPointRefundListCount() {
		return memberStore.getPointRefundListCount();
	}
	//포인트 변동=====================================================================================
	@Override
	public ArrayList<PointChange> selectPointChangeList(MemberPageInfo pi) {
		return memberStore.selectPointChangeList(pi);
	}
	
	@Override
	public ArrayList<PointChange> selectPointChangeMemberList(MemberPageInfo pi,String memberId) {
		return memberStore.selectPointChangeMemberList(pi, memberId);
	}
	

	@Override
	public int getPointChangeCount() {
		return memberStore.getPointChangeCount();
	}

	@Override
	public int getPointChangeMemberCount(String memberId) {
		return memberStore.getPointChangeMemberCount(memberId);
	}




	@Override
	public PointChange selectPointChangeOne() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPointChange(PointChange pc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePointChage(PointChange pc) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePoingChange(int pointNo) {
		// TODO Auto-generated method stub
		return 0;
	}

//=======================================프로필
	@Override
	public ArrayList<Profile> selectProfileList() {
		return memberStore.selectProfileList();
	}

	@Override
	public Profile selectProfileOne(int memberNo) {
		return memberStore.selectProfileOne(memberNo);
	}
	
	@Override
	public int insertProfile(Profile profile, MultipartFile file, HttpServletRequest request) {
		profile.setIntroduce(profile.getIntroduce().replace("\n", "<br>"));
		return memberStore.insertProfile(profile);
	}

	@Override
	public int updateProfile(Profile profile) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProfile(int memberNo) {
		// TODO Auto-generated method stub
		return 0;
	}



}
