package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.AskBoard;

public interface AskBoardDao {

	List<AskBoard> selectList(int cPage,int numPerPage);
	int selectCount();
}
