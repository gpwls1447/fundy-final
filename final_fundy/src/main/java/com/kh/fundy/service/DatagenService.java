package com.kh.fundy.service;

import java.util.Map;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.model.vo.RndPackage;

public interface DatagenService {
	
	int insertProject(Project p);
	Member selectRndMember(int rndRnum);
	RndPackage selectRndPackage(Map<String, Integer> map);
}
