package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.Comment;
import com.kh.fundy.model.vo.CommentReply;

public interface CommentService {
		
	int insertComment(Comment c);
	int insertCommentReply(CommentReply cr);
	int selectCommentCount(int projectNo);
	List<Comment> selectCommentList(int cPage, int numPerPage, int projectNo);
}