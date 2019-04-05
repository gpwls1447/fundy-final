package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.AskBoard;

public interface AskBoardService {
	
	List<AskBoard> selectList(int cPage,int numPerPage);
	
	int selectCount();
	
	
}
