package com.kh.fundy.model.vo;

public class Like {

	private int commentNo;
	private int commentReplyNo;
	private String memberEmail;
	
	public Like() {}
	
	public Like(int commentNo, int commentReplyNo, String memberEmail) {
		super();
		this.commentNo = commentNo;
		this.commentReplyNo = commentReplyNo;
		this.memberEmail = memberEmail;
	}

	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getCommentReplyNo() {
		return commentReplyNo;
	}
	public void setCommentReplyNo(int commentReplyNo) {
		this.commentReplyNo = commentReplyNo;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
	
	
}
