package com.kh.fundy.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.AskBoard;
import com.kh.fundy.model.vo.AskReply;

@Repository
public class AskBoardDaoImpl implements AskBoardDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<AskBoard> selectList(int cPage, int numPerPage) {
		
		return session.selectList("askBoard.selectList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectCount() {
		
		return session.selectOne("askBoard.selectCount");
	}

	//작성
	@Override
	public int insertAskBoard(AskBoard askBoard) {
		
		return session.insert("askBoard.insertAskBoard",askBoard);
	}
	
	//삭제
	@Override
	public int askBoardDelete(int askNo) {
		
		return session.delete("askBoard.deleteAskBoard",askNo);
	}

	//상세보기
	@Override
	public AskBoard askBoardView(int askNo) {
		return session.selectOne("askBoard.askBoardView",askNo);
	}

	//수정하기
	@Override
	public int askBoardUpdate(AskBoard askBoard) {
		return session.update("askBoard.askBoardUpdate",askBoard);
	}

	//댓글보여주기
	@Override
	public List<AskReply> replyView(int askNo) {
		return session.selectList("askBoard.replyView",askNo);
	}

	

	
	
	
	
}
