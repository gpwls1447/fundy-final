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
	
	/*1대1게시판 작성화면 넘기기*/
	@RequestMapping("/askBoardForm.do")
	public String askBoardForm() {
		
		return "askBoard/askBoardForm";
	}
	
	/*1대1게시판 리스트*/
	@RequestMapping("/askBoardMain.do")
	public ModelAndView askBoardMain(@RequestParam(value="cPage",required=false, defaultValue="1")int cPage)
	{
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		
		List<AskBoard> list=service.selectList(cPage,numPerPage);
		System.out.println(list);
		int totalList=service.selectCount();
		
		mv.addObject("list",list);
		mv.addObject("totalList",totalList);
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalList,cPage,numPerPage,"/spring/askBoard/askBoardMain"));
		mv.setViewName("askBoard/askBoardMain");
		
		System.out.println(list);
		return mv;
	}
}
