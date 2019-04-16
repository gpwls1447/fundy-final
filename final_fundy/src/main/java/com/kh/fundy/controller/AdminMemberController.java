package com.kh.fundy.controller;

import java.util.List;

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
	public ModelAndView memberListView(Member m) {
		
		ModelAndView mv = new ModelAndView();
		List<Member> list = amService.memberListView(m);
		
		mv.addObject("list", list);
		mv.setViewName("admin/memberList");
		return mv;
		
	}
}
