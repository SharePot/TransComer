package com.tc.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.tc.spring.alarm.domain.Alarm;
import com.tc.spring.alarm.service.AlarmService;
import com.tc.spring.common.Pagination;
import com.tc.spring.member.domain.Member;
import com.tc.spring.member.domain.MemberPageInfo;
import com.tc.spring.member.domain.MemberSearch;
import com.tc.spring.member.domain.PointChange;
import com.tc.spring.member.domain.PointRefund;
import com.tc.spring.member.domain.Profile;
import com.tc.spring.member.domain.ProfileSearch;
import com.tc.spring.member.service.MemberService;
import com.tc.spring.personal.domain.PersonalReqRep;
import com.tc.spring.personal.service.PersonalService;
import com.tc.spring.study.domain.Study;
import com.tc.spring.study.domain.StudyPageInfo;
import com.tc.spring.study.domain.StudySearch;
import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@SessionAttributes({ "loginUser" })
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private AlarmService alarmService;
	@Autowired
	private PersonalService pesonalService;

	// 회원리스트
	@RequestMapping("memberList.tc")
	public ModelAndView memberList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int memberListCount = memberService.getMemberListCount();

		MemberPageInfo pi = Pagination.getMemberPageInfo(currentPage, memberListCount);
		ArrayList<Member> list = memberService.selectMemberList(pi);

		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("member/memberList");
		} else {
			mv.addObject("msg", "회원리스트 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}


	// 로그인
	@RequestMapping(value = "login.tc", method = RequestMethod.POST)
	@ResponseBody
	public String memberLogin(Member member, Model model) {
		Member loginUser = memberService.loginMember(member);

		if (loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "success";
		} else {
			return "fail";
		}
	}

	// 로그인 페이지
	@RequestMapping("loginPage.tc")
	public String loginPage() {
		return "member/login";
	}

	// 로그아웃
	@RequestMapping("logout.tc")
	public String memberLogout(SessionStatus status) {
		status.setComplete();
		return "redirect:home.tc";
	}

	// 멤버 세부사항
	@RequestMapping("memberDetail.tc")
	public String memberSelectOne(Model model, String String) {
		model.addAttribute("member", memberService.selectMemberOne(String));
		return "member/memberDetail";
	}

	// 멤버 검색
	@RequestMapping("memberSearch.tc")
	public String memberSearch(MemberSearch search, Model model,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int MemberSearchListCount = memberService.getMemberSearchListCount(search);
		MemberPageInfo pi = Pagination.getMemberPageInfo(currentPage, MemberSearchListCount);
		ArrayList<Member> searchList = memberService.selectMemberSearchList(pi, search);

		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		model.addAttribute("pi", pi);
		return "member/memberList";
	}

	// 회원 마이페이지
	@RequestMapping("myPage.tc")
	public String myPage() {
		return "member/myPage";
	}

	// 관리자페이지
	@RequestMapping("adminPage.tc")
	public String adminPage() {
		return "member/adminPage";
	}

	// 로그인 아이디 중복 체크
	@RequestMapping("IdCheck.tc")
	@ResponseBody
	public String memberCheck(String mId, String pwd, Member member, Model model) {
		member.setMemberId(mId);
		member.setMemberPw(pwd);

		int result = memberService.checkMember(member);
		String re = Integer.toString(result);

		return re;

	}

	// 비밀번호 변경
	@RequestMapping("PwdRe.tc")
	public String ChangePwd(String pass, String userId) {

		Map<String, Object> set = new HashMap<String, Object>();
		set.put("pass", pass);
		set.put("userId", userId);
		System.out.println(set);

		int result = memberService.updatePwd(set);

		return ""; // 페이지 입력
	}

	// 비밀번호 찾기
	@PostMapping(value = "findPwd.tc")
	public void sendSms(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/* System.out.println("컨트롤러"); */
		String memberId = request.getParameter("mId");
		String memberPhone = request.getParameter("mPhone");
		Map<String, Object> vo = new HashMap<String, Object>();
		vo.put("memberId", memberId);
		vo.put("memberPhone", memberPhone);
		int result = memberService.findPassword(vo);

		if (result > 0) {
			int random = (int) Math.floor(Math.random() * 1000000 + 1);
			String num = String.valueOf(random);
			System.out.println("인증번호  : " + num);

			String api_key = "NCSQRYFYWSSQWR9L";
			String api_secret = "5HDDHICZIJNB6CLPJ2ICEV3A7DRQSMVW";
			Message coolsms = new Message(api_key, api_secret);

			HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", memberPhone);
			params.put("from", "01022632566");
			params.put("type", "SMS");
			params.put("text", "[Farms] - 인증번호는 : " + num + "입니다.");

			response.getWriter().println(num);
		
		} else {
			response.setCharacterEncoding("utf-8");
			response.getWriter().println("올바른 인증번호를 입력해주세요");
		}

	}

	// 아이디 찾기
	@RequestMapping(value = "findID.tc", method = RequestMethod.GET)
	public void findId(String memberEmail, HttpServletResponse res) throws JsonIOException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();

		String userId = memberService.findId(memberEmail);
		System.out.println(userId);

		if (userId == null) {
			map.put("userId", "등록된 아이디가 없습니다.");
		} else {
			map.put("userId", "" + userId + "");
			// key값 , 벨류 값
		}

		Gson gson = new Gson();
		gson.toJson(map, res.getWriter());

	}

	// 회원가입 페이지
	@RequestMapping("erollView.tc")
	public String enrollView() {
		return "member/enroll";
	}


	// 회원가입
		@RequestMapping(value = "minsert.tc", method = RequestMethod.POST)
		public ModelAndView memberInsert(Member member, ModelAndView mv, String post, String address1, String address2,
				String bankName, String accountNumber, String accountName) {
			member.setAddress(post + "," + address1 + "," + address2);
			member.setAccount(bankName + "," + accountNumber + "," + accountName);
			// vo에 넣기전에 하나로 붙여서 집어 넣어준다.
			
			Alarm alarm = new Alarm(); // 수정
			alarm.setAlarmContent("SharePot 회원가입을 축하드립니다."); // 수정
			alarm.setMemberId(member.getMemberId()); // 수정
			
			int adoptAlarm = alarmService.insertAlarm(alarm); // 수정
			int result = memberService.insertMember(member);
			System.out.println("result 값은 ? : " + result);
			if (result > 0 && adoptAlarm > 0 ) { // 수정
				mv.setViewName("home");
				// model과 mv의 차이점: https://hongku.tistory.com/116
			} else {
				mv.addObject("msg", "다시 회원가입을 시도해 주세요.");
				mv.setViewName("common/errorPage");
				// model 비즈니스로직 수행하는 곳
			}
			return mv;
		}


	// 회원정보 수정
	@RequestMapping(value = "mupdate.tc", method = RequestMethod.POST)
	public String memberUpdate(Member member, Model model, String post, String address1, String address2,
			String bankName, String accountNumber, String accountName, RedirectAttributes rd) {
		member.setAddress(post + "," + address1 + "," + address2);
		member.setAccount(bankName + "," + accountNumber + "," + accountName);
		int result = memberService.updateMember(member);
		if (result > 0) {
			model.addAttribute("loginUser", member);
			rd.addFlashAttribute("msg", "회원정보 수정이 완료되었습니다.");
			return "redirect:home.tc"; // 경로 설정 해주기

		} else {
			model.addAttribute("msg", "회원정보 수정에 실패하였습니다.");
			return "common/errorPage";
		}
	}

	// 탈퇴화면
	@RequestMapping("deleteMemberView.tc")
	public String deleteView() {
		return "member/deleteMember";
	}

	// 탈퇴하기
	@RequestMapping(value = "memberDelete.tc", method = { RequestMethod.POST, RequestMethod.GET })
	public String memberDelete(String memberId, Model model, SessionStatus status) {

		int result = memberService.deleteMember(memberId);

		if (result > 0) {
			status.setComplete();
			return "redirect:home.tc";
		} else {
			return "common/errorPage";
		}

	}

	// 아이디 중복 검사
	@ResponseBody
	@RequestMapping("enrollIdCheck.tc")
	public String idDuplicateCheck(String memberId) {

		boolean isUsable = memberService.checkIdDup(memberId) == 0 ? true : false;
		return isUsable + "";

	}

	// 포인트 충전 페이지
	@RequestMapping("paymentView.tc")
	public String paymentView() {
		return "member/payment";
	}

	// 포인트 충전(결제 api)
	@RequestMapping("payment.tc")
	public String payMent(String userId, int amounts, Model model) {

		/*포인트 변동 내역 추가 및 업데이트를 위한 코드*/
		PointChange pointChange= new PointChange();
		pointChange.setPointContent("포인트 충전");
		pointChange.setPointAmount(amounts);
		pointChange.setPointStatus("ADD");
		pointChange.setMemberId(userId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("amount", amounts);
		int result = memberService.payMent(map);
		int insertPointChange=memberService.insertPointChange
				
				(pointChange);
		
		Member loginUser = memberService.userRefrash(userId);
		model.addAttribute("loginUser", loginUser);

		if (result > 0 && insertPointChange>0) {
			return "redirect:home.tc";
		} else { // 실패 했을때
			return "common/errorPage";
		}
	}
	
	
	
	//프리미엄 가입 화면
	@RequestMapping("premiumEnrollView.tc")
	public String premiupEnrollView() {
		return "member/premiumEnroll";
	}
	
	//프리미엄 결제 화면
		@RequestMapping("premiumPayment.tc")
		public String premiumPayment() {
			return "member/premiumPointPayment";
		}
		
	//프리미엄 가입 메소드
	@RequestMapping(value = "memberUpdatePreminum.tc", method = RequestMethod.POST)
	public String memberUpdatePreminum(Member member, Model model) {
		member.setStatus("PREMIUM");
		
		PointChange pointChange= new PointChange();
		pointChange.setPointContent("프리미엄 가입");
		pointChange.setPointAmount(13000);
		pointChange.setPointStatus("LESS");
		pointChange.setMemberId(member.getMemberId());
		
		Member member2 = memberService.selectMemberOne(member.getMemberId());
		member2.setPoint(member2.getPoint()-13000);
		
		int insertPointChange=memberService.insertPointChange(pointChange);
		int updateMemberPhoint=memberService.updateMemberPoint(member2);
		int result = memberService.memberUpdatePreminum(member);
		
		if (result > 0 && insertPointChange>0&& updateMemberPhoint>0) {
			return "member/myPage";
		} else {
			model.addAttribute("msg", "프리미엄 가입 실패");
			return "common/errorPage";
		}
	}
	//프리미엄 해지 메소드
		public String memberUpdatePrimary(Member member, Model model) {
			int result = memberService.memberUpdatePrimary(member);
			
			if (result > 0) {
				return "member/adminPage";
			} else {
				model.addAttribute("msg", "프리미엄 해지 실패");
				return "common/errorPage";
			}
		}

	
	// 포인트변동=============================================================================

	// 관리자페이지에서 포인트 변동리스트 전체
	@RequestMapping("pointChangeList.tc")
	public ModelAndView pointChageList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int pointChangeListCount = memberService.getPointRefundListCount();

		MemberPageInfo pi = Pagination.getMemberPageInfo(currentPage, pointChangeListCount);
		ArrayList<PointChange> list = memberService.selectPointChangeList(pi);

		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("member/pointChangeList");
		} else {
			mv.addObject("msg", "포인트 변동 리스트 조회 실패");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}

	// 회원 마이페이지에서 포인트 변동리스트 전체
	@RequestMapping("pointChangeMemberList.tc")
	public String pointChageMemberList(String memberId, Model model,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int pointChangeMemberListCount = memberService.getPointChangeMemberCount(memberId);
		MemberPageInfo pi = Pagination.getMemberPageInfo(currentPage, pointChangeMemberListCount);
		ArrayList<PointChange> list = memberService.selectPointChangeMemberList(pi, memberId);

		model.addAttribute("list", list);
		model.addAttribute("memberId", memberId);
		model.addAttribute("pi", pi);
		return "member/memberPointChangeList";
	}
	
	
	
	// 1:1 의뢰 승인 및 포인트 업데이트 
	@RequestMapping(value="personalPayUpdate.tc",method=RequestMethod.POST)
	public String personalPointUpdate(PersonalReqRep personalReqRep, Model model) {
		System.out.println("member"+personalReqRep);
		PointChange pointChange= new PointChange();
		pointChange.setPointContent("1:1 번역 의뢰 포인트 결제");
		pointChange.setPointAmount(personalReqRep.getpReqPrice());
		pointChange.setPointStatus("LESS");
		pointChange.setMemberId(personalReqRep.getMemberId());
		
		Member member = memberService.selectMemberOne(personalReqRep.getMemberId());
		member.setPoint(member.getPoint()-personalReqRep.getpReqPrice());
		
		
		personalReqRep.setpReqAccept("C");
		int insertPointChange=memberService.insertPointChange(pointChange);
		int updateMemberPhoint=memberService.updateMemberPoint(member);
		int result = pesonalService.updateReqRepAccept(personalReqRep);
		
		if (result > 0 && insertPointChange>0&& updateMemberPhoint>0) {
			return "member/myPage";
		} else {
			model.addAttribute("msg", "프리미엄 가입 실패");
			return "common/errorPage";
		}
	}
	
	
	

	
	// 포인트 환급=============================================================================

	// 포인트 환급 리스트 조회
	@RequestMapping("pointRefundList.tc")
	public ModelAndView pointRefundList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int pointRefundListCount = memberService.getPointRefundListCount();

		MemberPageInfo pi = Pagination.getMemberPageInfo(currentPage, pointRefundListCount);
		ArrayList<PointRefund> list = memberService.selectPointRefundList(pi);

		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("member/pointRefundList");
		} else {
			mv.addObject("msg", "포인트 환급 리스트 조회 실패");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}

	// 포인트 환급신청 화면
	@RequestMapping("pointRefundRequestView.tc")
	public String pointRefundRequestView() {
		return "member/pointRefundRequestForm";
	}

	// 포인트 환급 신청
	@RequestMapping(value = "pointRefundInsert.tc", method = RequestMethod.POST)
	public String pointRefundInsert(PointRefund pointRefund, Model model, String bank, String accountOwner,
			String account) {
		pointRefund.setAccountInfo(bank + "," + accountOwner + "," + account);
		
		PointChange pointChange= new PointChange();
		pointChange.setPointContent("포인트 환급");
		pointChange.setPointAmount(pointRefund.getRefundPoint());
		pointChange.setPointStatus("LESS");
		pointChange.setMemberId(pointRefund.getMemberId());
		
		Member member=memberService.selectMemberOne(pointRefund.getMemberId());
		member.setPoint(member.getPoint()-pointRefund.getRefundPoint());
		
		int insertPointChange=memberService.insertPointChange(pointChange);
		int updateMemberPhoint=memberService.updateMemberPoint(member);
		int result = memberService.insertPointRefund(pointRefund);
		if (result > 0  && insertPointChange>0 && updateMemberPhoint>0) {
			return "member/myPage";
		} else {
			model.addAttribute("msg", "포인트 환급 신청 실패");
		}
		return "common/errorPage";
	}

	// 포인트 환급 확정화면
	@RequestMapping("pointRefundCheckView.tc")
	public String pointRefundCheckView(Model model, int refundNo) {
		model.addAttribute("pointRefund", memberService.selectPointRefundOne(refundNo));
		return "member/pointRefundCheckView";
	}

	// 포인트 환급 확정 및 반려
	   @RequestMapping(value = "pointRefundUpdate.tc", method = RequestMethod.GET)
	   public String pointRefundUpdate(PointRefund pointRefund, Model model) {
	      int result = memberService.updatePointRefund(pointRefund);
	      
	      Alarm alarm = new Alarm();
	      alarm.setAlarmContent(pointRefund.getRefundRequestDate() + "에 신청한 " + pointRefund.getRefundPoint() + " 포인트 환급이 완료되었습니다.");
	      alarm.setMemberId(pointRefund.getMemberId());
	      
	      int refundAlarm = alarmService.insertAlarm(alarm);
	      
	      if (result > 0 && refundAlarm > 0) {
	         return "member/pointRefundList";
	      } else {
	         model.addAttribute("msg", "포인트 환급 확정 및 반려 실패");
	         return "common/errorPage";
	      }
	   }

	// =============================================================================


	// 프로필 등록 회원 전체 리스트
		@RequestMapping("profileList.tc")
		public ModelAndView profileList(ModelAndView mv, @RequestParam(value = "page", required = false)Integer page) {
			
			int currentPage = (page != null) ? page : 1;
			int listCount = memberService.getPfListCount();
			MemberPageInfo pi = Pagination.getMemberPageInfo(currentPage, listCount);
			ArrayList<Profile> pfList = memberService.selectProfileList(pi);
			if (!pfList.isEmpty()) {
				mv.addObject("pi", pi);
				mv.addObject("pfList", pfList);
				mv.setViewName("profile/profileList");
			} else {
				mv.setViewName("common/errorPage");
			}

			return mv;

		}

	// 프로필 상세보기
	@RequestMapping("profileDetail.tc")
	public String profileDetail(int memberNo, Model model) {
		Profile profile = memberService.selectProfileOne(memberNo);
		if (profile != null) {
			model.addAttribute("profile", profile);
			return "profile/profileList";
		} else {
			return "common/errorPage";
		}
	}

	// 프로필 등록 화면 열기
	@RequestMapping("profileInsertView.tc")
	public String profileInsertView() {
		return "profile/profileInsertForm";

	}

	// 프로필 등록
	@RequestMapping(value = "profileInsert.tc", method = RequestMethod.POST)
	public String insertProfile(Profile profile, int memberNo, Model model,
			@RequestParam(name = "uploadFile", required = false) MultipartFile uploadFile, HttpServletRequest request) {

		if (!uploadFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(uploadFile, request);
			if (filePath != null) {
				profile.setProfileFilePath(uploadFile.getOriginalFilename());
			}
		}

		String path = null;

		int result = memberService.insertProfile(profile, uploadFile, request);
		int profileStatus = memberService.updateStatusY(memberNo);

		if (result > 0) {
			if (profileStatus > 0) {
				path = "redirect:profileDetail.tc?memberNo=" + profile.getMemberNo();
			}
			path = "redirect:profileDetail.tc?memberNo=" + profile.getMemberNo();
		} else {
			path = "common/errorPage";
		}

		return path;
	}
	// 파일 저장
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";

		File folder = new File(savePath);

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

	// 프로필 수정 화면
	@RequestMapping("profileUpdateView.tc")
	public String noticeUpdateView(int memberNo, Model model) {
		model.addAttribute("profile", memberService.selectProfileOne(memberNo));
		return "profile/profileUpdateForm";
	}

	// 프로필 수정하기
	@RequestMapping(value = "profileUpdate.tc", method = RequestMethod.POST)
	public String ProfileUpdate(Profile profile, Model model, HttpServletRequest request, MultipartFile reloadFile) {

		if (reloadFile != null && !reloadFile.isEmpty()) {

			if (profile.getProfileFilePath() != null) {
				deleteFile(profile.getProfileFilePath(), request);
			}

			String savePath = saveFile(reloadFile, request);

			if (savePath != null) {
				profile.setProfileFilePath(reloadFile.getOriginalFilename());
			}

		}

		int result = memberService.updateProfile(profile);
		if (result > 0) {
			return "redirect:profileDetail.tc?memberNo=" + profile.getMemberNo();
		} else {
			return "common/errorPage";
		}

	}

	// 파일 삭제하기
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resorces");
		String savePath = root + "\\uploadFiles";

		File deleteFile = new File(savePath + "\\" + fileName);

		if (deleteFile.exists()) {
			deleteFile.delete();
		}
	}

	// 프로필 삭제하기
	@RequestMapping("profileDelete.tc")
	public String profileDelete(int memberNo, Model model, HttpServletRequest request, RedirectAttributes rd) {

		Profile profile = memberService.selectProfileOne(memberNo);
		int result = memberService.deleteProfile(memberNo);
		int profileStatusN = memberService.updateStatusN(memberNo);

		if (result > 0) {
			if (profile.getProfileFilePath() != null) {
				deleteFile(profile.getProfileFilePath(), request);

				if (profileStatusN > 0) {
					return "redirect:myPage.tc";
				}
			}
			return "redirect:myPage.tc";
		}

		return "common/errorPage";
	}
	
	// 프로필 등록 회원 검색

		@RequestMapping("profileSearch.tc")
		public String profileSearch(ProfileSearch pfSearch, Model model, @RequestParam(value="page", required=false)Integer page) {
			
			int currentPage = (page != null) ? page : 1;
			int listCount = memberService.getPfSearchListCount(pfSearch);
			MemberPageInfo pi = Pagination.getMemberPageInfo(currentPage, listCount);
			ArrayList<Profile> pfSearchList = memberService.searchProfile(pfSearch, pi);
			
			model.addAttribute("list", pfSearchList);
			model.addAttribute("search", pfSearch);
			model.addAttribute("pi", pi);
			
			return "profile/profileList";
			
		}


}
