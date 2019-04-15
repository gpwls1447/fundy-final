package com.kh.fundy.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectModifyDaoImpl implements ProjectModifyDao {
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public Map<String, Object> selectProject(int projectNo) {
		return session.selectOne("projectModify.selectProject", projectNo);
	}
	
	@Override
	public List<Map<String, Object>> selectFundingOption(int projectNo) {
		return session.selectList("projectModify.selectFundingOption", projectNo);
	}
	
	@Override
	public List<Map<String, Object>> selectOptionDetail(int projectNo) {
		return session.selectList("projectModify.selectOptionDetail", projectNo);
	}
}
