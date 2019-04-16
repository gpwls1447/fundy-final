package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.Category;

public interface CategoryService {
	
	List<Category> selectAll();
	List<Category> selectAllMid();
	List<Category> selectAllMinor();
}
