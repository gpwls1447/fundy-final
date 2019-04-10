package com.kh.fundy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.CommentDao;
import com.kh.fundy.model.vo.Comment;
import com.kh.fundy.model.vo.CommentReply;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDao dao;
	
	@Override
	public int insertComment(Comment c) {
		return dao.insertComment(c);
	}

	@Override
	public int insertCommentReply(CommentReply cr) {
		return dao.insertCommentReply(cr);
	}
	
	@Override
	public int selectCommentCount(int projectNo) {
		return dao.selectCommentCount(projectNo);
	}

	@Override
	public List<Comment> selectCommentList(int cPage, int numPerPage, int projectNo) {

		List<Comment> result = dao.selectCommentList(cPage, numPerPage, projectNo);
		for(Comment c : result)
		{
			c.setCrList(dao.selectCommentReply(c.getCommentNo()));
		}
		return result;
	}

	@Override
	public int updateComment(Comment c) {
		return dao.updateComment(c);
	}

	@Override
	public int updateCommentReply(CommentReply cr) {
		return dao.updateCommentReply(cr);
	}

	@Override
	public int deleteComment(Comment c) {
		return dao.deleteComment(c);
	}

	@Override
	public int deleteCommentReply(CommentReply cr) {
		return dao.deleteCommentReply(cr);
	}

}
