package com.kh.fundy.model.vo;

import java.util.Date;

public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private Date noticeDelete;
	private Date noticeEdit;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date noticeDate, Date noticeDelete,
			Date noticeEdit) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeDelete = noticeDelete;
		this.noticeEdit = noticeEdit;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public Date getNoticeDelete() {
		return noticeDelete;
	}

	public void setNoticeDelete(Date noticeDelete) {
		this.noticeDelete = noticeDelete;
	}

	public Date getNoticeEdit() {
		return noticeEdit;
	}

	public void setNoticeEdit(Date noticeEdit) {
		this.noticeEdit = noticeEdit;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", noticeDelete=" + noticeDelete + ", noticeEdit=" + noticeEdit + "]";
	}
	
	
	
	
	
	
}
