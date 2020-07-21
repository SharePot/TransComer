package com.tc.spring.share.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.share.domain.Share;
import com.tc.spring.share.store.ShareStore;

@Service("shareService")
public class ShareServiceImpl implements ShareService {

	@Autowired
	private ShareStore shareStore;

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

	// 관리자 - 번역공유 신청 리스트 전체 조회
	@Override
	public ArrayList<Share> adminShareList() {
		// TODO Auto-generated method stub
		return shareStore.adminShareList();
	}

	// 관리자 - 번역공유 신청글 상세 조회
	@Override
	public Share adminSelectShareOne(int shareNo) {
		// TODO Auto-generated method stub
		return shareStore.adminSelectShareOne(shareNo);
	}
}
