package com.kh.fundy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDaoImpl implements MainDao {
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, Object>> selectProjectList(Map<String, String> ctgMap) {
		return session.selectList("mainMapped.selectProjectList", ctgMap);
	}

	@Override
	public List<Map<String, Object>> selectEditorProjectList(Map<String, String> ctgMap) {
		return session.selectList("mainMapped.selectEditorProjectList", ctgMap);
	}
	
	@Override
	public List<Map<String, Object>> selectNewSoonProjectList(String midCtg, String condition, String majorCode) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("midCtg", midCtg);
		map.put("condition", condition);
		map.put("majorCode", majorCode);
		return session.selectList("mainMapped.selectNewSoonProjectList", map);
	}
	
	@Override
	public List<Map<String, String>> selectPagingList(Map<String, String> paraMap) {
		return session.selectList("mainMapped.selectPagingList", paraMap);
	}
	
	@Override
	public int selectTotalCount(String majorCode) {
		return session.selectOne("mainMapped.selectTotalCount", majorCode);
	}
}
