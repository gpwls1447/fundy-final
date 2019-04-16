package com.kh.fundy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Member;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Member> memberListView(Member m) {
		return session.selectList("adminMember.selectList", m);
	}
	
	

}
