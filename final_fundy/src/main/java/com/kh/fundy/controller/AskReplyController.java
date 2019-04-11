package com.kh.fundy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.AskBoard;
import com.kh.fundy.model.vo.AskReply;
import com.kh.fundy.service.AskBoardService;
import com.kh.fundy.service.AskReplyService;

@Controller
public class AskReplyController {

	@Autowired
	private AskReplyService service;
	@Autowired
	private AskBoardService service2;
	
	//댓글작성
	@RequestMapping("/insertRe.do")
	public ModelAndView insertReply(AskReply askReply,int askNo)
	{
		ModelAndView mv=new ModelAndView();
		int result=service.insertReply(askReply);
		System.out.println(askNo);
		String msg="";
		String loc="/askBoardView.do?askNo="+askNo;
		if(result>0)
		{
			AskBoard ab=service2.askBoardView(askNo);
			msg="댓글 작성을 완료 하였습니다.";
			
			mv.addObject("ab",ab);
			mv.setViewName("common/msg");
		}
		else
		{
			AskBoard ab=service2.askBoardView(askNo);
			msg="댓글 작성을 실패 하였습니다.";
			mv.addObject("ab",ab);
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	
}
