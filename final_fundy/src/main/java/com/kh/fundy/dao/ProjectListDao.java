package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.Project;

public interface ProjectListDao {
	
	List<Project> selectList(int cPage, int numPerPage);
	int selectCount();
	int insertOne(Project p);
}
