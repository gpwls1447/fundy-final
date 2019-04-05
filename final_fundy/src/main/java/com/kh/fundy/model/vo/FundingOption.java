package com.kh.fundy.model.vo;

import java.sql.Timestamp;
import java.util.List;

public class FundingOption {
	
	private int projectNo;
	private int fundPrice;
	private Timestamp deliveryDate;
	private List<OptionDetail> odList;
	
	public FundingOption () {}

	public FundingOption(int projectNo, int fundPrice, Timestamp deliveryDate, List<OptionDetail> odList) {
		super();
		this.projectNo = projectNo;
		this.fundPrice = fundPrice;
		this.deliveryDate = deliveryDate;
		this.odList = odList;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public int getFundPrice() {
		return fundPrice;
	}

	public void setFundPrice(int fundPrice) {
		this.fundPrice = fundPrice;
	}

	public Timestamp getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Timestamp deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public List<OptionDetail> getOdList() {
		return odList;
	}

	public void setOdList(List<OptionDetail> odList) {
		this.odList = odList;
	}
	
}
