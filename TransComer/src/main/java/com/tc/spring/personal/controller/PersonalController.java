package com.tc.spring.personal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.tc.spring.personal.service.PersonalService;

@Controller
public class PersonalController {

   @Autowired
   private PersonalService personalService;
   
   // 1:1게시판 전체 조회
   public ModelAndView personalList(ModelAndView mv) {
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