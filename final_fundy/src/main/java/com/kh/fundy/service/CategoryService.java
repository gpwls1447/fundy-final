package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

import com.kh.fundy.model.vo.Category;

public interface CategoryService {
	
	List<Category> selectAll();
	List<Category> selectAllMid();
	List<Category> selectAllMinor();
	List<Map<String, Object>> selectProjectList(Map<String, String> ctgMap);
	List<Map<String, Object>> selectEditorProjectList(Map<String, String> ctgMap);
	List<Map<String, Object>> selectNewSoonProjectList(String midCtg, String condition, String majorCode);
}
