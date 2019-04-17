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
	private String memberProfile;
	
	
	public Message() {}


	public Message(String senderEmail, String receiverEmail, String messageContent, Date messageDate, int projectNo,
			String hasRead, String projectTitle, String memberProfile) {
		super();
		this.senderEmail = senderEmail;
		this.receiverEmail = receiverEmail;
		this.messageContent = messageContent;
		this.messageDate = messageDate;
		this.projectNo = projectNo;
		this.hasRead = hasRead;
		this.projectTitle = projectTitle;
		this.memberProfile = memberProfile;
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


	public String getMemberProfile() {
		return memberProfile;
	}


	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}

}
