package com.kh.fundy.service;

import com.kh.fundy.model.vo.Member;

public interface MemberService {

	int memberCount();
	int memberDeleteAll();
	int insertOne(Member m);
	Member login(Member m);
	
}
