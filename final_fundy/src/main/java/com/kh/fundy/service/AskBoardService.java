package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.AskBoard;
import com.kh.fundy.model.vo.AskReply;

public interface AskBoardService {
	
	List<AskBoard> selectList(int cPage,int numPerPage);
	int selectCount();
	//작성하기
	int insertAskBoard(AskBoard askBoard);
	//삭제
	int askBoardDelete(int askNo);
	//상세보기
	AskBoard askBoardView(int askNo);
	//수정하기
	int askBoardUpdate(AskBoard askBoard);
	//댓글 보이기
	List<AskReply> replyView(int askNo);
}
