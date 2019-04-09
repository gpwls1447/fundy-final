package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.Comment;
import com.kh.fundy.model.vo.CommentReply;

public interface CommentDao {
	
	int insertComment(Comment c);
	int insertCommentReply(CommentReply cr);
	int selectCommentCount(int projectNo);
	List<Comment> selectCommentList(int cPage, int numPerPage, int projectNo);
	List<CommentReply> selectCommentReply(int commentNo);
}
