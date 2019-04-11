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
	public Member login(Member m) {
		return session.selectOne("member.login", m);
	}

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
	public int memberAddress(ShippingAddr s) {
		return session.update("shippingAddr.updateAddress", s);
	}

	@Override
	public List<ShippingAddr> memberAddressView(ShippingAddr s) {
		return session.selectList("shippingAddr.updateAddressView", s);
	}

	public List<Member> selectList() {
		return session.selectList("member.kakao");
	}

	@Override
	public Member selectOneKakao(Member m) {
		return session.selectOne("member.selectOne", m);
	}

	@Override
	public int memberAddressInsert(ShippingAddr s) {
		return session.insert("shippingAddr.insertMemberAddress", s);
	}

	@Override
	public int memberUpdate(Member m) {
		return session.update("member.memberUpdate", m);
	}

	@Override
	public List<Member> memberUpdateView(Member m) {
		return session.selectList("member.memberUpdateView", m);
	}

	@Override
<<<<<<< HEAD
	public int memberPwUpdate(Member m) {
		return session.update("member.memberPwUpdate", m);
	}

	@Override
	public int memberPwCheck(Member m) {
		return session.selectOne("member.memberPwCheck", m);
	}

	@Override
	public int memberNickCheck(String memberNick) {
		return session.selectOne("member.memberNickCheck", memberNick);
	}

	@Override
	public int memberDelete(Member m) {
		return session.update("member.memberDelete", m);
	}
	
	
=======
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

>>>>>>> refs/heads/feature_kyo

}
