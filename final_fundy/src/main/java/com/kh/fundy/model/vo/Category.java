package com.kh.fundy.model.vo;

public class Category {
	
	private String majorCode;
	private String majorName;
	private String midCode;
	private String midName;
	private String minorCode;
	private String minorName;
	private String midImage;
	
	public Category() {}

	public Category(String majorCode, String majorName, String midCode, String midName, String minorCode,
			String minorName, String midImage) {
		super();
		this.majorCode = majorCode;
		this.majorName = majorName;
		this.midCode = midCode;
		this.midName = midName;
		this.minorCode = minorCode;
		this.minorName = minorName;
		this.midImage = midImage;
	}

	public String getMajorCode() {
		return majorCode;
	}

	public void setMajorCode(String majorCode) {
		this.majorCode = majorCode;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getMidCode() {
		return midCode;
	}

	public void setMidCode(String midCode) {
		this.midCode = midCode;
	}

	public String getMidName() {
		return midName;
	}

	public void setMidName(String midName) {
		this.midName = midName;
	}

	public String getMinorCode() {
		return minorCode;
	}

	public void setMinorCode(String minorCode) {
		this.minorCode = minorCode;
	}

	public String getMinorName() {
		return minorName;
	}

	public void setMinorName(String minorName) {
		this.minorName = minorName;
	}

	public String getMidImage() {
		return midImage;
	}

	public void setMidImage(String midImage) {
		this.midImage = midImage;
	}
	
}
