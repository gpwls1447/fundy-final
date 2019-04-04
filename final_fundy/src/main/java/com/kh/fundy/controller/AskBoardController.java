package com.kh.fundy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.fundy.service.AskBoardService;



@Controller
public class AskBoardController {

	@Autowired
	private AskBoardService service;
	
	@RequestMapping("/askBoardForm.do")
	public String askBoardForm() {
		
		return "askBoard/aksBoardForm";
	}
	
	@RequestMapping("/askBoardMain.do")
	public String askBoardMain()
	{
		return "/askBoard/askBoardMain";
	}
}
