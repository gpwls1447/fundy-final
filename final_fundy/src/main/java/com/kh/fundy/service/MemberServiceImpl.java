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

	
	public List<Member> selectList() {
		return dao.selectList();
	}

	@Override
	public Member selectOneKakao(Member m) {
		return dao.selectOneKakao(m);
	}
	

	@Override
	public String selectCountUserAuth(String memberEmail) {
		return dao.selectCountUserAuth(memberEmail);
	}

	@Override
	public int insertUserAuth(String memberEmail, String key) {
		return dao.insertUserAuth(memberEmail, key);
	}

	@Override
	public int updateUserAuth(String memberEmail, String key) {
		return dao.updateUserAuth(memberEmail, key);
	}

	@Override
	public Member selectCheckNick(Member m) {
		return dao.selectCheckNick(m);
	}
	
	

}
