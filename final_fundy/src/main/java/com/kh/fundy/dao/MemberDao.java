package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;

public interface MemberDao {

	int memberCount();
	int memberDeleteAll();
	int insertOne(Member m);
	Member login(Member m);
	List<Member> selectList();
	Member selectOneKakao(Member m);
	String selectCountUserAuth(String memberEmail);
	int insertUserAuth(String memberEmail, String key);
	int updateUserAuth(String memberEmail, String key);
	
}
