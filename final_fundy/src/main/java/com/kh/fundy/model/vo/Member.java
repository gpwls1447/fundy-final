package com.kh.fundy.model.vo;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Entity;

@Entity
public class Member {
	
	@Column
	private int memberNo;
	private String memberEmail;
	private String memberPw;
	private String memberName;
	@Column
	private String memberNick;
	private String memberProfile;
	private int shipAddrNo;
	private String intro;
	private String emailAuthKey;
	private String phoneAuthKey;
	private Timestamp lastLoggedIn;
	private Timestamp enrollDate;
	private Timestamp memberQuit;
	private String kakaoId;
	
	public Member() {}

	public Member(int memberNo, String memberEmail, String memberPw, String memberName, String memberNick,
			String memberProfile, int shipAddrNo, String intro, String emailAuthKey, String phoneAuthKey,
			Timestamp lastLoggedIn, Timestamp enrollDate, Timestamp memberQuit, String kakaoId) {
		super();
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberNick = memberNick;
		this.memberProfile = memberProfile;
		this.shipAddrNo = shipAddrNo;
		this.intro = intro;
		this.emailAuthKey = emailAuthKey;
		this.phoneAuthKey = phoneAuthKey;
		this.lastLoggedIn = lastLoggedIn;
		this.enrollDate = enrollDate;
		this.memberQuit = memberQuit;
		this.kakaoId = kakaoId;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getMemberProfile() {
		return memberProfile;
	}

	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}

	public int getShipAddrNo() {
		return shipAddrNo;
	}

	public void setShipAddrNo(int shipAddrNo) {
		this.shipAddrNo = shipAddrNo;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getEmailAuthKey() {
		return emailAuthKey;
	}

	public void setEmailAuthKey(String emailAuthKey) {
		this.emailAuthKey = emailAuthKey;
	}

	public String getPhoneAuthKey() {
		return phoneAuthKey;
	}

	public void setPhoneAuthKey(String phoneAuthKey) {
		this.phoneAuthKey = phoneAuthKey;
	}

	public Timestamp getLastLoggedIn() {
		return lastLoggedIn;
	}

	public void setLastLoggedIn(Timestamp lastLoggedIn) {
		this.lastLoggedIn = lastLoggedIn;
	}

	public Timestamp getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Timestamp enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Timestamp getMemberQuit() {
		return memberQuit;
	}

	public void setMemberQuit(Timestamp memberQuit) {
		this.memberQuit = memberQuit;
	}

	public String getKakaoId() {
		return kakaoId;
	}

	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}

}