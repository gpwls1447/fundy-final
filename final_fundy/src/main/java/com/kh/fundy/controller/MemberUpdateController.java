package com.kh.fundy.controller;

import static com.kh.fundy.common.RenameTemplate.renameFile;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.ShippingAddr;
import com.kh.fundy.service.MemberService;
import com.kh.fundy.service.MemberUpdateService;
import com.kh.fundy.service.ProjectListService;

@SessionAttributes(value= {"loggedMember"})

@Controller
public class MemberUpdateController {
	
	private Logger logger = LoggerFactory.getLogger(MemberUpdateController.class);
	
	@Autowired
	private MemberUpdateService service;
	@Autowired
	private MemberService mService;
	@Autowired
	private ProjectListService pService;
	@Autowired
	private BCryptPasswordEncoder bcEncoder;
	
	//배송지 정보 뷰화면
    @RequestMapping("/member/memberAddressView.do")
    public ModelAndView memberAddressView(HttpSession session) 
    {
    	ModelAndView mv = new ModelAndView();
    	List<ShippingAddr> list = service.selectAddrList(((Member)session.getAttribute("loggedMember")).getMemberEmail());
    	mv.addObject("list", list);
    	mv.setViewName("memberUpdate/memberUpdate-address");
    	return mv;
    }
    
    //배송지 정보 수정하기
    @RequestMapping("/memberUpdate/updateShipAddr.do")
    public String memberAddress(ShippingAddr sa, String phone1, String phone2, String phone3, Model model)
    {	
    	sa.setPhone(phone1 + phone2 + phone3);
    	int result = service.updateAddr(sa);
    	
    	String msg;
    	if(result > 0) {msg = "배송지 정보 수정 완료!";} 
    	else {msg = "배송지 정보 수정 오류입니다.";}
 
    	model.addAttribute("msg", msg);
    	model.addAttribute("loc", "/member/memberAddressView.do");
    	return "common/msg";
    }
    
    //배송지 정보 동적 조회
    @RequestMapping("/memberUpdate/selectShipAddr.ajax")
    public ModelAndView selectShipAddrAjax(ShippingAddr sa) 
    {
    	ModelAndView mv = new ModelAndView();
    	sa = service.selectAddr(sa);
    	
    	mv.addObject("addr", sa);
    	mv.setViewName("jsonView");
    	return mv;
    }
    
    //배송지 정보 삭제
	@RequestMapping("/memberUpdate/deleteShipAddr.ajax")
    public ModelAndView deleteShipAddrAjax(ShippingAddr sa)
    {
    	ModelAndView mv = new ModelAndView();
    	int result = service.deleteAddr(sa);
    	
    	mv.addObject("result", result);
    	mv.setViewName("jsonView");
    	return mv;
    }
    
   //배송지 추가
    @RequestMapping("/memberUpdate/insertShipAddr.do")
    public String memberAddressInsert(ShippingAddr sa, Model model, String phone1, String phone2, String phone3, HttpSession session) {
       sa.setPhone(phone1+phone2+phone3);
       
       int result = service.insertAddr(sa);
       
       String msg;
       if(result > 0) {msg="배송지 정보가  추가되었습니다.";} 
       else {msg="배송지 정보가  추가 오류입니다.";}
       
       model.addAttribute("msg", msg);
       model.addAttribute("loc", "/member/memberAddressView.do");
       return "common/msg";
    }
    
    //기본 정보 변경 뷰
    @RequestMapping("/member/memberUpdateView.do")
    public String memberUpdateView(Member m, Model model) {
       return "memberUpdate/memberUpdate-basicUpdate";
    }
        
    //기본 회원정보 변경 업데이트
    @RequestMapping("/memberUpdate/basicUpdate.do")
    public ModelAndView memberUpdate(Member m, MultipartHttpServletRequest mr, MultipartFile mf) throws IllegalStateException, IOException {
    	ModelAndView mv = new ModelAndView();
    	
    	String path = mr.getSession().getServletContext().getRealPath("/resources/memberProfile");
    	File dir = new File(path);
    	if(!dir.exists()){
    		dir.mkdirs();
    	}
    	
    	mf = mr.getFile("profileImage");
    	if(!mf.isEmpty())
    	{
    		String changedName = renameFile(mf.getOriginalFilename());
    		mf.transferTo(new File(dir + File.separator + changedName));
    		m.setMemberProfile(changedName);
    	}
    	
        String msg;
        String loc;
        int result = service.memberUpdate(m);
        if(result > 0) { 
        	msg="회원수정이 완료되었습니다."; 
        	loc="/member/memberUpdateView.do";
        } 
        else { 
        	msg="오류발생. 다시 시도해주세요."; 
        	loc="/member/memberUpdateView.do";
        }
       
        mv.addObject("msg", msg);
        mv.addObject("loc", "/member/memberUpdateView.do");
        mv.addObject("loggedMember", m);
        mv.setViewName("common/msg");
        return mv;
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
       Member result = mService.login(m);
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
       Member pwResult = mService.login(m); //비밀번호 일치 여부
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
