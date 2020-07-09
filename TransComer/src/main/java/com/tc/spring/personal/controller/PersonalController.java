package com.tc.spring.personal.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.service.PersonalService;

@Controller
public class PersonalController {

	@Autowired
	private PersonalService personalService;

	// 1:1게시판 전체 조회
	@RequestMapping("plist.tc")
	public ModelAndView personalList(ModelAndView mv) {
		ArrayList<Personal> list = personalService.selectList();
		System.out.println("list : " + list.toString()); // 확인용
		if (!list.isEmpty()) {
			mv.addObject("list", list);
			// mv.addObject("pi", pi);
			System.out.println("plist.tc 컨트롤러 리스트 안비었음"); // 확인용
			mv.setViewName("personal/personalMain");
		} else {
			System.out.println("plist.tc 컨트롤러 리스트 비었다구"); // 확인용
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("personal/personalMain");
		}
		return mv;
	}

	// 1:1게시판 상세 조회
	public String personalDetail() {
		return null;
	}

	// 1:1게시판 등록페이지 이동
	public String pWriterView() {
		return null;
	}

	// 1:1게시판 등록하기
	public String personalInsert() {
		return null;
	}

	// 1:1게시판 수정화면
	public String persoalUpdateView() {
		return null;
	}

	// 1:1게시판 수정
	public String personalUpdate() {
		return null;
	}

	// 1:1게시판 삭제
	public String noticeDelete() {
		return null;
	}
}