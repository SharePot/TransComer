package com.tc.spring.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.member.domain.Member;
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
	public ArrayList<Member> selectMemberList() {
		ArrayList<Member> list=memberStore.selectMemberList();
		return list;
	}

	@Override
	public Member selectMemberOne(String memberId) {
		// TODO Auto-generated method stub
		return null;
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
	public ArrayList<PointRefund> selectPointRefundList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PointRefund selectPointRefundOne() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPointRefund(PointRefund pointRf) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePointRefund(PointRefund pointRf) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePointRefund(int refundNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<PointChange> selectPointChangeList() {
		// TODO Auto-generated method stub
		return null;
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

	@Override
	public ArrayList<Profile> selectProfileList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Profile selectProfileOne() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPointChange(Profile profile) {
		// TODO Auto-generated method stub
		return 0;
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
