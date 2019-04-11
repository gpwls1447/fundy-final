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
	    public String memberUpdate(Member m, Model model, MultipartFile[] upFile, HttpServletRequest re) {
	       ModelAndView mv=new ModelAndView();
	       String saveDir=re.getSession().getServletContext().getRealPath("/resources/memberProfile");
	       
	       File dir=new File(saveDir);
	       if(!dir.exists()) {
	          dir.mkdirs();
	       }
	       
	       List<Member> list = new ArrayList<>();
	       
	       for(MultipartFile f : upFile)
	         {
	            if(!f.isEmpty())
	            {
	               String memberProfile=f.getOriginalFilename();
	               String ext=memberProfile.substring(memberProfile.indexOf("."));
	               
	               SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
	               int rndNum=(int)(Math.random()*10000);
	               
	               String renamedFile=sdf.format(new Date(System.currentTimeMillis()))
	                     +"_"+rndNum+ext;
	               try {
	                  f.transferTo(new File(saveDir+"/"+renamedFile));
	               }
	               catch(IOException e)
	               {
	                  e.printStackTrace();
	               }
	               Member mem=new Member();
	               mem.setMemberProfile(renamedFile);
	               list.add(mem);
	               //list.add(new Attachment(0,0,OriFileName,renamedFile,null,0,null));
	            }
	            
	         }
	       
	       int result = service.memberUpdate(m, list);
	       
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
	    
	    //비밀번호 변경 update
	    @RequestMapping("member/memberPw.do")
	    public String memberPw(Member m, Model model) {
	       
	       m.setMemberPw(bcEncoder.encode(m.getMemberPw()));
	       int result = service.memberPwUpdate(m);
	       String msg="";
	       String loc="";
	      
	       if(result>0) {
	          msg="비밀번호 변경이 완료되었습니다.";
	          loc="/";
	       } else {
	          msg="비밀번호 변경이 실패되었습니다. 다시 시도해주세요.";
	          loc="memberUpdate/memberUpdate-pw";
	       }
	       
	       model.addAttribute("msg", msg);
	       model.addAttribute("loc", loc);
	       
	       return "common/msg";
	    }
	    
	    //비밀번호 확인
	    @RequestMapping("/member/memberPwCheck.do")
	    public void memberPwCheck(Member m, Model model, String memberPw, HttpServletResponse res) throws IOException{
	       
	       ModelAndView mv = new ModelAndView();
	       System.out.println(m.getMemberEmail());
	       System.out.println(m.getMemberPw());
	       Member result = service.login(m);
	       result.getMemberPw();
	       
	       boolean isSame;
	       if(bcEncoder.matches(memberPw, result.getMemberPw())) {
	          isSame = true; //일치하면 true
	       }
	       else
	       {
	          isSame = false; //불일치해서 false
	       }
	       
	       mv.addObject("result", isSame);
	       mv.setViewName("jsonView");

	       res.getWriter().print(isSame);
	    }
	    
	    //닉네임 중복확인
	    @RequestMapping("/member/memberNickCheck.do")
	    public void memberNickCheck(Member m, Model model, String memberNick, HttpServletResponse res) throws IOException{
	       System.out.println("닉네임 들어왔나? : "+m.getMemberNick());
	       
	       int result = service.memberNickCheck(memberNick);
	       System.out.println("닉네임 int : "+result);
	       if(result>0) {
	          
	       } else {
	          
	       }
	       
	       res.getWriter().print(result);
	    }
	    
	    //회원탈퇴 view
	    @RequestMapping("/member/memberDeleteView.do")
	    public String memberDeleteView(Member m, Model model) {
	       return "memberUpdate/memberUpdate-memberDelete";
	    }
	    
	    
	    @RequestMapping("/member/memberDelete.do")
	    public String memberDelete(Member m, Model model, HttpSession session1, SessionStatus session, String memberPw, String memberEmail) {
	       
	       System.out.println("이메일 들어오나? : "+m.getMemberEmail());
	       String msg="";
	       String loc="";
	       int projectResult = pService.memberDelete(memberEmail); //프로젝트 진행 여부
	       
	       System.out.println("프로젝트 진행여부 : "+projectResult);
	       Member pwResult = service.login(m); //비밀번호 일치 여부
	       pwResult.getMemberPw();
	       
	       boolean isSame;
	       if(bcEncoder.matches(memberPw, pwResult.getMemberPw())) {
	          isSame = true; //일치하면 true
	          if(projectResult==0) {
	             int result = service.memberDelete(m);
	             msg="회원탈퇴가 완료되었습니다.";
	             
	             session1.invalidate(); //세션끊기
	             if(!session.isComplete()) {
	                session.setComplete();
	             }
	             loc="/";
	          } else {
	             msg="진행중인 프로젝트가 있습니다. 탈퇴가 불가능합니다.";
	             loc="/member/memberDeleteView.do";
	          }
	       }
	       else
	       {
	          isSame = false; //불일치하면 false
	          msg="비밀번호가 불일치합니다!!!!.";
	          loc="/member/memberDeleteView.do";
	       }
	       
	       model.addAttribute("msg", msg);
	       model.addAttribute("loc", loc);
	       
	       return "common/msg";
	    }


 }
