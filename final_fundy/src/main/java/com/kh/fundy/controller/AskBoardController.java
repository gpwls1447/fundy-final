package com.kh.fundy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.common.PageBarFactory;
import com.kh.fundy.model.vo.AskBoard;
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
	public ModelAndView askBoardMain(@RequestParam(value="cPage",required=false, defaultValue="1")int cPage)
	{
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		
		List<AskBoard> list=service.selectList(cPage,numPerPage);
		int totalList=service.selectCount();
		
		mv.addObject("list",list);
		mv.addObject("totalList",totalList);
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalList,cPage,numPerPage,"/spring/askBoard/askBoardMain"));
		mv.setViewName("askBoard/askBoardMain");
		
		
		return mv;
	}
}
