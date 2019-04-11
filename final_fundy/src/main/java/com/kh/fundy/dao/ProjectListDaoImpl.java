package com.kh.fundy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.FundingLog;
import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.OptionDetail;
import com.kh.fundy.model.vo.Project;

@Repository
public class ProjectListDaoImpl implements ProjectListDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Project> selectList(int cPage, int numPerPage, Map map) {
		return session.selectList("project.selectList", map, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectCount(Map map) {
		return session.selectOne("project.selectCount", map);
	}

	@Override
	public int insertOne(Project p) {
		return session.insert("project.insertOne");
	}

	@Override
	public Project selectOne(int projectNo) {
		return session.selectOne("project.selectOne", projectNo);
	}

	@Override
	public List<FundingLog> selectFunderList(int projectNo) {
		return session.selectList("project.selectFunderList", projectNo);
	}

	@Override
	public List<FundingOption> selectFundingOptionList(int projectNo) {
		return session.selectList("project.selectFundingOptionList", projectNo);
	}

	@Override
	public List<OptionDetail> selectOptionDetailList(int projectNo) {
		return session.selectList("project.selectOptionDetailList", projectNo);
	}

	@Override
	public int memberDelete(String memberEmail) {
		return session.selectOne("project.memberDelete", memberEmail);
	}
	
}
