package com.kh.fundy.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Project;

@Repository
public class ProjectListDaoImpl implements ProjectListDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Project> selectList(int cPage, int numPerPage) {
		return session.selectList("project.selectList", new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectCount() {
		return session.selectOne("project.selectCount");
	}

	@Override
	public int insertOne(Project p) {
		return session.insert("project.insertOne");
	}
}
