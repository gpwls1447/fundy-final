package com.kh.fundy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.MemberDao;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Override
	public int memberCount() {
		return dao.memberCount();
	}

	@Override
	public Member login(Member m) {
		return dao.login(m);
	}

	@Override
	public int memberDeleteAll() {
		return dao.memberDeleteAll();
	}

	@Override
	public int insertOne(Member m) {
		return dao.insertOne(m);
	}

	@Override
	public int memberAddress(ShippingAddr s) {
		return dao.memberAddress(s);
	}

	@Override
	public List<ShippingAddr> memberAddressView(ShippingAddr s) {
		return dao.memberAddressView(s);
	}
	public List<Member> selectList() {
		return dao.selectList();
	}

	@Override
	public Member selectOneKakao(Member m) {
		return dao.selectOneKakao(m);
	}

	@Override
	public int memberAddressInsert(ShippingAddr s) {
		return dao.memberAddressInsert(s);
	}

	@Override
	public int memberUpdate(Member m) {
		return dao.memberUpdate(m);
	}

	@Override
	public List<Member> memberUpdateView(Member m) {
		return dao.memberUpdateView(m);
	}
	
	@Override
	public int memberPwUpdate(Member m) {
		return dao.memberPwUpdate(m);
	}

	@Override
	public int memberPwCheck(Member m) {
		return dao.memberPwCheck(m);
	}

	@Override
	public int memberNickCheck(String memberNick) {
		return dao.memberNickCheck(memberNick);
	}

	@Override
	public int memberDelete(Member m) {
		return dao.memberDelete(m);
	}
	
	
	
	
	

}
