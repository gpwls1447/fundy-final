package com.kh.fundy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.service.AdminMemberService;
import com.kh.fundy.service.MemberUpdateService;

@SessionAttributes(value= {"loggedMember"})	
@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService amService;
	
	@Autowired
	private MemberUpdateService mService;
	
	@RequestMapping("/admin/memberListView.do")
	public ModelAndView memberListView(String orderby) {
		System.out.println("orderby : "+orderby);
		ModelAndView mv = new ModelAndView();
		Map<String, String> map = new HashMap<>();
		map.put("orderby", orderby);
		
		List<Member> list = amService.memberListView(map);
		
		
		mv.addObject("list", list);
		mv.setViewName("admin/memberList");
		mv.addObject("map", map);
		return mv;
		
	}
}
