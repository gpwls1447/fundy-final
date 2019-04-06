package com.kh.fundy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.OptionDetail;
import com.kh.fundy.model.vo.Project;

@Repository
public class DatagenDaoImpl implements DatagenDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int insertProject(Project p) {
		return session.insert("project.insertOne", p);
	}
	
	@Override
	public int insertFundingOp(FundingOption fo) {
		return session.insert("project.insertFundingOp", fo);
	}

	@Override
	public int insertOptionDetail(OptionDetail od) {
		return session.insert("project.insertOptionDetail", od);
	}

	@Override
	public Member selectRndMember(int rndRnum) {
		return session.selectOne("datagen.selectRndMember", rndRnum);
	}
	
}
