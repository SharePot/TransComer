package com.tc.spring;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tc.spring.member.domain.Rank;
import com.tc.spring.member.service.MemberService;
import com.tc.spring.review.service.ReviewService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private ReviewService reviewService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.tc", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		// 등록된 게시글 랭킹
		ArrayList<Rank> rAcList = memberService.rankAdoptC();

		// 별점 랭킹
		// ArrayList, starA는 평균 별점이 높은순으로 맴버 리스트를 불러온다
		ArrayList<Rank> sList = memberService.starA();

		// 만약 sList가 비어있지 않다면, sList에 대한 세팅을 한다
		if (!sList.isEmpty()) {
			// sList 각각의 회원에 대한 Rank 정보 세팅
			for (Rank rank : sList) {
				// 회원 정보 Member 세팅
				rank.setMember(memberService.selectMemberOne(rank.getReview().getRevTargetMemberId()));
				// System.out.println(">>> rank의 Member 정보 : " + rank.getMember());
				// 프로필 세팅
				rank.setProfile(memberService.selectProfileOne(rank.getMember().getMemberNo()));
				// System.out.println(">>> rank의 Profile 정보 : " + rank.getProfile());
				// 평균 별점 세팅
				rank.setRageAvg(reviewService.selectMemberStarRageAvg(rank.getReview().getRevTargetMemberId()));
				// System.out.println(">>>>> rank 객체의 rageAvg값 : " + rank.getRageAvg());
			}
		}

		model.addAttribute("rAc", rAcList);
		model.addAttribute("star", sList);

		return "common/main";
	}

}