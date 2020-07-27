package com.tc.spring.share.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.files.domain.Files;
import com.tc.spring.share.domain.Share;
import com.tc.spring.share.domain.SharePageInfo;
import com.tc.spring.share.domain.ShareSearch;

@Repository("shareStore")
public class ShareStoreLogic implements ShareStore {

   @Autowired
   private SqlSessionTemplate sqlSession;

   @Override
   public int getListCount() {
      return sqlSession.selectOne("shareMapper.getListCount");
   }

   @Override
   public int getAdminListCount() {
      return sqlSession.selectOne("shareMapper.getAdminListCount");
   }

   @Override
   public int getSearchListCount(ShareSearch shareSearch) {
      return sqlSession.selectOne("shareMapper.getSearchListCount");
   }

   @Override
   public int addReadCount(int ShareNo) {
      return sqlSession.update("shareMapper.addReadCount", ShareNo);
   }

   @Override
   public ArrayList<Share> searchShareList(ShareSearch shareSearch, SharePageInfo sPi) {
      return (ArrayList)sqlSession.selectList("shareMapper.searchShareList", shareSearch);
   }

   @Override
   public int insertShare(Share share) {
      return sqlSession.insert("shareMapper.insertShare", share);
   }

   @Override
   public Share selectShare(int shareNo) {
      return sqlSession.selectOne("shareMapper.selectShare", shareNo);
   }

   @Override
   public int updateShare(Share share) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int deleteShare(int shareNo) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public ArrayList<Share> selectAllList(SharePageInfo sPi) {
      int offset = (sPi.getCurrentPage() - 1) * sPi.getPageLimit();
      RowBounds rowBounds = new RowBounds(offset, sPi.getPageLimit());
      return (ArrayList)sqlSession.selectList("shareMapper.selectList", null, rowBounds);
   }

   @Override
   public int insertFile(Files f) {
      return sqlSession.insert("shareMapper.fileInsert", f);
   }

   // 관리자 - 번역공유 신청 전체 조회
   @Override
   public ArrayList<Share> adminShareList() {
      // TODO Auto-generated method stub
      return (ArrayList) sqlSession.selectList("shareMapper.adminShareList");
   }

   // 관리자 - 번역공유 신청글 상세 조회
   @Override
   public Share adminSelectShareOne(int shareNo) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("shareMapper.adminSelectShareOne", shareNo);
   }

   // 관리자가 번역공유 신청글 '승인'(Y)하기
   @Override
   public int updateShareYnY(int shareNo) {
      // TODO Auto-generated method stub
      return sqlSession.update("shareMapper.updateShareYnY", shareNo);
   }

   // 관리자가 번역공유 신청글 '반려'(R)하기
   @Override
   public int updateShareYnR(int shareNo) {
      // TODO Auto-generated method stub
      return sqlSession.update("shareMapper.updateShareYnR", shareNo);
   }

   @Override
   public int selectShareLatestNo(String memberId) {
      return sqlSession.selectOne("shareMapper.selectShareLatestNo", memberId);
   }

}