package com.kh.fundy.model.vo;

import java.util.Date;

public class AskBoard {

	private int askNo;
	private String askTitle;
	private String askWriter;
	private String askContent;
	private Date askDate;
	private Date askDelete;
	private Date askMod;
	
	public AskBoard() {
		// TODO Auto-generated constructor stub
	}

	
	
	public AskBoard(int askNo, String askTitle, String askWriter, String askContent, Date askDate, Date askDelete,
			Date askMod) {
		super();
		this.askNo = askNo;
		this.askTitle = askTitle;
		this.askWriter = askWriter;
		this.askContent = askContent;
		this.askDate = askDate;
		this.askDelete = askDelete;
		this.askMod = askMod;
	}



	public int getAskNo() {
		return askNo;
	}

	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}

	public String getAskTitle() {
		return askTitle;
	}

	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}

	public String getAskWriter() {
		return askWriter;
	}

	public void setAskWriter(String askWriter) {
		this.askWriter = askWriter;
	}

	public String getAskContent() {
		return askContent;
	}

	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}

	public Date getAskDate() {
		return askDate;
	}

	public void setAskDate(Date askDate) {
		this.askDate = askDate;
	}

	public Date getAskDelete() {
		return askDelete;
	}

	public void setAskDelete(Date askDelete) {
		this.askDelete = askDelete;
	}

	public Date getAskMod() {
		return askMod;
	}

	public void setAskMod(Date askMod) {
		this.askMod = askMod;
	}



	@Override
	public String toString() {
		return "AskBoard [askNo=" + askNo + ", askTitle=" + askTitle + ", askWriter=" + askWriter + ", askContent="
				+ askContent + ", askDate=" + askDate + ", askDelete=" + askDelete + ", askMod=" + askMod + "]";
	}
	
	
}
