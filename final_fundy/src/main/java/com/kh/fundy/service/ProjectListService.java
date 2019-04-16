package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

import com.kh.fundy.model.vo.FundingLog;
import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.Project;

public interface ProjectListService {

	int selectCount(Map map);
	List<Project> selectList(int cPage, int numPerPage, Map map);
	Project selectOne(Map map);
	List<FundingLog> selectFunderList(int projectNo);
	List<FundingOption> selectFundingOptionList(int projectNo);
	int myDonationCount(String memberEmail);
	List<Project> myDonationList(String memberEmail);
	int projectCount(String memberEmail);
}
