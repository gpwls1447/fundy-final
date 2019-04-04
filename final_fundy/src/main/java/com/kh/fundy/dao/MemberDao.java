package com.kh.fundy.dao;

import com.kh.fundy.model.vo.Member;

public interface MemberDao {

	int memberCount();
	int memberDeleteAll();
	int insertOne(Member m);
	Member login(Member m);
}
