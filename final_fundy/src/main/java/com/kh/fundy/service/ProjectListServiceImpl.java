package com.kh.fundy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.ProjectListDao;
import com.kh.fundy.model.vo.Project;

@Service
public class ProjectListServiceImpl implements ProjectListService {

	@Autowired
	private ProjectListDao dao;
	
	@Override
	public int selectCount() {
		return dao.selectCount();
	}

	@Override
	public List<Project> selectList(int cPage, int numPerPage) {
		return dao.selectList(cPage, numPerPage);
	}

}
