package com.kh.fundy.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.common.MailHandler;
import com.kh.fundy.common.TempKey;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.service.MemberService;

 @SessionAttributes(value= {"loggedMember", "authKey"})
 @Controller
 public class MemberController {
	 
	 @Autowired
	 private MemberService service;
	 
	 //인증키 비교 위한
	 private String authKey;

	 //log를 찍기위해 logger객체
	 private Logger logger=Logger.getLogger(MemberController.class);
	 
	 //암호화
	 @Autowired
	 private BCryptPasswordEncoder bcEncoder;
	 
	 //이메일인증
	 @Autowired
	 private JavaMailSender mailSender;

	 //로그인
	 @RequestMapping("/member/memberlogin.do")
	 public String memberLogin(Member m, Model model, HttpSession session) {
		 Member result=service.selectOne(m);
		 
		 if(result!=null){
			 if(bcEncoder.matches(m.getMemberPw(), result.getMemberPw())) {
				 model.addAttribute("msg", "로그인 되었습니다.");
				 model.addAttribute("loggedMember", result);
			 }
			 else {model.addAttribute("msg", "패스워드가 일치하지 않습니다.");}
		 }
		 else {model.addAttribute("msg", "아이디가 일치하지 않습니다.");}
		 
		 model.addAttribute("loc", "/");
		 return "common/msg";
	 }

	 //카카오 로그인 후처리
	 @RequestMapping("/member/kakaoLogin.do")
	 public ModelAndView isKakao(Member m, Model model, HttpSession session) {
		 Member result = service.selectOne(m);

		 ModelAndView mv=new ModelAndView();
		 if(result!=null) {
			 mv.addObject("loggedMember", result);
			 mv.addObject("result", true);
		 }
		 else {
			 String timeString = new SimpleDateFormat("yyyyMMddsss").format(new Date()); //중복방지
			 m.setMemberNick(m.getMemberNick()+timeString);
			 m.setEnrollDate(new Timestamp(System.currentTimeMillis()));
			 
			 int re=service.insertOne(m);
			 if(re>0) {
				model.addAttribute("loggedMember", result);
			 	mv.addObject("result", true);
			 } else {mv.addObject("result", false);}
		 }
		 
		 mv.setViewName("jsonView");
		 return mv;
	 }

	 //로그아웃
	 @RequestMapping("/member/LogOut.do")
	 public String logOut(SessionStatus ss, HttpSession s) {
		 s.invalidate();
		 if(!ss.isComplete()) {
			ss.setComplete();
		}
		return "redirect:/";
	}

	 //회원가입
	 @RequestMapping("/member/memberEnrollEnd.do")
	 public String memberEnrollEnd(Member m, Model model) {
		 m.setEnrollDate(new Timestamp(System.currentTimeMillis()));
		 m.setMemberPw(bcEncoder.encode(m.getMemberPw()));
		 int result = service.insertOne(m);
 		 
		 if(result > 0) { model.addAttribute("msg", "회원가입 완료");}
		 else { model.addAttribute("msg", "회원가입 실패");}
		 return "common/msg";
	 }

	 //메일 인증
	 @RequestMapping("/member/emailAuth.do") @ResponseBody 
	 public boolean emailAuth(String memberEmail, Model model) {
		 String key = new TempKey().getKey(20, false);

		 try {
			 MailHandler sendMail = new MailHandler(mailSender);
			 sendMail.setSubject("FUNDY 회원가입 이메일 인증");
			 sendMail.setText(new StringBuffer()
					 .append("<h1>이메일 인증</h1>"+key+"<br>")
					 .append("<a href='http://localhost:9090/fundy/")
					 .append(" '\n\n target='_blank'>Fundy 사이트로 이동하기</a>")
					 .toString());
			 sendMail.setFrom("jwj3955a@naver.com", "Fundy");       
			 sendMail.setTo(memberEmail);
			 sendMail.send();
			 
			 authKey = key;			 
			 return true;
		 } catch(MessagingException | UnsupportedEncodingException e) {
			 e.printStackTrace();
			 return false;
		 }
	 }
	 
	 //인증키 확인
	 @RequestMapping("/member/authKey.do") @ResponseBody
	 public boolean AuthKey(String authKeyCk) throws IOException {
		 return (authKey.equals(authKeyCk))?true:false;
	 }
	 
	 //닉네임 중복체크
	 @RequestMapping("/member/checkMemberNick.do")
	 public ModelAndView checkNickname(Member m) {
		 ModelAndView mv = new ModelAndView();
		 Member result = service.selectCheckNick(m);
		 mv.addObject("result", (result != null) ? false : true);
		 mv.setViewName("jsonView");
		 return mv;
	 }
	 
 }
