package com.kh.fundy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.AskReplyDao;
import com.kh.fundy.model.vo.AskReply;

@Service
public class AskReplyServiceImpl implements AskReplyService {

	@Autowired
	private AskReplyDao dao;

	
	//댓글작성
	@Override
	public int insertReply(AskReply askReply) {
		return dao.insertReply(askReply);
		
	
	}

	//댓글 삭제
	@Override
	public int deleteReply(AskReply askReply) {
		return dao.deleteReply(askReply);
	}
	
	
	
}
