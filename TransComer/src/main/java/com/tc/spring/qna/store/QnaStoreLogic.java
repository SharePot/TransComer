package com.tc.spring.qna.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tc.spring.qna.domain.Qna;
import com.tc.spring.qna.domain.QnaPageInfo;
import com.tc.spring.qna.domain.QnaSearch;

@Repository("qnaStore")
public class QnaStoreLogic implements QnaStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return sqlSession.selectOne("qnaMapper.getListCount");
	}
	
	@Override
	public ArrayList<Qna> selectList(QnaPageInfo qPi) {
		
		int offset = (qPi.getCurrentPage() - 1) * qPi.getQnaLimit();
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
		RowBounds rowBounds = new RowBounds(offset, qPi.getQnaLimit());
		return (ArrayList)sqlSession.selectList("qnaMapper.selectList", null, rowBounds);
	}
	
	@Override
	public int addReadCount(int qnaNo) {
		return sqlSession.update("qnaMapper.updateCount", qnaNo);
	}
	
	public ArrayList<Qna> searchList(QnaPageInfo qPi, QnaSearch qnaSearch) {
		int offset = (qPi.getCurrentPage() - 1) * qPi.getQnaLimit();
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
		RowBounds rowBounds = new RowBounds(offset, qPi.getQnaLimit());
		return (ArrayList)sqlSession.selectList("qnaMapper.searchList", qnaSearch, rowBounds);
	}
	
	@Override
	public Qna selectQna(int qnaNo) {
		return sqlSession.selectOne("qnaMapper.selectOne", qnaNo);
	}

	@Override
	public int insertQna(Qna qna) {
		return sqlSession.insert("qnaMapper.insertQna", qna);
	}

	@Override
	public int updateQna(Qna qna) {
		return sqlSession.update("qnaMapper.updateQna", qna);
	}

	@Override
	public int deleteQna(int qnaNo) {
		return sqlSession.delete("qnaMapper.delete", qnaNo);
	}

	

	
}
