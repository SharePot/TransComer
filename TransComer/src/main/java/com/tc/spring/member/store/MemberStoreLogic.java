package com.tc.spring.member.store;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.MemberPageInfo;
import com.tc.spring.member.domain.MemberSearch;
import com.tc.spring.member.domain.PointChange;
import com.tc.spring.member.domain.PointRefund;
import com.tc.spring.member.domain.Profile;

@Repository("memberStore")
public class MemberStoreLogic implements MemberStore {

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	   public Member loginMember(Member member) {
	      return sqlSession.selectOne("memberMapper.selectMemberLogin", member);
	   }

	@Override
	public int checkIdDup(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Member> selectMemberList(MemberPageInfo pi) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowbounds=new RowBounds(offset, pi.getBoardLimit());
		ArrayList<Member> list= (ArrayList)sqlSession.selectList("memberMapper.selectMemberList",null,rowbounds);
		return list;
	}

	@Override
	public Member selectMemberOne(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectMemberOne",memberNo);
	}

	@Override
	public int insertMember(Member member) {
		int result = sqlSession.insert("memberMapper.insertMember", member);
		return result;
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMember", member);
	}

	@Override
	public int deleteMember(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.delete("memberMapper.deleteMember", memberId);
	}
	
	@Override
	public int getMemberListCount() {
		return sqlSession.selectOne("memberMapper.getMemberListCount");
	}


	@Override
	public int getMemberSearchListCount(MemberSearch search) {
		return sqlSession.selectOne("memberMapper.getMemberSearchListCount",search);
	}

	@Override
	public ArrayList<Member> selectMemberSearchList(MemberPageInfo pi, MemberSearch search) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowbounds=new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.searchMemberList",search,rowbounds);
	}

	@Override
	public String findId(String memberEemail) {
		String userId = sqlSession.selectOne("memberMapper.findId", memberEemail);

		return userId;

	}

	@Override
	public int findPassword(Map<String, Object> vo) {
		int result = sqlSession.selectOne("memberMapper.findPwd", vo);

		return result;
	}

	@Override
	public int updatePwd(Map<String, Object> set) {
		return sqlSession.update("memberMapper.updatePwd", set);
	}

	@Override
	public int checkMember(Member member) {
		return sqlSession.selectOne("memberMapper.checkMmember", member);
	}

	//포인트 환급=====================================================================================
	@Override
	public ArrayList<PointRefund> selectPointRefundList(MemberPageInfo pi) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowbounds=new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectPointRefundList",null,rowbounds);
	}

	@Override
	public PointRefund selectPointRefundOne(int refundNo) {
		return sqlSession.selectOne("memberMapper.selectPointRefundOne",refundNo);
	}

	@Override
	public int insertPointRefund(PointRefund pointRf) {
		return sqlSession.insert("memberMapper.pointRefundInsert",pointRf);
	}

	@Override
	public int updatePointRefund(PointRefund pointRf) {
		return sqlSession.update("memberMapper.pointRefundUpdate",pointRf);
	}

	@Override
	public ArrayList<PointRefund> selectPointRefundCheck(String refundYn){
		return (ArrayList)sqlSession.selectList("memberMapper.selectPointRefundCheck",refundYn);
	}

	@Override
	public int getPointRefundListCount() {
		return sqlSession.selectOne("memberMapper.getPointRefundListCount");
	}
	
	
	//포인트 변동=====================================================================================
	@Override
	public ArrayList<PointChange> selectPointChangeList(MemberPageInfo pi) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowbounds=new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selecPointChangeList",null,rowbounds);
	}
	

	@Override
	public ArrayList<PointChange> selectPointChangeMemberList(MemberPageInfo pi,String memberId) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowbounds=new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberPointChangeList",memberId,rowbounds);
	}
	

	@Override
	public int getPointChangeCount() {
		return sqlSession.selectOne("memberMapper.getPointChangeListCount");
	}

	@Override
	public int getPointChangeMemberCount(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.getPointChangeMemberListCount",memberId);
	}


	@Override
	public int insertPointChange(PointChange pc) {
		return sqlSession.insert("memberMapper.insertPointChange",pc);
	}


	
	public int updateMemberPoint(int point) {
		return sqlSession.update("memberMapper.updateMemberPoint",point);
	}
//프로필===============================================================
	@Override
	public ArrayList<Profile> selectProfileList() {
		return (ArrayList)sqlSession.selectList("memberMapper.selectProfileList");
	}

	@Override
	public Profile selectProfileOne(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectProfileOne", memberNo);
	}
	
	@Override
	public int insertProfile(Profile profile) {
		return sqlSession.insert("memberMapper.insertProfile", profile);
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
