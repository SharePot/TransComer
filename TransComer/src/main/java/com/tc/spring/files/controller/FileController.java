package com.tc.spring.files.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tc.spring.files.domain.Files;
import com.tc.spring.files.service.FileService;

@Controller
public class FileController {

	@Autowired
	private FileService fileService;
	
	// 파일 DB에 넣기
	public int insertFile(Files files, Model model, MultipartFile uploadFile, HttpServletRequest request, String memberId) {
		
		if(!uploadFile.getOriginalFilename().equals("")) { 
			String filePath = saveFile(uploadFile, request, memberId);
			if(filePath != null) {
				files.setMemberId(memberId);
				files.setFileName(uploadFile.getOriginalFilename());
				files.setFilePath(filePath);
			}
		}
		
		// 데이터를 디비에 저장하는 작업
		int result = 0;
		String path = null;
		result = fileService.insertFile(files, uploadFile, request);//request는 파일 경로를 알아내기 위해 필요
		
		return result;
	}
	
	// 실제 파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request, String memberId) {
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\" + memberId + "\\uploadFiles";

		// 저장 폴더 선택
		File folder = new File(savePath);

		// 만약 폴더가 없을 경우 자동 생성
		if(!folder.exists()) {
			folder.mkdirs();
		}

		String filePath=savePath+"\\"+file.getOriginalFilename();
		
		try {
			//실제로 파일 저장
			file.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return filePath;
	}
	
	// 게시글 번호에 맞는 파일 리스트 가져오기
	public ArrayList<Files> selectFileList(Files files) {
		ArrayList<Files> flist = fileService.selectFileList(files);
		return flist;
	}
	
	// 파일 수정
	public int updateFile(Files files, Model model, HttpServletRequest request, MultipartFile reloadFile, String memberId) {
		// 새로 업로드된 파일이 있을 경우
		int result = 0;
		if (reloadFile != null && !reloadFile.isEmpty()) {
			// 기존 업로드된 파일이 있을 경우
			if ( files.getFilePath() != null ) {
				// 기존 파일 삭제
				String del = "no";
				deleteFile(files, request, memberId, del);
			}
			// 새로 업로드된 파일 저장
			String savePath = saveFile(reloadFile, request, memberId);
			
			// 새로 업로드된 파일이 잘 저장이 되었다면 디비 저장
			if( savePath != null ) {
				files.setMemberId(memberId);
				files.setFileName(reloadFile.getOriginalFilename());
				files.setFilePath(savePath);
			}
			result = fileService.updateFile(files);
		}
		
		// 게시판 별로 만들어야함
		/*if(result > 0) {
			return "redirect:ndetail.kh?nId="+.getnId();
		} else {
			model.addAttribute("msg", "공지사항 수정 실패");
			return "common/errorPage";
		}*/
		return result;
	}
	
	// 파일 삭제
	public int deleteFile(Files files, HttpServletRequest request, String memberId, String del) {
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\" + memberId + "\\uploadFiles";
		// 삭제할 파일 경로 + 파일명
		String filePath = savePath + "\\" + files.getFileName();
		File deleteFile = new File(filePath);
		// 해당 파일이 존재할 경우 삭제
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
		
		if ( del.equals("yes")) {
			int result = fileService.deleteFile(files);
			// result값에 따른 해야할 것 만들어주기
			return result;
		} else {
			return 0;
		}
	}
}
