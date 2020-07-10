package com.tc.spring.personal.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.store.PersonalStore;

@Service("personalService")
public class PersonalServiceImpl implements PersonalService  {

   @Autowired private PersonalStore personalStore;

   @Override
   public ArrayList<Personal> selectList() {
      return personalStore.selectList();
   }

   @Override
   public Personal selectOne() {
      // TODO Auto-generated method stub
      return null;
   }

   @Override
   public int insertPersonl() {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int updatePersonal() {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int deletePersonal() {
      // TODO Auto-generated method stub
      return 0;
   }

   
}