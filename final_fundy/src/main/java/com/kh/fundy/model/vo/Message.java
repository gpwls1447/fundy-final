package com.kh.fundy.model.vo;

import java.util.Date;

public class Message {

	private String senderEmail;
	private String receiverEmail;
	private String messageContent;
	private Date messageDate;
	private int projectNo;
	private String hasRead;
	private String projectTitle;
	
	
	public Message() {
		// TODO Auto-generated constructor stub
	}


	public Message(String senderEmail, String receiverEmail, String messageContent, Date messageDate, int projectNo,
			String hasRead, String projectTitle) {
		super();
		this.senderEmail = senderEmail;
		this.receiverEmail = receiverEmail;
		this.messageContent = messageContent;
		this.messageDate = messageDate;
		this.projectNo = projectNo;
		this.hasRead = hasRead;
		this.projectTitle = projectTitle;
	}


	public String getSenderEmail() {
		return senderEmail;
	}


	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}


	public String getReceiverEmail() {
		return receiverEmail;
	}


	public void setReceiverEmail(String receiverEmail) {
		this.receiverEmail = receiverEmail;
	}


	public String getMessageContent() {
		return messageContent;
	}


	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}


	public Date getMessageDate() {
		return messageDate;
	}


	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}


	public int getProjectNo() {
		return projectNo;
	}


	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}


	public String getHasRead() {
		return hasRead;
	}


	public void setHasRead(String hasRead) {
		this.hasRead = hasRead;
	}


	public String getProjectTitle() {
		return projectTitle;
	}


	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}


	@Override
	public String toString() {
		return "Message [senderEmail=" + senderEmail + ", receiverEmail=" + receiverEmail + ", messageContent="
				+ messageContent + ", messageDate=" + messageDate + ", projectNo=" + projectNo + ", hasRead=" + hasRead
				+ ", projectTitle=" + projectTitle + "]";
	}

	
}
