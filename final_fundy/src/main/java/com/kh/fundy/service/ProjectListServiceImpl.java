package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.ProjectListDao;
import com.kh.fundy.model.vo.FundingLog;
import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.Project;

@Service
public class ProjectListServiceImpl implements ProjectListService {

	@Autowired
	private ProjectListDao dao;

	@Override
	public int selectCount(Map map) {
		return dao.selectCount(map);
	}

	@Override
	public List<Project> selectList(int cPage, int numPerPage, Map map) {
		return dao.selectList(cPage, numPerPage, map);
	}

	@Override
	public Project selectOne(int projectNo) {
		return dao.selectOne(projectNo);
	}

	@Override
	public List<FundingLog> selectFunderList(int projectNo) {
		return dao.selectFunderList(projectNo);
	}

	@Override
	public int memberDelete(String memberEmail) {
		return dao.memberDelete(memberEmail);
	}


}
