package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.AskBoardDao;
import com.kh.fundy.model.vo.AskBoard;
import com.kh.fundy.model.vo.AskReply;

@Service
public class AskBoardServiceImpl implements AskBoardService {

	@Autowired
	private AskBoardDao dao;
	
	//전체보기
	@Override
	public List<Map<String,String>> selectList(int cPage, int numPerPage) {
		
		return dao.selectList(cPage,numPerPage);
	}

	@Override
	public int selectCount() {
		
		return dao.selectCount();
	}
	
	//작성하기
	@Override
	public int insertAskBoard(AskBoard askBoard) {
		
		return dao.insertAskBoard(askBoard);
	}

	//삭제
	@Override
	public int askBoardDelete(AskBoard ab) {
		
		return dao.askBoardDelete(ab);
	}
	
	//상세보기
	@Override
	public AskBoard askBoardView(int askNo) {
		return dao.askBoardView(askNo);
	}
	
	//수정하기
	@Override
	public int askBoardUpdate(AskBoard askBoard) {
		return dao.askBoardUpdate(askBoard);
	}

	
	//댓글보이기
	@Override
	public List<AskReply> replyView(int askNo) {
		return dao.replyView(askNo);
	}

	//상태바에 필요한 댓글리스트
	@Override
	public List<AskReply> askReplyList() {
		return dao.AskReplyList();
	}

	

	
	

	
	
	
}
