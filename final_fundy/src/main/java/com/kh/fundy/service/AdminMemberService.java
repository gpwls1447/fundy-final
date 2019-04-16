package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

import com.kh.fundy.model.vo.Member;

public interface AdminMemberService {

	List<Member> memberListView(Map<String, String> map);

}
