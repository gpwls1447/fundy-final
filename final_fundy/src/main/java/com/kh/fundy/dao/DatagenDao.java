package com.kh.fundy.dao;

import java.util.Map;

import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.OptionDetail;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.model.vo.RndPackage;

public interface DatagenDao {
	
	int insertProject(Project p);
	int insertFundingOp(FundingOption fo);
	int insertOptionDetail(OptionDetail od);
	Member selectRndMember(int rndRnum);
	RndPackage selectRndPackage(Map<String, Integer> map);
}
