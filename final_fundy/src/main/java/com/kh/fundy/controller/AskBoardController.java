package com.kh.fundy.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.common.PageBarFactory;
import com.kh.fundy.model.vo.AskBoard;
import com.kh.fundy.model.vo.AskReply;
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
		
		askBoard.setAskDate(new Timestamp(System.currentTimeMillis()));
		 ModelAndView mv=new ModelAndView();
		int result=service.insertAskBoard(askBoard);
		if(result>0)
		{
			String msg="작성을 완료 하였습니다.";
			String loc="/askBoardMain.do";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
			
		}
		else
		{
			String msg="작성을 실패 하였습니다.";
			String loc="/askBoardMain.do";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		/*mv.setViewName("askBoard/askBoardMain");*/
		
		return mv;
		//로그인 아이디 값을 고정값으로 되는지 확인됨
	}
	
	/*1대1게시판 삭제*/
	@RequestMapping("/askBoardDelete.do")
	public ModelAndView askBoardDelete(AskBoard ab,int askNo) throws Exception
	{
		ab.setAskNo(askNo);
		ab.setAskDelete(new Timestamp(System.currentTimeMillis()));
		 ModelAndView mv=new ModelAndView();
		int result=service.askBoardDelete(ab);
		if(result>0)
		{
			String msg="삭제 완료 하였습니다.";
			String loc="/askBoardMain.do";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
			
		}
		else
		{
			String msg="삭제 실패 하였습니다.";
			String loc="/askBoardMain.do";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
			
		}
		
		return mv;
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
	public ModelAndView askBoardUpdateEnd(AskBoard askBoard,int askNo)
	{
		askBoard.setAskMod(new Timestamp(System.currentTimeMillis()));
		ModelAndView mv=new ModelAndView();
		int result=service.askBoardUpdate(askBoard);
		String msg;
		if(result > 0)
		{
			msg="수정 성공하였습니다";
			mv.setViewName("common/msg");
		}
		else
		{
			msg="수정 실패하였습니다.";
			mv.setViewName("common/msg");
		}

		mv.addObject("msg", msg);
		mv.addObject("loc","/askBoardView.do?askNo="+askNo);
		return mv;
	}
	

	/*1대1게시판 리스트*/
	@RequestMapping("/askBoardMain.do")
	public String askBoardMain(@RequestParam(value="cPage",required=false, defaultValue="1")int cPage,Model model)
	{
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		
		/*List<AskBoard> list=service.selectList(cPage,numPerPage);*/
		List<Map<String,String>> list=service.selectList(cPage,numPerPage);
		int totalList=service.selectCount();
		List<AskReply> replyList=service.askReplyList();
		
		/*mv.addObject("replyList",replyList);
		mv.addObject("list",list);
		mv.addObject("totalList",totalList);
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalList,cPage,numPerPage,"/fundy/askBoardMain.do"));
		mv.setViewName("askBoard/askBoardMain");*/
		model.addAttribute("list",list);
		model.addAttribute("totalList",totalList);
		model.addAttribute("pageBar",PageBarFactory.getPageBar(totalList,cPage,numPerPage,"/fundy/askBoardMain.do"));
		/*return mv;*/
		return "askBoard/askBoardMain";
	}
	
	/*1대1게시판 상세보기페이지로 전환//댓글 보이기도 추가로 작성*/
	@RequestMapping("/askBoardView.do")
	public ModelAndView askBoardView(int askNo)
	{
		ModelAndView mv=new ModelAndView();
		//댓글보이기
		List<AskReply> list=service.replyView(askNo);
		mv.addObject("list",list);
		
		//게시판 상세보기
		AskBoard ab=service.askBoardView(askNo);
		mv.addObject("ab",ab);
		mv.setViewName("askBoard/askBoardView");
		return mv;
	}
	

}
