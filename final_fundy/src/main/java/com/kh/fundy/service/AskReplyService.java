package com.kh.fundy.service;

import com.kh.fundy.model.vo.AskReply;

public interface AskReplyService {

	//댓글 입력하기
	int insertReply(AskReply askReply);
	//댓글 삭제하기
	int deleteReply(AskReply askReply);
}
