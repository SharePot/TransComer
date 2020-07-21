package com.tc.spring.share.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.files.domain.Files;
import com.tc.spring.member.store.MemberStore;
import com.tc.spring.share.domain.Share;
import com.tc.spring.share.domain.SharePageInfo;
import com.tc.spring.share.domain.ShareSearch;
import com.tc.spring.share.store.ShareStore;


@Service("shareService")
public class ShareServiceImpl implements ShareService {
	
	@Autowired
	private ShareStore shareStore;

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
	public ArrayList<Share> selectAdminShareList(SharePageInfo sPi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Share> searchShareList(ShareSearch shareSearch, SharePageInfo sPi) {
		return shareStore.searchShareList(shareSearch, sPi);
	}

	@Override
	public int addReadCount(int shareNo) {
		return shareStore.addReadCount(shareNo);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectShare(int shareNo) {
		return shareStore.selectShare(shareNo);
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
		return shareStore.selectAllList(sPi);
	}

	@Override
	public int insertShare(Share share) {
		return shareStore.insertShare(share);
	}

	@Override
	public int insertFile(Files f) {
		return shareStore.insertFile(f);
	}

	
}
