package com.kh.fundy.service;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.Project;

public interface DatagenService {
	
	int insertProject(Project p);
	Member selectRndMember(int rndRnum);

}
