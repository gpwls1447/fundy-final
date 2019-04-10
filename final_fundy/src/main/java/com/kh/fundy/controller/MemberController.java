package com.kh.fundy.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/*import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
 */import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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
	 public ModelAndView isKakao(String id, String email, String profile, String nick, Model model, HttpSession session) {
		 Member m=new Member();
		 m.setKakaoId(id);
		 Member result = service.selectOneKakao(m);
		 Date d = new Date();
		 ModelAndView mv=new ModelAndView();
		 if(result!=null) {
			 mv.addObject("loggedMember", result);
		 }
		 else {
			 String msg="";
			 String loc="";
			 m.setKakaoId(id);
			 m.setMemberEmail(email);
			 m.setMemberProfile(profile);
			 //카카오 닉네임+날짜 넣어서 중복방지
			 SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddsss");
			 System.out.println(sdf.format(d));
			 sdf.format(d);
			 m.setMemberNick(nick+sdf.format(d));
			 m.setEnrollDate(new Timestamp(System.currentTimeMillis()));
			 int re=service.insertOne(m);
			 if(re>0) {
				 model.addAttribute("loggedMember", result);
			 }
		 }
		 if(id.length()>0) {
			 mv.addObject("val","y");
		 }
		 else {
			 mv.addObject("val","n");
		 }
		 mv.setViewName("jsonView");
		 return mv;
	 }

	 //로그아웃
	 @RequestMapping("/member/LogOut.do")
		public String logOut(SessionStatus session, HttpSession session1) {
			session1.invalidate();
			if(!session.isComplete()) {
				session.setComplete();
			}
			return "redirect:/";
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
