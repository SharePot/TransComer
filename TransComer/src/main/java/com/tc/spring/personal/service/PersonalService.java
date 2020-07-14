package com.tc.spring.personal.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalSearch;
import com.tc.spring.study.domain.StudySearch;

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
   
   public int insertPersonal(Personal personal);
   /*public int insertPersonal(Personal personal, MultipartFile file, HttpServletRequest request);*/
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
   
   public ArrayList<Personal> searchPersonalList(PersonalSearch search);
   /**
	* 1:1 게시판 검색
	* @param search
	* @return
	*/
   
}