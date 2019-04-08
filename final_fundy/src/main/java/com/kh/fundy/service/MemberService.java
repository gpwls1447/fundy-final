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
	
}
