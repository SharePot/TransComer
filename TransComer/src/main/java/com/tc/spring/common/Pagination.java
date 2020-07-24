package com.tc.spring.common;

import com.tc.spring.alarm.domain.AlarmPageInfo;
import com.tc.spring.member.domain.MemberPageInfo;
import com.tc.spring.personal.domain.PersonalPageInfo;
import com.tc.spring.qna.domain.QnaPageInfo;
import com.tc.spring.report.domain.BlackPageInfo;
import com.tc.spring.report.domain.ReportPageInfo;
import com.tc.spring.share.domain.SharePageInfo;
import com.tc.spring.simple.domain.SimplePageInfo;
import com.tc.spring.study.domain.StudyPageInfo;

public class Pagination {
   
   // PageInfo 객체를 리턴해주는 static 메소드 추가
   // PageInfo라는 클래스는 페이징 처리에 필요한 데이터를 담는 클래스,
   // 클래스가 계속 생성이 되면 정보들이 초기화되기 때문에
   // 한번만 생성하여 정보를 저장할 수 있도록 해야함 ex) db ConnectionFactory
   // -> 자원낭비 방지
   public static QnaPageInfo getQnaPageInfo(int currentPage, int listCount) {
      // 페이지 정보를 담아줄 PageInfo 참조변수 선언
      QnaPageInfo qPi = null;
      
      // currentPage와 listCount가 넘어온 상태이기 때문에
      // 페이징 처리에 필요한 나머지 변수만 선언
      int pageLimit = 10; // 한 페이지에서 보여질 페이징 수
      int maxPage;       // 전체 페이징 수 중 가장 마지막 페이지
      int startPage;      // 현제 페이지 에서 보여질 페이징 버튼의 시작 페이지
      int endPage;      // 현재 페이지에서 보여질 페이징 버튼의 끝 페이지
      
      int qnaLimit = 10; // 한 페이지에 보여질 게시글 갯수
      
      // * maxPage - 총 페이지수
      // 전체 게시글 갯수가 123개이면 한페이지당 10개씩 보여줄 경우
      // =====> 페이지수는 13페이지
      // 짜투리 목록이 최소 1개일 때, 1page로 처리하기 위해 0.9를 더함
      maxPage = (int)((double)listCount / qnaLimit + 0.9);
      
      // * startPage - 현재 페이지에 보여질 시작페이지 수
      // 1, 11, 21, 31
      // 1, 6, 11
      startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
      
      
      // * endPage - 현재 페이지에서 보여질 마지막 페이지 수
      // 10, 20, 30
      endPage = startPage + pageLimit - 1;
      
      // 123개의 게시물이 있음, 10개씩 보여준다고 했을 경우, 페이지 수는 13
      // [이전] 1 2 3 4 5 6 7 8 9 10 [다음]
      // [이전] 11 12 13 [다음]
      
      if ( maxPage < endPage ) {
         endPage = maxPage;
      }
      
      qPi = new QnaPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, qnaLimit);
      
      return qPi;
   }
   
	public static SimplePageInfo getSimplePageInfo(int spCurrentPage, int spListCount) {

		SimplePageInfo spi = null;

		int spPageLimit = 10;
		int spMaxPage;
		int spStartPage;
		int spEndPage;
		int spBoardLimit = 10;

		spMaxPage = (int) ((double) spListCount / spBoardLimit + 0.9);
		spStartPage = (((int) ((double) spCurrentPage / spPageLimit + 0.9)) - 1) * spPageLimit + 1;
		spEndPage = spStartPage + spPageLimit - 1;

		if (spMaxPage < spEndPage) {
			spEndPage = spMaxPage;
		}

		spi = new SimplePageInfo(spCurrentPage, spListCount, spPageLimit, spMaxPage, spStartPage, spEndPage,
				spBoardLimit);

		return spi;

	}

	public static AlarmPageInfo getAlarmPageInfo(int arCurrentPage, int arListCount) {

		AlarmPageInfo aPi = null;

		int arPageLimit = 10;
		int arMaxPage;
		int arStartPage;
		int arEndPage;
		int arBoardLimit = 10;

		arMaxPage = (int) ((double) arListCount / arBoardLimit + 0.9);
		arStartPage = (((int) ((double) arCurrentPage / arPageLimit + 0.9)) - 1) * arPageLimit + 1;
		arEndPage = arStartPage + arPageLimit - 1;

		if (arMaxPage < arEndPage) {
			arEndPage = arMaxPage;
		}

		aPi = new AlarmPageInfo(arCurrentPage, arListCount, arPageLimit, arMaxPage, arStartPage, arEndPage,
				arBoardLimit);

		return aPi;

	}

	public static StudyPageInfo getStudyPageInfo(int currentPage, int listCount) {

		StudyPageInfo pi = null;

		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;

		int boardLimit = 10;

		maxPage = (int) ((double) listCount / boardLimit + 0.9);

		startPage = (((int) ((double) currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;

		endPage = startPage + pageLimit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		pi = new StudyPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

		return pi;
	}

	public static ReportPageInfo getReportPageInfo(int currentPage, int listCount) {
		ReportPageInfo rPi = null;

		// currentPage와 listCount가 넘어온 상태이기 때문에
		// 페이징 처리에 필요한 나머지 변수만 선언
		int pageLimit = 10; // 한 페이지에서 보여질 페이징 수
		int maxPage; // 전체 페이징 수 중 가장 마지막 페이지
		int startPage; // 현제 페이지 에서 보여질 페이징 버튼의 시작 페이지
		int endPage; // 현재 페이지에서 보여질 페이징 버튼의 끝 페이지

		int reportLimit = 10; // 한 페이지에 보여질 게시글 갯수

		// * maxPage - 총 페이지수
		// 전체 게시글 갯수가 123개이면 한페이지당 10개씩 보여줄 경우
		// =====> 페이지수는 13페이지
		// 짜투리 목록이 최소 1개일 때, 1page로 처리하기 위해 0.9를 더함
		maxPage = (int) ((double) listCount / reportLimit + 0.9);

		// * startPage - 현재 페이지에 보여질 시작페이지 수
		// 1, 11, 21, 31
		// 1, 6, 11
		startPage = (((int) ((double) currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;

		// * endPage - 현재 페이지에서 보여질 마지막 페이지 수
		// 10, 20, 30
		endPage = startPage + pageLimit - 1;

		// 123개의 게시물이 있음, 10개씩 보여준다고 했을 경우, 페이지 수는 13
		// [이전] 1 2 3 4 5 6 7 8 9 10 [다음]
		// [이전] 11 12 13 [다음]

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		rPi = new ReportPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, reportLimit);

		return rPi;
	}

	public static BlackPageInfo getBlackPageInfo(int currentPage, int listCount) {
		BlackPageInfo bPi = null;

		// currentPage와 listCount가 넘어온 상태이기 때문에
		// 페이징 처리에 필요한 나머지 변수만 선언
		int pageLimit = 10; // 한 페이지에서 보여질 페이징 수
		int maxPage; // 전체 페이징 수 중 가장 마지막 페이지
		int startPage; // 현제 페이지 에서 보여질 페이징 버튼의 시작 페이지
		int endPage; // 현재 페이지에서 보여질 페이징 버튼의 끝 페이지

		int blackLimit = 10; // 한 페이지에 보여질 게시글 갯수

		// * maxPage - 총 페이지수
		// 전체 게시글 갯수가 123개이면 한페이지당 10개씩 보여줄 경우
		// =====> 페이지수는 13페이지
		// 짜투리 목록이 최소 1개일 때, 1page로 처리하기 위해 0.9를 더함
		maxPage = (int) ((double) listCount / blackLimit + 0.9);

		// * startPage - 현재 페이지에 보여질 시작페이지 수
		// 1, 11, 21, 31
		// 1, 6, 11
		startPage = (((int) ((double) currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;

		// * endPage - 현재 페이지에서 보여질 마지막 페이지 수
		// 10, 20, 30
		endPage = startPage + pageLimit - 1;

		// 123개의 게시물이 있음, 10개씩 보여준다고 했을 경우, 페이지 수는 13
		// [이전] 1 2 3 4 5 6 7 8 9 10 [다음]
		// [이전] 11 12 13 [다음]

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		bPi = new BlackPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, blackLimit);

		return bPi;
	}

	public static MemberPageInfo getMemberPageInfo(int currentPage, int listCount) {

		MemberPageInfo mPi = null;

		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;

		int boardLimit = 10;

		maxPage = (int) ((double) listCount / boardLimit + 0.9);

		startPage = (((int) ((double) currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;

		endPage = startPage + pageLimit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		mPi = new MemberPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

		return mPi;
	}
	
	public static PersonalPageInfo getPersonalPageInfo(int currentPage, int listCount) {

		PersonalPageInfo pi = null;

		int pageLimit = 5;
		int maxPage;
		int startPage;
		int endPage;

		int personalLimit = 6;

		maxPage = (int) ((double) listCount / personalLimit + 0.9);

		startPage = (((int) ((double) currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;

		endPage = startPage + pageLimit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		pi = new PersonalPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, personalLimit);

		return pi;
	}
	
	 public static SharePageInfo getSharePageInfo(int currentPage, int listCount) {
         // 페이지 정보를 담아줄 PageInfo 참조변수 선언
         SharePageInfo sPi = null;
         
         // currentPage와 listCount가 넘어온 상태이기 때문에
         // 페이징 처리에 필요한 나머지 변수만 선언
         int pageLimit = 10; // 한 페이지에서 보여질 페이징 수
         int maxPage;       // 전체 페이징 수 중 가장 마지막 페이지
         int startPage;      // 현제 페이지 에서 보여질 페이징 버튼의 시작 페이지
         int endPage;      // 현재 페이지에서 보여질 페이징 버튼의 끝 페이지
         
         int shareLimit = 10; // 한 페이지에 보여질 게시글 갯수
         
         // * maxPage - 총 페이지수
         // 전체 게시글 갯수가 123개이면 한페이지당 10개씩 보여줄 경우
         // =====> 페이지수는 13페이지
         // 짜투리 목록이 최소 1개일 때, 1page로 처리하기 위해 0.9를 더함
         maxPage = (int)((double)listCount / shareLimit + 0.9);
         
         // * startPage - 현재 페이지에 보여질 시작페이지 수
         // 1, 11, 21, 31
         // 1, 6, 11
         startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
         
         
         // * endPage - 현재 페이지에서 보여질 마지막 페이지 수
         // 10, 20, 30
         endPage = startPage + pageLimit - 1;
         
         // 123개의 게시물이 있음, 10개씩 보여준다고 했을 경우, 페이지 수는 13
         // [이전] 1 2 3 4 5 6 7 8 9 10 [다음]
         // [이전] 11 12 13 [다음]
         
         if ( maxPage < endPage ) {
            endPage = maxPage;
         }
         
         sPi = new SharePageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, shareLimit);
         
         return sPi;
      }
}