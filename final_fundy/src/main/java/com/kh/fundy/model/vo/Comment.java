package com.kh.fundy.model.vo;

import java.sql.Timestamp;
import java.util.List;

public class Comment {
	
	private int commentNo;
	private int projectNo;
	private String memberEmail;
	private String commentContent;
	private Timestamp commentDate;
	private Timestamp commentMod;
	private Timestamp commentDelete;
	private List<CommentReply> crList;
	
	public Comment() {}

	public Comment(int commentNo, int projectNo, String memberEmail, String commentContent, Timestamp commentDate,
			Timestamp commentMod, Timestamp commentDelete, List<CommentReply> crList) {
		super();
		this.commentNo = commentNo;
		this.projectNo = projectNo;
		this.memberEmail = memberEmail;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
		this.commentMod = commentMod;
		this.commentDelete = commentDelete;
		this.crList = crList;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Timestamp getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}

	public Timestamp getCommentMod() {
		return commentMod;
	}

	public void setCommentMod(Timestamp commentMod) {
		this.commentMod = commentMod;
	}

	public Timestamp getCommentDelete() {
		return commentDelete;
	}

	public void setCommentDelete(Timestamp commentDelete) {
		this.commentDelete = commentDelete;
	}

	public List<CommentReply> getCrList() {
		return crList;
	}

	public void setCrList(List<CommentReply> crList) {
		this.crList = crList;
	}
	
}
