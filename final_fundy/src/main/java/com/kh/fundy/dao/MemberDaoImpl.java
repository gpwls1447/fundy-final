package com.kh.fundy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSessionTemplate session;

	@Override
	public int memberCount() {
		return session.selectOne("member.memberCount");
	}

	@Override
	public int memberDeleteAll() {
		return session.delete("member.memberDeleteAll");
	}

	@Override
	public int insertOne(Member m) {
		return session.insert("member.insertOne", m);
	}
	
	@Override
	public Member selectOne(Member m) {
		return session.selectOne("member.selectOne", m);
	}
	
	public List<Member> selectList() {
		return session.selectList("member.kakao");
	}

	@Override
	public String selectCountUserAuth(String memberEmail) {
		return session.selectOne("member.memberEmailCheck", memberEmail);
	}

	@Override
	public int insertUserAuth(String memberEmail, String key) {
		Map map=new HashMap();
		map.put("memberEmail", memberEmail);
		map.put("authKey", key);
		return session.insert("member.insertUserAuth", map);
	}

	@Override
	public int updateUserAuth(String memberEmail, String key) {
		Map map=new HashMap();
		map.put("memberEmail", memberEmail);
		map.put("authKey", key);
		return session.update("member.updateUserAuth", map);
	}

	@Override
	public Member selectCheckNick(Member m) {
		return session.selectOne("member.selectCheckNick", m);
	}
	
	

}
