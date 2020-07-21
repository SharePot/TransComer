package com.tc.spring.share.store;

import java.util.ArrayList;
import java.util.HashMap;

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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getAdminListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getSearchListCount(ShareSearch shareSearch) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public ArrayList<Share> selectAdminQnaList(SharePageInfo sPi) {
		// TODO Auto-generated method stub
		return null;
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
	public ArrayList<HashMap<String, Object>> selectShare(int shareNo) {
		return (ArrayList)sqlSession.selectList("shareMapper.selectShare", shareNo);
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
		return (ArrayList)sqlSession.selectList("shareMapper.selectList", sPi);
	}

	@Override
	public int insertFile(Files f) {
		return sqlSession.insert("shareMapper.fileInsert", f);
	}

}
