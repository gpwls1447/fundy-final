package com.kh.fundy.model.vo;

import java.sql.Timestamp;
import java.util.List;

public class Project {
	
	private int projectNo;
	private String projectTitle;
	private String projectContent;
	private Timestamp beginDate;
	private Timestamp endDate;
	private int goalPrice;
	private String recommended;
	private String recImageName;
	private int anchorCount;
	private String projectStatCode;
	private String projectSumary;
	private String projectPhone;
	private String projectEmail;
	private String minorCode;
	private String settled;
	private Timestamp projectFormDate;
	private List<FundingOption> foList;
	
	public Project() {}

	public Project(int projectNo, String projectTitle, String projectContent, Timestamp beginDate, Timestamp endDate,
			int goalPrice, String recommended, String recImageName, int anchorCount, String projectStatCode,
			String projectSumary, String projectPhone, String projectEmail, String minorCode, String settled,
			Timestamp projectFormDate, List<FundingOption> foList) {
		super();
		this.projectNo = projectNo;
		this.projectTitle = projectTitle;
		this.projectContent = projectContent;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.goalPrice = goalPrice;
		this.recommended = recommended;
		this.recImageName = recImageName;
		this.anchorCount = anchorCount;
		this.projectStatCode = projectStatCode;
		this.projectSumary = projectSumary;
		this.projectPhone = projectPhone;
		this.projectEmail = projectEmail;
		this.minorCode = minorCode;
		this.settled = settled;
		this.projectFormDate = projectFormDate;
		this.foList = foList;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getProjectTitle() {
		return projectTitle;
	}

	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}

	public String getProjectContent() {
		return projectContent;
	}

	public void setProjectContent(String projectContent) {
		this.projectContent = projectContent;
	}

	public Timestamp getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Timestamp beginDate) {
		this.beginDate = beginDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public int getGoalPrice() {
		return goalPrice;
	}

	public void setGoalPrice(int goalPrice) {
		this.goalPrice = goalPrice;
	}

	public String getRecommended() {
		return recommended;
	}

	public void setRecommended(String recommended) {
		this.recommended = recommended;
	}

	public String getRecImageName() {
		return recImageName;
	}

	public void setRecImageName(String recImageName) {
		this.recImageName = recImageName;
	}

	public int getAnchorCount() {
		return anchorCount;
	}

	public void setAnchorCount(int anchorCount) {
		this.anchorCount = anchorCount;
	}

	public String getProjectStatCode() {
		return projectStatCode;
	}

	public void setProjectStatCode(String projectStatCode) {
		this.projectStatCode = projectStatCode;
	}

	public String getProjectSumary() {
		return projectSumary;
	}

	public void setProjectSumary(String projectSumary) {
		this.projectSumary = projectSumary;
	}

	public String getProjectPhone() {
		return projectPhone;
	}

	public void setProjectPhone(String projectPhone) {
		this.projectPhone = projectPhone;
	}

	public String getProjectEmail() {
		return projectEmail;
	}

	public void setProjectEmail(String projectEmail) {
		this.projectEmail = projectEmail;
	}

	public String getMinorCode() {
		return minorCode;
	}

	public void setMinorCode(String minorCode) {
		this.minorCode = minorCode;
	}

	public String getSettled() {
		return settled;
	}

	public void setSettled(String settled) {
		this.settled = settled;
	}

	public Timestamp getProjectFormDate() {
		return projectFormDate;
	}

	public void setProjectFormDate(Timestamp projectFormDate) {
		this.projectFormDate = projectFormDate;
	}

	public List<FundingOption> getFoList() {
		return foList;
	}

	public void setFoList(List<FundingOption> foList) {
		this.foList = foList;
	}

}
