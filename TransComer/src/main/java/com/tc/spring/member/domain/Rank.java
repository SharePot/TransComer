package com.tc.spring.member.domain;

import com.tc.spring.personal.domain.Personal;
import com.tc.spring.review.domain.Review;

public class Rank {
	
	private Member member;
	private Profile profile;
	private Personal personal;
	private Review review;
	private double rageAvg;
	
	public Rank() {}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public Personal getPersonal() {
		return personal;
	}

	public void setPersonal(Personal personal) {
		this.personal = personal;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public double getRageAvg() {
		return rageAvg;
	}

	public void setRageAvg(double rageAvg) {
		this.rageAvg = rageAvg;
	}

	@Override
	public String toString() {
		return "Rank [member=" + member + ", profile=" + profile + ", personal=" + personal + ", review=" + review
				+ ", rageAvg=" + rageAvg + "]";
	}

}
