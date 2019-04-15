package com.kh.fundy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.AskReply;

@Repository
public class AskReplyDaoImpl implements AskReplyDao {

	
	@Autowired
	private SqlSessionTemplate session;

	
	//댓글작성
	@Override
	public int insertReply(AskReply askReply) {
		return session.insert("askReply.insertReply",askReply);
	}


	@Override
	public int deleteReply(AskReply askReply) {
		return session.update("askReply.deleteReply",askReply);
	}
	
	
	
	
}
