package com.kh.fundy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.PayDao;
import com.kh.fundy.model.vo.FundingLog;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	private PayDao dao;

	@Override
	public int insertFundingLog(FundingLog fl) {
		return dao.insertFundingLog(fl);
	}
	
}
