package com.kh.fundy.dao;

import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.OptionDetail;
import com.kh.fundy.model.vo.Project;

public interface DatagenDao {
	
	int insertProject(Project p);
	int insertFundingOp(FundingOption fo);
	int insertOptionDetail(OptionDetail od);
	Member selectRndMember(int rndRnum);
}
