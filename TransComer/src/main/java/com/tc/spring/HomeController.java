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

		ArrayList<Rank> rAcList = memberService.rankAdoptC();
		ArrayList<Rank> sList = memberService.starA();

		for (Rank rank : sList) {
			System.out.println("sList" + sList);
		}

		model.addAttribute("rAc", rAcList);
		model.addAttribute("star", sList);

		return "common/main";
	}

}