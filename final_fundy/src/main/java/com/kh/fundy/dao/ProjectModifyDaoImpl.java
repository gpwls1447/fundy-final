package com.kh.fundy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectModifyDaoImpl implements ProjectModifyDao {
	@Autowired
	private SqlSessionTemplate session;

}
