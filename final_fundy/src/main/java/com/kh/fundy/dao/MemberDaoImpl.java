package com.kh.fundy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Member;

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
	
}
