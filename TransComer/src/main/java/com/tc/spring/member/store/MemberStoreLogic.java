package com.tc.spring.member.store;

import java.util.ArrayList;

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
//프로필===============================================================
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
