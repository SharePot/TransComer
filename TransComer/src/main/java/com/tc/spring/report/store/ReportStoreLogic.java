package com.tc.spring.report.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("reportStore")
public class ReportStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
