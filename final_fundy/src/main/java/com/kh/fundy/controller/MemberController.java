package com.kh.fundy.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;
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
	 
	 //배송지 정보 뷰화면
	 @RequestMapping("/member/memberAddressView.do")
	 public ModelAndView memberAddressView(ShippingAddr s, Model model) {
		ModelAndView mv = new ModelAndView();
		List<ShippingAddr> list = service.memberAddressView(s);
		mv.setViewName("memberUpdate/memberUpdate-address");
		mv.addObject("list", list);
		return mv;
	 }
	 
	 //배송지 정보 수정하기
	 @RequestMapping("/member/memberAddress.do")
	 public String memberAddress(ShippingAddr s, Model model) {
			/*String shipAddrTag = s.getShipAddrTag();
			String shipAddrReceiver = s.getShipAddrReceiver();
			int zipCode = s.getZipCode();
			String shipAddr = s.getShipAddr();
			String shipAddrDatail = s.getShipAddrDetail();
			String phone = s.getPhone();*/
		int result = service.memberAddress(s);
			
		String msg = "";
		String loc = "";
			
		if(result>0) {
			msg="배송지 정보 수정 완료!";
			loc="/member/memberAddressView.do"; //서블릿으로 보내야함
		} else {
			msg="배송지 정보 수정 오류입니다.";
			loc="/member/memberAddressView.do";
		}
			
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	 
	//기본 배송지 없을때 추가하기
	 @RequestMapping("/member/memberAddressInsert.do")
	 public String memberAddressInsert(ShippingAddr s, String memberEmail, Model model, String phone1, String phone2, String phone3) {
		 String phone = phone1+phone2+phone3;
		 s.setPhone(phone);
		 
		 System.out.println("sdfsfsafsadf"+s);
		 int result = service.memberAddressInsert(s);
		 
		 String msg="";
		 String loc="";
		 System.out.println("배송지 추가하기 : "+result);
		 
		 if(result>0) {
			 msg="배송지 정보가  추가되었습니다.";
			 loc="/member/memberAddressView.do";
		 } else {
			 msg="배송지 정보가  추가 오류입니다.";
			 loc="/member/memberAddressView.do";
			 System.out.println("배송지 추가하기 : "+result);
		 }
		 
		 model.addAttribute("msg", msg);
		 model.addAttribute("loc", loc);
		 return "common/msg";
	 }
	 
	 //기본 정보 변경 뷰
	 @RequestMapping("/member/memberUpdateView.do")
	 public String memberUpdateView(Member m, Model model) {
		 
		 return "memberUpdate/memberUpdate-basicUpdate";
	 }
	 
	 
	 //기본정보 변경 업데이트
	 @RequestMapping("/member/memberUpdate.do")
	 public String memberUpdate(Member m, Model model) {
		 int result = service.memberUpdate(m);
		 
		 String loc="";
		 String msg="";
		 
		 if(result>0) {
			 msg="회원수정이 완료되었습니다.";
			 loc="/member/memberUpdateView.do";
		 } else {
			 msg="오류발생. 다시 시도해주세요.";
			 loc="/member/memberUpdateView.do";
		 }
		 
		 model.addAttribute("msg", msg);
		 model.addAttribute("loc", loc);
		 model.addAttribute("loggedMember", m);
		 return "common/msg";
	 }
	 
	 //비밀번호 변경 view
	 @RequestMapping("member/memberPwView.do")
	 public String memberPwView(Member m, Model model) {
		 return "memberUpdate/memberUpdate-pw";
	 }
	 
	 /*//비밀번호 변경 update
	 @RequestMapping("member/memberPw.do")
	 public String memberPw(Member m, Model model, String beforePw) {
		 String beforePw2 = m.getMemberPw();
		 
		 String msg="";
		 String loc="";
		 if(beforePw!=beforePw2) {
			 
		 }
		 
		 
	 }*/
 }
