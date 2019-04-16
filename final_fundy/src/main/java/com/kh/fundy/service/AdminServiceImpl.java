package com.kh.fundy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.AdminDao;
import com.kh.fundy.model.vo.Project;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao dao;

	//paging
	@Override
	public List<Project> selectList(int cPage, int numPerPage) {
		return dao.selectList(cPage, numPerPage);
	}

	@Override
	public int selectCount() {
		return dao.selectCount();
	}
	
	
	

}
