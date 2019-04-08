package com.kh.fundy.model.vo;

import java.sql.Timestamp;

public class FundingLog {
	
	private int fundingLogNo;
	private String memberEmail;
	private int projectNo;
	private String deliveryStatCode;
	private int packageNo;
	private int packageAmount;
	private int extraMoney;
	private Timestamp funderDate;
	private String anonymous;
	
	private String memberNick;
	private int fundPrice;

	public FundingLog() {}

	public FundingLog(int fundingLogNo, String memberEmail, int projectNo, String deliveryStatCode, int packageNo,
			int packageAmount, int extraMoney, Timestamp funderDate, String anonymous, String memberNick,
			int fundPrice) {
		super();
		this.fundingLogNo = fundingLogNo;
		this.memberEmail = memberEmail;
		this.projectNo = projectNo;
		this.deliveryStatCode = deliveryStatCode;
		this.packageNo = packageNo;
		this.packageAmount = packageAmount;
		this.extraMoney = extraMoney;
		this.funderDate = funderDate;
		this.anonymous = anonymous;
		this.memberNick = memberNick;
		this.fundPrice = fundPrice;
	}

	public int getFundingLogNo() {
		return fundingLogNo;
	}

	public void setFundingLogNo(int fundingLogNo) {
		this.fundingLogNo = fundingLogNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getDeliveryStatCode() {
		return deliveryStatCode;
	}

	public void setDeliveryStatCode(String deliveryStatCode) {
		this.deliveryStatCode = deliveryStatCode;
	}

	public int getPackageNo() {
		return packageNo;
	}

	public void setPackageNo(int packageNo) {
		this.packageNo = packageNo;
	}

	public int getPackageAmount() {
		return packageAmount;
	}

	public void setPackageAmount(int packageAmount) {
		this.packageAmount = packageAmount;
	}

	public int getExtraMoney() {
		return extraMoney;
	}

	public void setExtraMoney(int extraMoney) {
		this.extraMoney = extraMoney;
	}

	public Timestamp getFunderDate() {
		return funderDate;
	}

	public void setFunderDate(Timestamp funderDate) {
		this.funderDate = funderDate;
	}

	public String getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(String anonymous) {
		this.anonymous = anonymous;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public int getFundPrice() {
		return fundPrice;
	}

	public void setFundPrice(int fundPrice) {
		this.fundPrice = fundPrice;
	}

}
