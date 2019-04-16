package com.kh.fundy.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Member;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Member> memberListView(Map<String, String> map) {
		return session.selectList("adminMember.selectList", map);
	}
	
	

}
