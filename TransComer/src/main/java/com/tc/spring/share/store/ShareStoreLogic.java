package com.tc.spring.share.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.share.domain.Share;

@Repository("shareStore")
public class ShareStoreLogic implements ShareStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Share> selectShareList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Share selectShareOne(int shareNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertShare(Share share) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteShare(int shareNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
