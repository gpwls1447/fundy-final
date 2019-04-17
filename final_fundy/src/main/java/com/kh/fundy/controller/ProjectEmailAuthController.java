package com.kh.fundy.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fundy.common.MailHandler;
import com.kh.fundy.common.TempKey;

@Controller
public class ProjectEmailAuthController {
	//이메일인증
	@Autowired
	private JavaMailSender mailSender;
	//인증키 비교 위한
	private String ckAuthKey;
	@Autowired
	private BCryptPasswordEncoder bcEncoder;
	
	private Map<String, Object> authMap = new HashMap<String, Object>();
	
	//메일 인증
	 @RequestMapping("/project/emailAuth.do")
	 @ResponseBody
	 public Map<String, Object> emailAuth(String projectEmail, Model model, HttpSession session, String projectNo) {
		 String key = new TempKey().getKey(20,false);
		 model.addAttribute("authKey", key);
		 String flag="";
		 flag="true";
		 
		 ckAuthKey=key;
		 String encrptedKey = bcEncoder.encode(ckAuthKey);
		 authMap.put(projectNo, encrptedKey);
		 
		 try {
			 MailHandler sendMail = new MailHandler(mailSender);
			 sendMail.setSubject("FUNDY  서비스 이메일 인증]");
			 sendMail.setText(new StringBuffer().append("<h1>메일인증</h1><br><br><br>인증값: "+key).toString());
			 sendMail.setFrom("fundy@gmail.com", "Fundy ");       
			 sendMail.setTo(projectEmail);
			 sendMail.send();
			 flag="true";
		 }
		 catch(MessagingException | UnsupportedEncodingException e) {
			 e.printStackTrace();
			 flag="false";
		 }
		 
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("flag",flag);
		 return map;
	 }
	 
	 //인증키 확인 ajax
	 @RequestMapping("/project/authKey.do")
	 public void AuthKey(String authKey, HttpServletResponse res, HttpSession session, String projectNo) throws IOException {
		 String sessionAuthKey = (String)authMap.get(projectNo);
		 boolean isOk = bcEncoder.matches(authKey, sessionAuthKey);
		 
		 res.getWriter().print(isOk);
	 }
}
