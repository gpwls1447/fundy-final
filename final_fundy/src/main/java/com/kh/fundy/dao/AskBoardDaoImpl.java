package com.kh.fundy.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.AskBoard;

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

	
}
