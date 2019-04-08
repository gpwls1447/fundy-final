package com.kh.fundy.dao;

import java.util.List;

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

}
