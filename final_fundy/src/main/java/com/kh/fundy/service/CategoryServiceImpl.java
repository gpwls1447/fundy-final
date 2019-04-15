package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.CategoryDao;
import com.kh.fundy.model.vo.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao dao;

	@Override
	public List<Category> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<Category> selectAllMid() {
		return dao.selectAllMid();
	}

	@Override
	public List<Category> selectAllMinor() {
		// TODO Auto-generated method stub
		return dao.selectAllMinor();
	}
	
	@Override
	public List<Map<String, Object>> selectProjectList(Map<String, String> ctgMap) {
		return dao.selectProjectList(ctgMap);
	}

	@Override
	public List<Map<String, Object>> selectEditorProjectList(Map<String, String> ctgMap) {
		return dao.selectEditorProjectList(ctgMap);
	}
	
	@Override
	public List<Map<String, Object>> selectNewSoonProjectList(String midCtg, String condition, String majorCode) {
		return dao.selectNewSoonProjectList(midCtg, condition, majorCode);
	}
}
