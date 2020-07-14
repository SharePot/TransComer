package com.tc.spring.report.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.member.domain.Member;
import com.tc.spring.report.domain.BlackPageInfo;
import com.tc.spring.report.domain.Report;
import com.tc.spring.report.domain.ReportPageInfo;

@Repository("reportStore")
public class ReportStoreLogic implements ReportStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getReportListCount() {
		return sqlSession.selectOne("reportMapper.selectReportCount");
	}
	
	@Override
	public int getBlackListCount() {
		return sqlSession.selectOne("reportMapper.selectBlackCount");
	}
	
	@Override
	public ArrayList<Report> selectReportList(ReportPageInfo rPi) {
		int offset = (rPi.getCurrentPage() - 1) * rPi.getReportLimit();
		// mybatis의 RowBounds클래스 사용
		// off : 얼마나 건너뛸 것인가, 증가값
		// limit : 고정된 값 , 내가 가져오고 싶은 갯수
		
		// off : 5, boardLimit : 10
		// 5 + 10 건을 가져온 후에 5건을 건너띄고 10개를 가져옴
		// 10 + 10건을 가져온 후에 10건을 건너띄고 10개를 가져옴
		// 단점 : 데이터가 많아지면 느려질 수 있음.
		
		// 10건의 0건만큼 건너뛰고 결과값을 가져옴 => 10개
		// 15건의 5건만큼 건너뛰고 결과값을 가져옴 => 10개
		// 20건의 10건만큼 건너뛰고 결과값을 가져옴 => 10개
		RowBounds rowBounds = new RowBounds(offset, rPi.getReportLimit());
		return (ArrayList)sqlSession.selectList("reportMapper.selectReportList", null, rowBounds);
	}
	
	@Override
	public ArrayList<Report> searchReportList(ReportPageInfo rPi) {
		int offset = (rPi.getCurrentPage() - 1) * rPi.getReportLimit();
		RowBounds rowBounds = new RowBounds(offset, rPi.getReportLimit());
		return (ArrayList)sqlSession.selectList("reportMapper.searchReportList", null, rowBounds);
	}
	
	@Override
	public ArrayList<Member> selectBlackList(BlackPageInfo bPi) {
		int offset = (bPi.getCurrentPage() - 1) * bPi.getBlackLimit();
		RowBounds rowBounds = new RowBounds(offset, bPi.getBlackLimit());
		return (ArrayList)sqlSession.selectList("reportMapper.selectBlackList", null, rowBounds);
	}

	@Override
	public int insertReport(Report report) {
		return sqlSession.insert("reportMapper.insertReport", report);
	}
	
	@Override
	public int updateReport(Report report) {
		return sqlSession.update("reportMapper.updateReport", report);
	}
	
	@Override
	public int updateBlack(Member member) {
		return sqlSession.update("reportMapper.updateBlack", member);
	}

	@Override
	public int deleteReport(int reportNo) {
		return sqlSession.delete("reportMapper.deleteReport", reportNo);
	}

	

	
	
}
