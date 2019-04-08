package com.kh.fundy.model.vo;

import java.sql.Timestamp;

public class RndPackage {
	
	private int projectNo;
	private int packageNo;
	private Timestamp endDate;
	
	public RndPackage() {}

	public RndPackage(int projectNo, int packageNo, Timestamp endDate) {
		super();
		this.projectNo = projectNo;
		this.packageNo = packageNo;
		this.endDate = endDate;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public int getPackageNo() {
		return packageNo;
	}

	public void setPackageNo(int packageNo) {
		this.packageNo = packageNo;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	
}
