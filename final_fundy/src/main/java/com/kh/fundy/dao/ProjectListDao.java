package com.kh.fundy.dao;

import java.util.List;
import java.util.Map;

import com.kh.fundy.model.vo.FundingLog;
import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.OptionDetail;
import com.kh.fundy.model.vo.Project;

public interface ProjectListDao {
	
	int selectCount(Map map);
	List<Project> selectList(int cPage, int numPerPage, Map map);
	int insertOne(Project p);
	Project selectOne(int projectNo);
	List<FundingLog> selectFunderList(int projectNo);
	List<FundingOption> selectFundingOptionList(int projectNo);
	List<OptionDetail> selectOptionDetailList(int projectNo);
	int memberDelete(String memberEmail);
}
