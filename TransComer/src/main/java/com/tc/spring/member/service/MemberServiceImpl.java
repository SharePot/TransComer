package com.tc.spring.member.service;

import java.util.ArrayList;
import java.util.Map;

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
import com.tc.spring.member.domain.ProfileSearch;
import com.tc.spring.member.domain.Rank;
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
		return memberStore.checkIdDup(memberId);
	}
	
	@Override
	public ArrayList<Member> selectMemberList(MemberPageInfo pi) {
		ArrayList<Member> list=memberStore.selectMemberList(pi);
		return list;
	}

	@Override
	public Member selectMemberOne(String memberId) {
		return memberStore.selectMemberOne(memberId);
	}

	@Override
	public int insertMember(Member member) {
		return memberStore.insertMember(member);
	}

	@Override
	public int updateMember(Member member) {
		return memberStore.updateMember(member);
	}

	@Override
	public int deleteMember(String memberId) {
		return memberStore.deleteMember(memberId);
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
	
	@Override
	public String findId(String memberEemail) {

		return memberStore.findId(memberEemail);
	}

	@Override
	public int findPassword(Map<String, Object> vo) {
		return memberStore.findPassword(vo);
	}

	@Override
	public int updatePwd(Map<String, Object> set) {
		return memberStore.updatePwd(set);
	}

	@Override
	public int checkMember(Member member) {
		return memberStore.checkMember(member);
	}
	

	@Override
	public int payMent(Map<String, Object> map) {
		return memberStore.payMent(map);
	}

	@Override
	public Member userRefrash(String id) {
		return memberStore.userRefrash(id);
	}
	
	@Override
	public int memberUpdatePreminum(Member member) {
		return memberStore.memberUpdatePreminum(member);
	}


	@Override
	public int memberUpdatePrimary() {
		return memberStore.memberUpdatePrimary();
	}


	@Override
	public int updateContentCount(String memberId) {
		return memberStore.updateContentCount(memberId);
	}


	@Override
	   public int memberInsertPremium(Member member) {
	      return memberStore.memberInsertPremium(member);
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
	public int insertPointChange(PointChange pc) {
		return memberStore.insertPointChange(pc);
	}

	@Override
	public int updateMemberPoint(Member member) {
		return memberStore.updateMemberPoint(member);
	}


//=======================================프로필
	@Override
	public ArrayList<Profile> selectProfileList(MemberPageInfo pi) {
		return memberStore.selectProfileList(pi);
	}

	@Override
	public Profile countProfile(int memberNo) {
		return memberStore.countProfile(memberNo);
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
		profile.setIntroduce(profile.getIntroduce().replace("\n", "<br>"));
		return memberStore.updateProfile(profile);
	}

	@Override
	public int deleteProfile(int memberNo) {
		return memberStore.deleteProfile(memberNo);
	}

	@Override
	public int updateStatusY(int memberNo) {
		return memberStore.updateStatusY(memberNo);
	}

	@Override
	public int updateStatusN(int memberNo) {
		return memberStore.updateStatusN(memberNo);
	}
	@Override
	public int getPfListCount() {
		return memberStore.getPfListCount();
	}

	@Override
	public int getPfSearchListCount(ProfileSearch pfSearch) {
		return memberStore.getPfSearchListCount(pfSearch);
	}

	@Override
	public ArrayList<Profile> searchProfile(ProfileSearch pfSearch, MemberPageInfo pi) {
		return memberStore.searchProfile(pfSearch, pi);
	}

	@Override
	   public ArrayList<Rank> rankAdoptC() {
	      return memberStore.rankAdoptC();
	   }

	   @Override
	   public ArrayList<Rank> starA() {
	      return memberStore.starA();
	   }
}
