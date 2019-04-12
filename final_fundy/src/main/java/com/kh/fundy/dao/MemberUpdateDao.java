package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;

public interface MemberUpdateDao {

	int memberAddress(ShippingAddr s);
	List<ShippingAddr> selectAddrList(String memberEmail);
	int memberAddressInsert(ShippingAddr s);
	int memberUpdate(Member m);
	List<Member> memberUpdateView(Member m);
	int memberPwUpdate(Member m);
	int memberPwCheck(Member m);
	int memberNickCheck(String memberNick);
	int memberDelete(Member m);
	
}
