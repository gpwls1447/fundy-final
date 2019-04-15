package com.kh.fundy.dao;

import java.util.List;
import java.util.Map;

import com.kh.fundy.model.vo.AskBoard;
import com.kh.fundy.model.vo.AskReply;

public interface AskBoardDao {

	List<Map<String,String>> selectList(int cPage,int numPerPage);
	int selectCount();
	//작성하기
	int insertAskBoard(AskBoard askBoard);
	//삭제
	int askBoardDelete(AskBoard ab);
	//상세보기
	AskBoard askBoardView(int askNo);
	//수정하기
	int askBoardUpdate(AskBoard askBoard);
	//댓글보기
	List<AskReply> replyView(int askNo);
	//상태바에 필요한 댓글리스트
	List<AskReply> AskReplyList();
	
}
