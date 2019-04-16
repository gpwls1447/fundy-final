package com.kh.fundy.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.common.DescDate;
import com.kh.fundy.model.vo.Message;
import com.kh.fundy.service.MessageService;

@Controller
public class MessagController {

	@Autowired
	private MessageService service;
	
	//메세지 리스트로 보내기
	@RequestMapping("/messageMain.do")
	public ModelAndView messageMain(String receiverEmail )
	{
		System.out.println(receiverEmail);
		ModelAndView mv=new ModelAndView();
		List<Message> list=service.messageList(receiverEmail);
		/*List<Message> senderList=service.msgMemberList();*/

		System.out.println(list);
		mv.addObject("list",list);
		mv.addObject("receiverEmail",receiverEmail);
		mv.setViewName("/message/messageMain");
		return mv;
	}
	
	//메세지 상세보기
	@RequestMapping("/messageView.do")
	public ModelAndView messageView(String senderEmail,String receiverEmail,Message ms)
	{
		
		ModelAndView mv=new ModelAndView();
		ms.setReceiverEmail(receiverEmail);
		ms.setSenderEmail(senderEmail);
		List<Message> reList=service.reMessageList(ms);
		List<Message> seList=service.seMessageList(ms);
/*		System.out.println(reList);
		System.out.println(seList);*/
	
		List<Message> allList=new ArrayList<Message>();
		allList.addAll(seList);
		allList.addAll(reList);
		
		Collections.sort(allList,new DescDate());
		System.out.println(allList);
		
		mv.addObject("projectNo", ms.getProjectNo());
		mv.addObject("senderEmail",senderEmail);
		mv.addObject("receiverEmail",receiverEmail);
		mv.addObject("allList",allList);
		mv.addObject("reList",reList);
		mv.addObject("seList",seList);
		mv.setViewName("/message/messageView");
		return mv;
	}
	
	//메세지 작성하기
	@RequestMapping("/insertMsg.do")
	public ModelAndView insertMsg(String senderEmail,String receiverEmail,Message ms,int projectNo)
	{
		ModelAndView mv=new ModelAndView();
		ms.setMessageDate(new Timestamp(System.currentTimeMillis()));
		ms.setSenderEmail(senderEmail);
		ms.setReceiverEmail(receiverEmail);
		ms.setProjectNo(projectNo);
		int result=service.insertMsg(ms);
		if(result>0)
		{
			List<Message> reList=service.reMessageList(ms);
			List<Message> seList=service.seMessageList(ms);
			List<Message> allList=new ArrayList<Message>();
			allList.addAll(seList);
			allList.addAll(reList);
			
			Collections.sort(allList,new DescDate());
			System.out.println(allList);
			
			mv.addObject("projectNo", projectNo);
			mv.addObject("senderEmail",senderEmail);
			mv.addObject("receiverEmail",receiverEmail);
			mv.addObject("allList",allList);
			mv.addObject("reList",reList);
			mv.addObject("seList",seList);
		}
		
		mv.setViewName("/message/messageView");
		return mv;
	}
	
	//관리자메세지 리스트로 보내기
	@RequestMapping("/adminMessage.do")
	public ModelAndView adminMessage()
	{
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("/message/adminMessage");
		return mv;
	}
	
	//내 프로젝트 메세지 리스트로 보내기
	@RequestMapping("/myProjectMessage.do")
	public ModelAndView myProjectMessage()
	{
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("/message/myProjectMessage");
		return mv;
	}
	

	
	//관리자 메세지 상세보기
		@RequestMapping("/adminMessageView.do")
		public ModelAndView adminMessageView()
		{
			ModelAndView mv=new ModelAndView();
			
			
			mv.setViewName("/message/adminMessageView");
			return mv;
		}
		
		//내 프로젝트 메세지 상세보기
		@RequestMapping("/myProjectMessageView.do")
		public ModelAndView myProjectMessageView()
		{
			ModelAndView mv=new ModelAndView();
			
			
			mv.setViewName("/message/myProjectMessageView");
			return mv;
		}
}
