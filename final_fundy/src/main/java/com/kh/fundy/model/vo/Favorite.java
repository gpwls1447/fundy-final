package com.kh.fundy.model.vo;

public class Favorite {
	
	private String memberEmail;
	private int projectNo;
	
	public Favorite() {}

	public Favorite(String memberEmail, int projectNo) {
		super();
		this.memberEmail = memberEmail;
		this.projectNo = projectNo;
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

	@Override
	public String toString() {
		return "Favorite [memberEmail=" + memberEmail + ", projectNo=" + projectNo + "]";
	};
	
	

}
