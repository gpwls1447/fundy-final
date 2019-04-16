package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.Category;

public interface CategoryDao {

	List<Category> selectAll();
	List<Category> selectAllMid();
	List<Category> selectAllMinor();
	
}
