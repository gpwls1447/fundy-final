package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.Project;

public interface AdminService {
	
	//paging
	List<Project> selectList(int cPage, int numPerPage);
	int selectCount();
	

}
