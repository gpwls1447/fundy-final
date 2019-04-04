package com.kh.fundy.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/*import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
*/import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.service.MemberService;

@SessionAttributes(value= {"loggedMember"})
@Controller
public class MemberController {

	//log를 찍기위해 logger객체
	private Logger logger=Logger.getLogger(MemberController.class);
	
	
	@Autowired
	private MemberService service;
	
	//암호화
	@Autowired
	private BCryptPasswordEncoder bcEncoder;
	
	//로그인
	@RequestMapping("/member/memberlogin.do")
	public String memberLogin(Member m, Model model, HttpSession session) {
		
		Member result=service.login(m);
		String msg="";
		String loc="";
		
		System.out.println("로그인 : "+result);
		
		try {
			throw new RuntimeException("경고!");
		}
		catch(RuntimeException e) {
		}

		if(result!=null) {
			if(bcEncoder.matches(m.getMemberPw(), result.getMemberPw())) {
				msg="로그인 성공";
				model.addAttribute("loggedMember", result);
			}
			else {
				msg="password 불일치";
			}
		}
		else {
			msg="ID 존재 X";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
		

	
	
	//회원가입
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m, Model model) {
		//현재시간으로 타임스탬프 
		m.setEnrollData(new Timestamp(System.currentTimeMillis()));
		//암호화
		m.setMemberPw(bcEncoder.encode(m.getMemberPw()));
		int result=service.insertOne(m);
		String msg="";
		if(result>0) {
			msg="회원가입 완료";
		}
		else {
			msg="회원가입 실패";
		}
		model.addAttribute("msg",msg);
		return "common/msg";
	}
	
	
}
