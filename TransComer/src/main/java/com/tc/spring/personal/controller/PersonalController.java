package com.tc.spring.personal.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tc.spring.alarm.domain.Alarm;
import com.tc.spring.alarm.service.AlarmService;
import com.tc.spring.common.Pagination;
import com.tc.spring.files.controller.FileController;
import com.tc.spring.files.domain.Files;
import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.PointChange;
import com.tc.spring.member.domain.Profile;
import com.tc.spring.member.service.MemberService;
import com.tc.spring.personal.domain.Personal;
import com.tc.spring.personal.domain.PersonalPageInfo;
import com.tc.spring.personal.domain.PersonalReqRep;
import com.tc.spring.personal.domain.PersonalSearch;
import com.tc.spring.personal.service.PersonalService;
import com.tc.spring.review.domain.Review;

@Controller
public class PersonalController {

	@Autowired
	private PersonalService personalService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private FileController fController;
	
	@Autowired
	private AlarmService alarmService;

	// 1:1게시판 전체 조회
	@RequestMapping("plist.tc")
	public ModelAndView personalList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {

		int currentPage = (page != null) ? page : 1;
		int listCount = personalService.getListCount();

		PersonalPageInfo pi = Pagination.getPersonalPageInfo(currentPage, listCount);
		ArrayList<Personal> list = personalService.selectPersonalList(pi);

		if (!list.isEmpty()) {
			this.cutUselessStringList(list); // 없음 텍스트 제거
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("personal/personalMain");
		} else {
			mv.setViewName("personal/personalMain");
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

		this.cutUselessStringList(searchList); // 없음 텍스트 제거

		model.addAttribute("list", searchList);
		model.addAttribute("search", search); // 검색 후에도 검색결과가 남아있게 하기 위해
		model.addAttribute("pi", pi);
		return "personal/personalMain";
	}

	// 1:1게시판 상세 조회
	@RequestMapping("pDetail.tc")
	public ModelAndView personalDetail(ModelAndView mv, int personalNo, String memberId,
			@RequestParam(name = "page", required = false) Integer page) {

		int currentPage = (page != null) ? page : 1;
		personalService.addReadCount(personalNo); // 조회수 증가

		Personal personal = personalService.selectOne(personalNo); // 상세조회
		Member mem = memberService.selectMemberOne(memberId);
		Profile profile = memberService.selectProfileOne(mem.getMemberNo());

		if (personal != null) {
			this.cutUselessStringOne(personal); // 없음 텍스트 제거
			mv.addObject("personal", personal);
			mv.addObject("currentPage", currentPage);
			mv.addObject("profile", profile);
			mv.setViewName("personal/personalDetailView");
		} else {
			mv.addObject("msg", "게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 1:1게시판 등록페이지 이동
	@RequestMapping("pWriterView.tc")
	public String pWriterView(String memberId, Model model) {
		Member mem = memberService.selectMemberOne(memberId); // 해당 유저 정보가져옴
		Profile profile = memberService.selectProfileOne(mem.getMemberNo()); // 유저 프로필 정보
		model.addAttribute("profile", profile);
		return "personal/personalWriterForm";
	}
	

	// 1:1게시판 등록하기
	@RequestMapping(value = "pWriterInsert.tc", method = RequestMethod.POST)
	public String personalInsert(Personal personal, Model model, String pLang1, String pLang2, String pLang3,
			String tLang1, String tLang2, String tLang3,
			@RequestParam(name = "uploadFile", required = false) MultipartFile uploadFile, HttpServletRequest request) {

		// 파일을 서버에 저장하는 작업
		if (!uploadFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(uploadFile, request);
			if (filePath != null) {
				personal.setPersonalFilePath(uploadFile.getOriginalFilename());
			}
		}

		personal.setPersonalPLang(pLang1 + "," + pLang2 + "," + pLang3);
		personal.setPersonalTLang(tLang1 + "," + tLang2 + "," + tLang3);

		String path = null;
		int result = personalService.insertPersonal(personal, uploadFile, request);
		if (result > 0) {
			path = "redirect:plist.tc";
		} else {
			model.addAttribute("msg", "등록실패");
			path = "common/errorPage";
		}
		return path;
	}

	// 파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\pUploadFiles";

		// 저장 폴더 선택
		File folder = new File(savePath);

		// 만약 폴더가 없을 경우 자동 생성
		if (!folder.exists()) {
			folder.mkdir();
		}

		String filePath = folder + "\\" + file.getOriginalFilename();

		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return filePath;
	}

	// 1:1게시판 수정페이지 이동
	@RequestMapping("pUpdateView.tc")
	public String pWriterUpdateView(String memberId, Model model, int personalNo) {
		Member mem = memberService.selectMemberOne(memberId); // 해당 유저 정보가져옴
		Profile profile = memberService.selectProfileOne(mem.getMemberNo()); // 유저 프로필 정보
		model.addAttribute("personal", personalService.selectOne(personalNo));
		model.addAttribute("profile", profile);
		return "personal/personalWriterUpdateForm";
	}
	
	// 1:1게시판 수정
	@RequestMapping(value = "pWriterUpdate.tc", method = RequestMethod.POST)
	public String personalUpdate(Personal personal, Model model, String pLang1, String pLang2, String pLang3,
			String tLang1, String tLang2, String tLang3, HttpServletRequest request, MultipartFile reloadFile) {

		// 새로 업로드된 파일이 있을 경우
		if (reloadFile != null && !reloadFile.isEmpty()) {
			// 기존 업로드된 파일이 있을 경우
			if (personal.getPersonalFilePath() != null) {
				// 기존 파일 삭제
				deleteFile(personal.getPersonalFilePath(), request);
			}
			// 새로 업로드된 파일 저장
			String savePath = saveFile(reloadFile, request);
			// 새로 업로드된 파일이 잘 저장이 되었다면 디비 저장
			if (savePath != null) {
				personal.setPersonalFilePath(reloadFile.getOriginalFilename());
			}
		}

		personal.setPersonalPLang(pLang1 + "," + pLang2 + "," + pLang3);
		personal.setPersonalTLang(tLang1 + "," + tLang2 + "," + tLang3);

		System.out.println("---컨트롤러 Personal : " + personal.toString());
		int result = personalService.updatePersonal(personal);

		System.out.println("---컨트롤러 result : " + result);
		System.out.println("---컨트롤러 personalNo : " + personal.getPersonalNo());

		if (result > 0) {
			return "redirect:pDetail.tc?personalNo=" + personal.getPersonalNo() + "&memberId=" + personal.getMemberId();
		} else {
			model.addAttribute("msg", "등록실패");
			return "common/errorPage";
		}
	}

	// 파일(썸네일 이미지) 삭제
	// 기존 파일이 변한 경우 저장되어있는 기존 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\pUploadFiles";
		File deleteFile = new File(savePath + "\\" + fileName);
		if (deleteFile.exists()) {
			deleteFile.delete();
		}
	}

	// 1:1게시판 게시글 삭제
	@RequestMapping(value = "pWriterDelete.tc")
	public String noticeDelete(int personalNo, Model model, HttpServletRequest request, RedirectAttributes rd) {

		Personal personal = personalService.selectOne(personalNo);
		int result = personalService.deletePersonal(personalNo);
		if (result > 0) {
			if (personal.getPersonalFilePath() != null) {
				deleteFile(personal.getPersonalFilePath(), request);
			}
			rd.addAttribute("msg", "공지사항 삭제 성공");
			return "redirect:plist.tc";
		} else {
			model.addAttribute("msg", "공지사항 삭제 실패");
			return "common/errorPage";
		}
	}

	// 의뢰신청==========================================================================

	// 1:1 의뢰 신청폼으로 이동하기
	@RequestMapping("pRequestView.tc")
	public String pRequestView(int personalNo, Model model) {
		Personal personal = personalService.selectOne(personalNo);
		if (personal != null) {
			this.cutUselessStringOne(personal);
		}
		model.addAttribute("personal", personal);
		return "personal/personalRequestForm";
	}

	// 빛나님 작성
	// 1:1 의뢰 결제 페이지로 이동
	@RequestMapping(value = "personalPayView.tc", method = RequestMethod.GET)
	public String personalPayView(Model model, String memberId) {
		int pReqLastNo = personalService.selectPersonalLastNo(memberId);
		PersonalReqRep personalReqRep = personalService.selectReqRepOne(pReqLastNo);
		System.out.println(personalReqRep);
		model.addAttribute("personalReqRep", personalReqRep);
		return "member/personalPointPayment";
	}

	// 1:1 의뢰 신청 등록하기
	@RequestMapping(value = "pReqInsert.tc", method = RequestMethod.POST)
	public String requestInsert(PersonalReqRep personalReqRep, Files files, Model model,
			@RequestParam(name = "uploadFile", required = false) MultipartFile[] uploadFile,
			MultipartHttpServletRequest request, HttpServletRequest requestH, String memberId) {

		int result = 0;
		int resultFile = 0;
		String path = null;
		result = personalService.insertRequest(personalReqRep, requestH);
		
		if (result > 0) {
			int pReqLastNo = personalService.selectPersonalLastNo(memberId);
			files.setpReqNo(pReqLastNo);

			for (int i = 0; i < uploadFile.length; i++) {
				if (!uploadFile[i].getOriginalFilename().equals("")) {
					resultFile = fController.insertFile(files, model, uploadFile[i], requestH, memberId);
				}
			}
			if (resultFile > 0) {
				model.addAttribute("personalReqRep", personalReqRep);
				path = "redirect:personalPayView.tc?memberId=" + memberId;
			} else {
				model.addAttribute("msg", "파일 등록실패");
				path = "common/errorPage";
			}
		} else {
			model.addAttribute("msg", "신청 글 등록실패");
			path = "common/errorPage";
		}
		return path;

	}

	// ================ 0723 ~ 현꾸 작성 ======================
	// 의뢰 신청 목록 조회 (의뢰신청한거, 신청받은거 둘다)
	@RequestMapping(value = "myReqRepList.tc", method = RequestMethod.GET)
	public ModelAndView doGetReqRepList(ModelAndView mv, HttpSession session) {
		// 현재 로그인 유저 아이디 가져오기, 현재 로그인유저와 관련된 정보 조회
		String memberId = ((Member) session.getAttribute("loginUser")).getMemberId();
		// 표에 출력할 내용을 몇글자만 잘라서 출력할 것인지
		int showContent = 25; // 해당 길이만큼 잘라서 출력

		// 신청글 목록 페이징, 객체 ------------------------
		ArrayList<PersonalReqRep> doList = personalService.selectDoReqRepList(memberId);
		for (PersonalReqRep reqRep : doList) {
			// System.out.println("reqRep : " + reqRep);
			// System.out.println("reqContent :" + reqRep.getpReqContent());
			if (reqRep.getpReqContent().length() > showContent) {
				reqRep.setpReqContent(reqRep.getpReqContent().substring(0, showContent).concat("..."));
			}
		}

		// 신청받은 목록 페이징, 객체 ---------------------
		ArrayList<PersonalReqRep> getList = personalService.selectGetReqRepList(memberId);
		for (PersonalReqRep reqRep : getList) {
			if (reqRep.getpReqContent().length() > showContent) {
				reqRep.setpReqContent(reqRep.getpReqContent().substring(0, showContent).concat("..."));
			}
		}
		// 신청한 목록 객체
		mv.addObject("doList", doList);

		// 신청받은 목록 객체
		mv.addObject("getList", getList);
		mv.setViewName("member/myPersonalRequestList");

		return mv;
	}

	// 의뢰 신청글 한개 상세 조회
	@RequestMapping(value = "pReqRepDetail.tc", method = RequestMethod.GET)
	public String reqRepDetail(int pReqNo, int personalNo, Model model) {
		PersonalReqRep pReqRep = personalService.selectReqRepOne(pReqNo); // 신청 요청 글
		Personal personal = personalService.selectOne(personalNo); // 1:1 게시글

		// 상세 조회 값이 비어있지 않으면
		if (pReqRep != null && personal != null) {
			this.cutUselessStringOne(personal); // 없음 텍스트 제거
			model.addAttribute("pReqRep", pReqRep); // 신청 요청 글 정보
			model.addAttribute("personal", personal); // 1:1 게시글 정보

			// 해당 글에 등록된 파일 불러오기, flist 변수에 set
			model.addAttribute("flist", this.pReqRepFileLoad(pReqNo));

			// 상세 조회 페이지 리턴
			return "personal/personalRequestDetail";
		} else {
			model.addAttribute("msg", "의뢰 신청글 상세조회 실패");
			return "common/errorPage";
		}
	}

	// 의뢰 결과 글 작성 페이지로 이동하기
	   @RequestMapping(value = "pReqRepResultWrite.tc", method = RequestMethod.GET)
	   public String reqResultWriteView(int pReqNo, int personalNo, Model model) {
	      PersonalReqRep pReqRep = personalService.selectReqRepOne(pReqNo);// 신청 요청 글
	      Personal personal = personalService.selectOne(personalNo);// 1:1 게시글
	      if (pReqRep != null && personal != null) {
	         this.cutUselessStringOne(personal); // 없음 텍스트 제거
	         model.addAttribute("pReqRep", pReqRep);
	         model.addAttribute("personal", personal);

	         // 해당 글에 등록된 파일 불러오기, flist 변수에 set
	         model.addAttribute("flist", this.pReqRepFileLoad(pReqNo));
	         return "personal/personalResultWrite";
	      } else {
	         model.addAttribute("msg", "의뢰 결과 작성페이지 이동 실패");
	         return "common/errorPage";
	      }
	   }

	// 의뢰 결과 글 작성/답변하기 (번역결과 내용 업데이트)
	@RequestMapping(value = "pReqRepResultUpdate.tc", method = RequestMethod.POST)
	public String reqResultUpdate(PersonalReqRep personalReqRep) {
		int result = personalService.updateReqRepResult(personalReqRep);
		
		Alarm alarm = new Alarm(); // 0726-2 수정
		alarm.setMemberId(personalReqRep.getMemberId()); // 0726-2 수정
		alarm.setAlarmContent(" 게시물의 1:1 번역 의뢰 번역이 완료되었습니다."); // 0726-2 수정
		alarm.setBoardTitle("결과보러가기"); // 0726-2 수정
		alarm.setBoardAddress("pReqRepResultDetail.tc?pReqNo=" + personalReqRep.getpReqNo() + "&personalNo=" + personalReqRep.getPersonalNo() ); // 0726-2 수정
		int personalAlarm = alarmService.insertAlarm(alarm); // 0726-2 수정
		
		if (result > 0 && personalAlarm > 0) {
			int resultConfirmDate = personalService.insertConfirmDate(personalReqRep.getpReqNo());
			return "redirect:/myReqRepList.tc";
		} else {
			return "common/errorPage";
		}
	}

	// 의뢰 결과 완료 글 확인하기 (번역결과 내용 확인 상세보기)
	@RequestMapping(value = "pReqRepResultDetail.tc", method = RequestMethod.GET)
	public String reqResultDetail(int pReqNo, int personalNo, Model model) {
		PersonalReqRep pReqRep = personalService.selectReqRepOne(pReqNo); // 신청 요청 글
		Personal personal = personalService.selectOne(personalNo); // 1:1 게시글
		if (pReqRep != null && personal != null) {
			model.addAttribute("pReqRep", pReqRep); // 신청 요청 글 정보
			model.addAttribute("personal", personal); // 1:1 게시글 정보

			// 해당 글에 등록된 파일 불러오기, flist 변수에 set
			model.addAttribute("flist", this.pReqRepFileLoad(pReqNo));

			return "personal/personalResultDetail"; // 결과 상세조회 페이지
		} else {
			model.addAttribute("msg", "의뢰 신청글 상세조회 실패");
			return "common/errorPage";
		}
	}

	// pReqRep 파일 리스트 불러오기
	public ArrayList<Files> pReqRepFileLoad(int pReqNo) {
		Files files = new Files(); // 파일 도메인 객체 생성
		files.setpReqNo(pReqNo); // 요청신청글 번호 세팅
		ArrayList<Files> flist = fController.selectFileList(files); // 파일 리스트
		return flist;
	}

	// 의뢰 신청 글 승인하기(Accept : 'Y') - 알림추가
	@RequestMapping(value = "pReqRepAcceptY.tc", method = RequestMethod.GET)
	public String reqAcceptYUpdate(PersonalReqRep personalReqRep) {
		
		Alarm alarm = new Alarm(); // 0726-2 수정
		alarm.setMemberId(personalReqRep.getMemberId()); // 0726-2 수정
		alarm.setAlarmContent("번역가가 의뢰 신청을 승인하였습니다."); // 0726-2 수정
		alarm.setBoardTitle("내 의뢰 페이지 가기"); // 0726-2 수정
		alarm.setBoardAddress("myReqRepList.tc"); // 0726-2 수정
		int personalAlarm = alarmService.insertAlarm(alarm); // 0726-2 수정
		
		personalReqRep.setpReqAccept("Y");
		int result = personalService.updateReqRepAccept(personalReqRep);
		if (result > 0 && personalAlarm > 0) { // 0726-2 수정
			return "redirect:/myReqRepList.tc";
		} else {
			return "common/errorPage";
		}
	}

	// 의뢰 신청 글 반려하기(Accept : 'R') - 알림추가
	@RequestMapping(value = "pReqRepAcceptR.tc", method = RequestMethod.GET)
	public String reqAccectRUpdate(PersonalReqRep personalReqRep) {
		
		Alarm alarm = new Alarm(); // 0726-2 수정
		alarm.setMemberId(personalReqRep.getMemberId()); // 0726-2 수정
		alarm.setAlarmContent("번역가가 의뢰 신청을 거절하였습니다."); // 0726-2 수정
		alarm.setBoardTitle("내 의뢰 페이지 가기"); // 0726-2 수정
		alarm.setBoardAddress("myReqRepList.tc"); // 0726-2 수정
		int personalAlarm = alarmService.insertAlarm(alarm); // 0726-2 수정
		
		personalReqRep.setpReqAccept("R");
		int result = personalService.updateReqRepAccept(personalReqRep);
		if (result > 0 && personalAlarm > 0) { // 0726-2 수정
			return "redirect:/myReqRepList.tc";
		} else {
			return "common/errorPage";
		}
	}
	
	@Scheduled(cron = "0 0 * * * *")
	public void autoReqCheckBuyYUpdate() {
		
		ArrayList<PersonalReqRep> plist = null;
		plist = personalService.selectAutoReqRepList();
		
		if(!plist.isEmpty()) {
			for(int i=0; i<plist.size(); i++) {
				reqCheckBuyYUpdate(plist.get(i).getpReqNo());
			}
		} else {
			System.out.println("스케쥴러 성공!");
		}
	}

	// 의뢰 결과 글 구매 확정하기(CheckBuy : 'Y') - 알림추가
	@RequestMapping(value = "pReqRepCheckBuyY.tc", method = RequestMethod.GET)
	public String reqCheckBuyYUpdate(int pReqNo) {

		PersonalReqRep pReqRep = personalService.selectReqRepOne(pReqNo);

		PointChange pointChange = new PointChange();
		pointChange.setPointContent("번역 결과 확정");
		pointChange.setPointAmount(pReqRep.getpReqPrice());
		pointChange.setPointStatus("ADD");
		pointChange.setMemberId(pReqRep.getpRepTranslator());

		Member member = memberService.selectMemberOne(pReqRep.getpRepTranslator());
		member.setPoint(member.getPoint() + pReqRep.getpReqPrice());
		
		Alarm alarm = new Alarm(); // 0726-2 수정
		alarm.setMemberId(pReqRep.getpRepTranslator()); // 0726-2 수정
		alarm.setAlarmContent("의뢰자가 의뢰를 확정하였습니다."); // 0726-2 수정
		alarm.setBoardTitle("포인트 확인하러 가기"); // 0726-2 수정
		alarm.setBoardAddress("pointChangeMemberList.tc?memberId=" + pReqRep.getpRepTranslator()); // 0726-2 수정
		int personalAlarm = alarmService.insertAlarm(alarm); // 0726-2 수정
		
		int insertPointChange = memberService.insertPointChange(pointChange);
		int updateMemberPhoint = memberService.updateMemberPoint(member);

		int result = personalService.updateReqRepCheckBuyY(pReqNo);
		if (result > 0 && insertPointChange > 0 && updateMemberPhoint > 0 && personalAlarm > 0) {
			return "redirect:/myReqRepList.tc";
		} else {
			return "common/errorPage";
		}
	}

	// 과거 구매기록이 있는지 확인 - ajax
	@RequestMapping(value = "checkBuyHistory.tc", method = RequestMethod.POST)
	@ResponseBody
	public String checkBuyYHistory(PersonalReqRep personalReqRep) {
		int checkBuyYResult = personalService.checkBuyYHistory(personalReqRep);
		if (checkBuyYResult > 0) {
			return "Y";
		} else {
			return "N";
		}
	}

	// ----------------없음 텍스트를 제거하는 공통함수 (리스트)
	public ArrayList<Personal> cutUselessStringList(ArrayList<Personal> list) {
		for (Personal personal : list) {
			String pLangFull = personal.getPersonalPLang(); // pLang 원본 데이터
			String[] pLangList = pLangFull.split(","); // pLang 원본을 ','를 기준으로 자른다

			if (pLangList[2].equals("없음")) {
				if (pLangList[1].equals("없음")) {
					personal.setPersonalPLang(pLangList[0]);
				} else {
					personal.setPersonalPLang(pLangList[0] + ",&nbsp;" + pLangList[1]);
				}
			} else {
				personal.setPersonalPLang(pLangList[0] + ",&nbsp;" + pLangList[1] + ",&nbsp;" + pLangList[2]);
			}

			String tLangFull = personal.getPersonalTLang(); // tLang 원본 데이터
			String[] tLangList = tLangFull.split(","); // tLang 원본을 ','를 기준으로 자른다

			if (tLangList[2].equals("없음")) {
				if (tLangList[1].equals("없음")) {
					personal.setPersonalTLang(tLangList[0]);
				} else {
					personal.setPersonalTLang(tLangList[0] + ",&nbsp;" + tLangList[1]);
				}
			} else {
				personal.setPersonalTLang(tLangList[0] + ",&nbsp;" + tLangList[1] + ",&nbsp;" + tLangList[2]);
			}
		}
		return list;
	}

	// --------------- 없음 텍스트를 제거하는 공통함수 (객체 하나)
	public Personal cutUselessStringOne(Personal personal) {
		// 필요없는 데이터 자르기
		String pLangFull = personal.getPersonalPLang(); // pLang 원본 데이터
		String[] pLangList = pLangFull.split(","); // pLang 원본을 ','를 기준으로 자른다

		if (pLangList[2].equals("없음")) {
			if (pLangList[1].equals("없음")) {
				personal.setPersonalPLang(pLangList[0]);
			} else {
				personal.setPersonalPLang(pLangList[0] + ",&nbsp;" + pLangList[1]);
			}
		} else {
			personal.setPersonalPLang(pLangList[0] + ",&nbsp" + pLangList[1] + ",&nbsp;" + pLangList[2]);
		}

		String tLangFull = personal.getPersonalTLang(); // tLang 원본 데이터
		String[] tLangList = tLangFull.split(","); // tLang 원본을 ','를 기준으로 자른다

		if (tLangList[2].equals("없음")) {
			if (tLangList[1].equals("없음")) {
				personal.setPersonalTLang(tLangList[0]);
			} else {
				personal.setPersonalTLang(tLangList[0] + ",&nbsp;" + tLangList[1]);
			}
		} else {
			personal.setPersonalTLang(tLangList[0] + ",&nbsp;" + tLangList[1] + ",&nbsp;" + tLangList[2]);
		}
		return personal;
	}

	// 파일 리스트 불러오기

	// =============== 현꾸 작성 끝 =====================

	// -----------------------------------------안씀
	// ---------------------------------------
	// 1:1 의뢰 신청 다중파일 저장
	/*
	 * @RequestMapping(value = "reqUploadFile") public String
	 * reqSaveFile(MultipartHttpServletRequest mtfRequest) { List<MultipartFile>
	 * fileList = mtfRequest.getFiles("file");
	 * 
	 * String root =
	 * mtfRequest.getSession().getServletContext().getRealPath("resources"); String
	 * savePath = root + "\\reqUploadFile";
	 * 
	 * File folder = new File(savePath);
	 * 
	 * if(!folder.exists()) { folder.mkdir(); }
	 * 
	 * for (MultipartFile mf : fileList) {
	 * 
	 * String filePath = folder+"\\"+mf.getOriginalFilename();
	 * 
	 * try { mf.transferTo(new File(filePath)); } catch (IllegalStateException e) {
	 * // TODO Auto-generated catch block e.printStackTrace(); } catch (IOException
	 * e) { // TODO Auto-generated catch block e.printStackTrace(); } return
	 * filePath; } }
	 */

}