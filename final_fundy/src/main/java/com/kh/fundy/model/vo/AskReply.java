package com.kh.fundy.model.vo;

import java.util.Date;

public class AskReply {

	private int askReplyNo;
	private int askNo;
	private String askReplyContent;
	private Date askReplyDate;
	private Date askReplyDelete;
	private Date askReplyEdit;
	
	
	public AskReply() {
		// TODO Auto-generated constructor stub
	}


	public AskReply(int askReplyNo, int askNo, String askReplyContent, Date askReplyDate, Date askReplyDelete,
			Date askReplyEdit) {
		super();
		this.askReplyNo = askReplyNo;
		this.askNo = askNo;
		this.askReplyContent = askReplyContent;
		this.askReplyDate = askReplyDate;
		this.askReplyDelete = askReplyDelete;
		this.askReplyEdit = askReplyEdit;
	}


	public int getAskReplyNo() {
		return askReplyNo;
	}


	public void setAskReplyNo(int askReplyNo) {
		this.askReplyNo = askReplyNo;
	}


	public int getAskNo() {
		return askNo;
	}


	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}


	public String getAskReplyContent() {
		return askReplyContent;
	}


	public void setAskReplyContent(String askReplyContent) {
		this.askReplyContent = askReplyContent;
	}


	public Date getAskReplyDate() {
		return askReplyDate;
	}


	public void setAskReplyDate(Date askReplyDate) {
		this.askReplyDate = askReplyDate;
	}


	public Date getAskReplyDelete() {
		return askReplyDelete;
	}


	public void setAskReplyDelete(Date askReplyDelete) {
		this.askReplyDelete = askReplyDelete;
	}


	public Date getAskReplyEdit() {
		return askReplyEdit;
	}


	public void setAskReplyEdit(Date askReplyEdit) {
		this.askReplyEdit = askReplyEdit;
	}


	@Override
	public String toString() {
		return "AskReply [askReplyNo=" + askReplyNo + ", askNo=" + askNo + ", askReplyContent=" + askReplyContent
				+ ", askReplyDate=" + askReplyDate + ", askReplyDelete=" + askReplyDelete + ", askReplyEdit="
				+ askReplyEdit + "]";
	}
	
	
}
