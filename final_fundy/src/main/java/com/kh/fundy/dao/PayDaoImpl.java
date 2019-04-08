package com.kh.fundy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.FundingLog;

@Repository
public class PayDaoImpl implements PayDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int insertFundingLog(FundingLog fl) {
		return session.insert("pay.insertFundingLog", fl);
	}

}
