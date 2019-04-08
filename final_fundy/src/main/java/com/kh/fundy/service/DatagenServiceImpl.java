package com.kh.fundy.service;

import java.sql.Timestamp;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.DatagenDao;
import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.OptionDetail;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.model.vo.RndPackage;

@Service
public class DatagenServiceImpl implements DatagenService {
	
	@Autowired
	private DatagenDao dao;

	@Override
	public int insertProject(Project p) {
		int result = dao.insertProject(p);

		FundingOption fo = new FundingOption();
		OptionDetail od = new OptionDetail();
		
		for(int i = 0 ; i < 5 ; i++)
		{
			fo.setProjectNo(p.getProjectNo());
			fo.setFundPrice(1000*((int)(Math.random()*25)+1));
			fo.setDeliveryDate(new Timestamp(p.getEndDate().getTime()+2629800000L));
			dao.insertFundingOp(fo);

			for(int j = 0 ; j < (int)(Math.random()*3)+1 ; j++)
			{
				od.setPackageNo(fo.getPackageNo());
				od.setPackageName("구성품 "+(j+1));
				od.setPackageAmount(1);
				dao.insertOptionDetail(od);
			}
		}
		return result;
	}

	@Override
	public Member selectRndMember(int rndRnum) {
		return dao.selectRndMember(rndRnum);
	}

	@Override
	public RndPackage selectRndPackage(Map<String, Integer> map) {
		return dao.selectRndPackage(map);
	}
	
}
