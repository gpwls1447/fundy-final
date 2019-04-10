package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;

public interface MemberService {

	int memberCount();
	int memberDeleteAll();
	int insertOne(Member m);
	Member login(Member m);
	int memberAddress(ShippingAddr s);
	List<ShippingAddr> memberAddressView(ShippingAddr s);
	List<Member> selectList();
	Member selectOneKakao(Member m);
	int memberAddressInsert(ShippingAddr s);
	int memberUpdate(Member m);
	List<Member> memberUpdateView(Member m);



}
