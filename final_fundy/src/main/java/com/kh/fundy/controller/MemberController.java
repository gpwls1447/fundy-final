package com.kh.fundy.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/*import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
 */import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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

	 // 카카오 로그인 후, 우리 사이트 가입 여부 후 분기처리 (Ajax로 리턴)
	 @RequestMapping("/member/isKakao.do")
	 @ResponseBody
	 public Map isKakao(Member m, Model model, HttpSession session) {
		 System.out.println("들어왔따~~");
		 System.out.println(m.getKakaoId());
		 String msg="";
		 String loc="";
		 Map map=new HashMap();
		 
		 if(m.getKakaoId()!=null) {
			 msg="로그인 성공";
			 Member result=service.login(m);
			 model.addAttribute("loggedMember", result);
			 map.put("val", "y");
		 }
		 else {
			 map.put("val", "n");
			 
		 }
		 return map;
		 
	 }

	 //카카오 로그인이 성공적이고, 우리사이트 회원이 아닐 때, 회원가입 페이지 이동
	 @RequestMapping("/member/memberEnrollKakao.do")
	 public String memberEnroll(Member m, Model model) {
		 model.addAttribute("Member", m);
		 return "member/memberEnrollForm";
	 }

	 // 카카오 로그인이 성공적이고, 우리사이트 회원일 때 로그인처리 세션부여 (로그인처리)
	 @RequestMapping("/member/memberLoginKakao.do")
	 public String memberLoginKakao(Member m, HttpSession session, Model model) {
		 Member result = service.selectOneKakao(m);

		 String msg = "";
		 String loc = "/";

		 if(result!=null) {
			 msg = "카카오 로그인 성공";
			 session.setAttribute("loginMember", result);
		 } else {
			 msg = "카카오 로그인 실패!";
		 }

		 model.addAttribute("msg", msg);
		 model.addAttribute("loc", loc);
		 return "common/msg";
	 }


	 //회원가입
	 @RequestMapping("/member/memberEnrollEnd.do")
	 public String memberEnrollEnd(Member m, Model model) {
		 //현재시간으로 타임스탬프 
		 m.setEnrollDate(new Timestamp(System.currentTimeMillis()));
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
