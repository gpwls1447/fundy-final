package com.kh.fundy.dao;

import java.util.List;
import java.util.Map;

import com.kh.fundy.model.vo.Member;

public interface AdminMemberDao {

	List<Member> memberListView(Map<String, String> map);

}
