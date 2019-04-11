package com.kh.fundy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Category> selectAll() {
		return session.selectList("category.selectAll");
	}

	@Override
	public List<Category> selectAllMid() {
		return session.selectList("category.selectAllMid");
	}

	@Override
	public List<Category> selectAllMinor() {
		return session.selectList("category.selectAllMinor");
	}
	
	@Override
	public List<Map<String, Object>> selectProjectList(Map<String, String> ctgMap) {
		return session.selectList("category.selectProjectList", ctgMap);
	}

	@Override
	public List<Map<String, Object>> selectEditorProjectList(Map<String, String> ctgMap) {
		return session.selectList("category.selectEditorProjectList", ctgMap);
	}
	
	@Override
	public List<Map<String, Object>> selectNewSoonProjectList(String midCtg, String condition) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("midCtg", midCtg);
		map.put("condition", condition);
		return session.selectList("category.selectNewSoonProjectList", map);
	}
}
