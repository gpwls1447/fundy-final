package com.kh.fundy.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/*import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
 */import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.common.MailHandler;
import com.kh.fundy.common.TempKey;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;
import com.kh.fundy.service.MemberService;
import com.kh.fundy.service.ProjectListService;

 @SessionAttributes(value= {"loggedMember"})
 @Controller
 public class MemberController {

	 //log를 찍기위해 logger객체
	 private Logger logger=Logger.getLogger(MemberController.class);


	 @Autowired
	 private MemberService service;
	 
	 @Autowired
	 private ProjectListService pService;

	 //암호화
	 @Autowired
	 private BCryptPasswordEncoder bcEncoder;
	 
	 //이메일인증
	 @Autowired
	 private JavaMailSender mailSender;

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

	 //메일 인증
	 @RequestMapping("/member/emailAuth.do")
	 public void emailAuth(String memberEmail) {
		 String key = new TempKey().getKey(20,false);

		 //메일 전송
		 try {
			 MailHandler sendMail = new MailHandler(mailSender);
			 sendMail.setSubject("FUNDY  서비스 이메일 인증]");
			 sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>"+key).append("<a href='http://localhost:9090/fundy/").append(" ' target='_blank'>Fundy 사이트로 이동하기</a>").toString());
			 sendMail.setFrom("fundy@gmail.com", "Fundy ");       
			 sendMail.setTo(memberEmail);
			 sendMail.send();
			 String result=service.selectCountUserAuth(memberEmail);
			 logger.debug("smtp : "+result);
			 if(result==null) {
	                service.insertUserAuth(memberEmail,key); //인증키 db 저장
	             }
	             else {
	                service.updateUserAuth(memberEmail,key);
	             }
		 }
		 catch(MessagingException | UnsupportedEncodingException e) {
			 e.printStackTrace();
		 }
		 return ;
	 }

 }
