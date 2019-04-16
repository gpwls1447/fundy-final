package com.kh.fundy.model.vo;

import java.sql.Timestamp;

public class MyDonation {
	
	private int projectNo;
	private String projectThumnail;
	private String projectTitle;
	private String projectStatName;
	private Timestamp endDate;
	private Timestamp funderDate;
	private int packageAmount;
	private int fundPrice;
	private int extraMoney;
	
	public MyDonation() {}

	public MyDonation(int projectNo, String projectThumnail, String projectTitle, String projectStatName,
			Timestamp endDate, Timestamp funderDate, int packageAmount, int fundPrice, int extraMoney) {
		super();
		this.projectNo = projectNo;
		this.projectThumnail = projectThumnail;
		this.projectTitle = projectTitle;
		this.projectStatName = projectStatName;
		this.endDate = endDate;
		this.funderDate = funderDate;
		this.packageAmount = packageAmount;
		this.fundPrice = fundPrice;
		this.extraMoney = extraMoney;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getProjectThumnail() {
		return projectThumnail;
	}

	public void setProjectThumnail(String projectThumnail) {
		this.projectThumnail = projectThumnail;
	}

	public String getProjectTitle() {
		return projectTitle;
	}

	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}

	public String getProjectStatName() {
		return projectStatName;
	}

	public void setProjectStatName(String projectStatName) {
		this.projectStatName = projectStatName;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public Timestamp getFunderDate() {
		return funderDate;
	}

	public void setFunderDate(Timestamp funderDate) {
		this.funderDate = funderDate;
	}

	public int getPackageAmount() {
		return packageAmount;
	}

	public void setPackageAmount(int packageAmount) {
		this.packageAmount = packageAmount;
	}

	public int getFundPrice() {
		return fundPrice;
	}

	public void setFundPrice(int fundPrice) {
		this.fundPrice = fundPrice;
	}

	public int getExtraMoney() {
		return extraMoney;
	}

	public void setExtraMoney(int extraMoney) {
		this.extraMoney = extraMoney;
	}
	
}
