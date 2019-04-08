package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.Member;

public interface MemberService {

	int memberCount();
	int memberDeleteAll();
	int insertOne(Member m);
	Member login(Member m);
	List<Member> selectList();
	Member selectOneKakao(Member m);
	
	
}
