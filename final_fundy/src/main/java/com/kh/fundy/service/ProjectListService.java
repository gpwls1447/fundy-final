package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

import com.kh.fundy.model.vo.FundingLog;
import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.Project;

public interface ProjectListService {

	int selectCount(Map map);
	List<Project> selectList(int cPage, int numPerPage, Map map);
	Project selectOne(int projectNo);
	List<FundingLog> selectFunderList(int projectNo);
	int memberDelete(String memberEmail);
	List<FundingOption> selectFundingOptionList(int projectNo);
}
