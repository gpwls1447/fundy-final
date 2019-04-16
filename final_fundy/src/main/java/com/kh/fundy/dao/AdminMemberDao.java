package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.Member;

public interface AdminMemberDao {

	List<Member> memberListView(Member m);

}
