package com.kh.fundy.dao;

import com.kh.fundy.model.vo.AskReply;

public interface AskReplyDao {

	//댓글작성
	int insertReply(AskReply askReply);
	//댓글 삭제
	int deleteReply(AskReply askReply);
}
