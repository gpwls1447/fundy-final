package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.ProjectModifyDao;

@Service
public class ProjectModifyServiceImpl implements ProjectModifyService {
	@Autowired
	private ProjectModifyDao dao;
	
	@Override
	public Map<String, Object> selectProject(int projectNo) {
		return dao.selectProject(projectNo);
	}
	
	@Override
	public List<Map<String, Object>> selectFundingOption(int projectNo) {
		return dao.selectFundingOption(projectNo);
	}
	
	@Override
	public List<Map<String, Object>> selectOptionDetail(int projectNo) {
		return dao.selectOptionDetail(projectNo);
	}
}
