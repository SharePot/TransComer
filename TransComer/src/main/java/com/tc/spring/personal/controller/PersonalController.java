package com.tc.spring.personal.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.common.Pagination;
import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalPageInfo;
import com.tc.spring.personal.domain.PersonalSearch;
import com.tc.spring.personal.service.PersonalService;

@Controller
public class PersonalController {

	@Autowired
	private PersonalService personalService;

	// 1:1게시판 전체 조회
	@RequestMapping("plist.tc")
	public ModelAndView personalList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {

		int currentPage = (page != null) ? page : 1;
		int listCount = personalService.getListCount();

		PersonalPageInfo pi = Pagination.getPersonalPageInfo(currentPage, listCount);
		ArrayList<Personal> list = personalService.selectPersonalList(pi);

		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("personal/personalMain");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 1:1 게시판 검색
	@RequestMapping("pSearch.tc")
	public String personalSearch(PersonalSearch search, Model model,
			@RequestParam(value = "page", required = false) Integer page) {

		int currentPage = (page != null) ? page : 1;
		int listCount = personalService.getSearchListCount(search);
		// System.out.println("====컨트롤러 ===search listCount 변수 : "+listCount);

		PersonalPageInfo pi = Pagination.getPersonalPageInfo(currentPage, listCount);
		ArrayList<Personal> searchList = personalService.searchPersonalList(search, pi);

		model.addAttribute("list", searchList);
		model.addAttribute("search", search); // 검색 후에도 검색결과가 남아있게 하기 위해
		model.addAttribute("pi", pi);
		return "personal/personalMain";
	}

	// 1:1게시판 상세 조회
	@RequestMapping("pDetail.tc")
	public ModelAndView personalDetail(ModelAndView mv, int personalNo,
			@RequestParam(name = "page", required = false) Integer page) {

		int currentPage = (page != null) ? page : 1;
		personalService.addReadCount(personalNo); // 조회수 증가

		Personal personal = personalService.selectOne(personalNo); // 상세조회

		System.out.println("컨트롤러 : " + personalNo);

		if (personal != null) {
			mv.addObject("personal", personal).addObject("currentPage", currentPage)
					.setViewName("personal/personalDetailView");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 1:1게시판 등록페이지 이동
	@RequestMapping("pWriterView.tc")
	public String pWriterView() {
		return "personal/personalWriterForm";
	}

	// 1:1게시판 등록하기
	@RequestMapping(value = "pWriterInsert.tc", method = RequestMethod.POST)
	public String personalInsert(Personal personal, Model model, String pLang1, String pLang2, String pLang3,
			String tLang1, String tLang2, String tLang3) {

		personal.setPersonalPLang(pLang1 + "," + pLang2 + "," + pLang3);
		personal.setPersonalTLang(tLang1 + "," + tLang2 + "," + tLang3);
		System.out.println("Personal : " + personal);
		int result = personalService.insertPersonal(personal);
		if (result > 0) {
			return "redirect:plist.tc";
		} else {
			model.addAttribute("msg", "등록실패");
			return "common/errorPage";
		}
	}

	// 1:1게시판 수정화면 이동
	@RequestMapping("pWriterUpdateView.tc")
	public String persoalUpdateView(int personalNo, Model model) {
		model.addAttribute("personal", personalService.selectOne(personalNo));
		return "personal/personalWriterUpdateForm";
	}

	// 1:1게시판 수정
	@RequestMapping(value = "pWriterUpdate.tc", method = RequestMethod.POST)
	public String personalUpdate(Personal personal, Model model, String pLang1, String pLang2, String pLang3,
			String tLang1, String tLang2, String tLang3) {

		personal.setPersonalPLang(pLang1 + "," + pLang2 + "," + pLang3);
		personal.setPersonalTLang(tLang1 + "," + tLang2 + "," + tLang3);

		System.out.println("---컨트롤러 Personal : " + personal.toString());
		int result = personalService.updatePersonal(personal);

		System.out.println("---컨트롤러 result : " + result);
		if (result > 0) {
			/*return "redirect:plist.tc";*/
			 return "redirect:pDetail.tc?personalNo="+personal.getPersonalNo(); 
		} else {
			model.addAttribute("msg", "등록실패");
			return "common/errorPage";
		}
	}

	// 1:1게시판 삭제
	@RequestMapping(value = "pWriterDelete.tc")
	public String noticeDelete(int personalNo, Model model, RedirectAttributes rd) {
		Personal personal = personalService.selectOne(personalNo);
		int result = personalService.deletePersonal(personalNo);
		if(result>0) {
			rd.addAttribute("msg", "공지사항 삭제 성공");
			return "redirect:plist.tc";
		}else {
			model.addAttribute("msg", "공지사항 삭제 실패");
			return "common/errorPage";
		}
	}

}