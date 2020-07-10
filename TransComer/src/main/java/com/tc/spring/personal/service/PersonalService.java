package com.tc.spring.personal.service;

import java.util.ArrayList;

import com.tc.spring.personal.domain.Personal;

public interface PersonalService {

   public ArrayList<Personal> selectPersonalList();
   /**
    * 1:1의뢰 게시판 전체 조회 서비스
    * @param 
    * @return list
    */
   
   public Personal selectOne();
   /**
    * 1:1의뢰 게시판 상세조회용 서비스
    * @param 
    * @return
    */
   
   public int insertPersonl();
   /**
    * 1:1의뢰 게시판 등록 서비스
    * @param 
    * @return
    */
   
   public int updatePersonal();
   /**
    * 1:1의뢰 게시판 수정용 서비스
    * @param 
    * @return
    */
   
   public int deletePersonal() ;
   /**
    * 1:1의뢰 게시판 삭제용 서비스
    * @param 
    * @return
    */
   
}