package com.tc.spring.member.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberStore")
public class MemberStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
