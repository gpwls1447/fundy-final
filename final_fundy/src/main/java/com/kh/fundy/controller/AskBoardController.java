package com.kh.fundy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	
	/*1대1게시판 작성 입력*/
	@RequestMapping("/askBoardFormEnd.do")
	public ModelAndView askBoardFormEnd(AskBoard askBoard){
		
		 ModelAndView mv=new ModelAndView();
		int result=service.insertAskBoard(askBoard);
		/*if(result>0)
		{
			확인 완료시 메세지창 띄우려함
		}*/
		mv.setViewName("askBoard/askBoardMain");
		
		return mv;
		//로그인 아이디 값을 고정값으로 되는지 확인됨
	}
	
	/*1대1게시판 삭제*/
	@RequestMapping("/askBoardDelete.do")
	public String askBoardDelete(int askNo) throws Exception
	{
		int result=service.askBoardDelete(askNo);
		
		return "/askBoard/askBoardMain";
	}
	
	/*1대1게시판 수정 화면으로 전환*/
	@RequestMapping("/askBoardUpdate.do")
	public ModelAndView askBoardUpdate(int askNo)
	{
		System.out.println(askNo);
		ModelAndView mv=new ModelAndView();
		AskBoard ab=service.askBoardView(askNo);
		mv.addObject("ab",ab);
		mv.setViewName("askBoard/askBoardUpdate");
		return mv;
		
	}
	
	/*1대1게시판 수정*/
	@RequestMapping("/askBoardUpdateEnd.do")
	public ModelAndView askBoardUpdateEnd(AskBoard askBoard)
	{
		
		ModelAndView mv=new ModelAndView();
		int result=service.askBoardUpdate(askBoard);
		
		mv.setViewName("/askBoard/askBoardMain");
		return mv;
		
	
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
	
	/*1대1게시판 상세보기페이지로 전환*/
	@RequestMapping("/askBoardView.do")
	public ModelAndView askBoardView(int askNo)
	{
		
		ModelAndView mv=new ModelAndView();
		AskBoard ab=service.askBoardView(askNo);
		mv.addObject("ab",ab);
		mv.setViewName("askBoard/askBoardView");
		return mv;
	}
	
	
}
