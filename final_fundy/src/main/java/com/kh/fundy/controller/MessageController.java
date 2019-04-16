package com.kh.fundy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController {

//	@Autowired
//	private MessageService service;
	
	@RequestMapping("/messsage/messageList.do")
	public ModelAndView messageListView( String memberEmail)
	{
		ModelAndView mv = new ModelAndView();
		return mv;
	}
}
