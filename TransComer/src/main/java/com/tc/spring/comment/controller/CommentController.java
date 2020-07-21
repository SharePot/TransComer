package com.tc.spring.comment.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.tc.spring.comment.domain.Comment;
import com.tc.spring.comment.domain.CommentPageInfo;
import com.tc.spring.comment.service.CommentService;
import com.tc.spring.common.Pagination;
import com.tc.spring.member.domain.Member;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("commentList.tc")
	public void commentList(HttpServletResponse response,int shareNo,int studyNo,int qnaNo,String commentCondition )throws JsonIOException, IOException {
		//System.out.println(shareNo+","+studyNo+","+qnaNo+","+commentCondition);
		Comment comment = new Comment();
		comment.setCommentCondition(commentCondition);
		comment.setQnaNo(qnaNo);
		comment.setShareNo(shareNo);
		comment.setStudyNo(studyNo);
		
		
		ArrayList<Comment> commentList=commentService.selectCommentList(comment);
		
		
		for(Comment co : commentList) {
			co.setCommentContent(URLEncoder.encode(co.getCommentContent(),"utf-8"));
			
		}
		Gson gson =new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(commentList,response.getWriter());
		
		// 기존에 JSONOBject, JSONArray를 이용해서 JSON형태로 만들어줬음
		// 여기선 Gson 라이브러리를 사용하고자 함.
		// reply 객체를 JSON형태로 변환해줘서 data로 보내줘야함.
		// { 'bId' : 1, 'bName' : '제목' }
	}
	
	
	@RequestMapping("insertComment.tc")
	@ResponseBody
	public String insertComment(Comment comment, HttpSession  session) {
		Member loginUser=(Member)session.getAttribute("loginUser");
		String memberId=loginUser.getMemberId();
		comment.setMemberId(memberId);
		int result=commentService.insertComment(comment);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("updateComment.tc")
	@ResponseBody
	public String updateComment(Comment comment, HttpSession  session) {
		Member loginUser=(Member)session.getAttribute("loginUser");
		String memberId=loginUser.getMemberId();
		comment.setMemberId(memberId);
		int result=commentService.updateComment(comment);
		if(result>0){
			return "success";
			}else {
				return "fail";
			}
		
	}

	@RequestMapping("deleteComment.tc")
	@ResponseBody
	public String deleteComment(int commentNo) {
		int result=commentService.deleteComment(commentNo);
		if(result>0) {
			System.out.println("success");
			return "success";
		}else {
			return "fail";
		}
	}
	

	public int getCommentListCount(int shareNo,int studyNo,int qnaNo,String commentCondition) {
		Comment comment = new Comment();
		comment.setCommentCondition(commentCondition);
		comment.setQnaNo(qnaNo);
		comment.setShareNo(shareNo);
		comment.setStudyNo(studyNo);
		
		int commentCount=commentService.getCommentListCount(comment);
		return commentCount;
	}
		
}
