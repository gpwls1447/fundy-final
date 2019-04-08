package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.AskBoard;

public interface AskBoardDao {

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
}
