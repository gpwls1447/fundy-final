package com.kh.fundy.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.common.PageBarFactory;
import com.kh.fundy.model.vo.Attachment;
import com.kh.fundy.model.vo.Notice;
import com.kh.fundy.service.NoticeService;

import static com.kh.fundy.common.RenameTemplate.renameFile;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	/*공지사항 리스트*/
	@RequestMapping("/noticeMain.do")
	public ModelAndView noticeMain(@RequestParam(value="cPage",required=false, defaultValue="1")int cPage)
	{
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		
		List<Notice> list=service.selectList(cPage,numPerPage);
		int totalList=service.selectCount();
		
		mv.addObject("list",list);
		mv.addObject("totalList",totalList);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalList,cPage,numPerPage,"/fundy/noticeMain.do"));
		mv.setViewName("notice/noticeMain");
		
		return mv;
	}
	
	/*공지사항 작성화면 넘기기*/
	@RequestMapping("/noticeForm.do")
	public String noticeForm()
	{
		return "notice/noticeForm";
	}
	
	/*공지사항 작성*/
	@RequestMapping("/noticeFormEnd.do")
	   public ModelAndView insertBoard(Notice notice, MultipartFile[] upFile,HttpServletRequest re)
	   {
			notice.setNoticeDate(new Timestamp(System.currentTimeMillis()));
			ModelAndView mv=new ModelAndView();

			String saveDir=re.getSession().getServletContext().getRealPath("/resources/upload");
	      
			File dir=new File(saveDir);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			List<Attachment> list=new ArrayList<>();
			if(upFile!=null) {
				for(MultipartFile f : upFile)
				{
			        if(!f.isEmpty())
			        {
			        	String renamedFileName = renameFile(f.getOriginalFilename());
			            try {
			               f.transferTo(new File(saveDir + "/" + renamedFileName));
			            }
			            catch(IOException e)
			            {
			               e.printStackTrace();
			            }
			            Attachment a=new Attachment();
			            a.setOriginalFileName(f.getOriginalFilename());
			            a.setRenamedFileName(renamedFileName);
			            list.add(a);
			        }
		      }
	      }
	      int result=service.insertNotice(notice,list);
	      
	      if(result > 0) {
		      mv.addObject("msg", "작성 완료되었습니다.");
		      mv.addObject("loc", "/noticeMain.do");
	      } else {
		      mv.addObject("msg", "작성중 오류가 발생하였습니다..");
		      mv.addObject("loc", "/noticeForm.do");
	      }
	      mv.setViewName("common/msg");
	      return mv;
	   }
	
	
	//공지사항상세보기
	@RequestMapping("/noticeView.do")
	public ModelAndView noticeView(int noticeNo) {
		ModelAndView mv=new ModelAndView();
		Notice nt=service.noticeView(noticeNo);
		mv.addObject("nt",nt);
		mv.setViewName("notice/noticeView");
		return mv;
		
	}
	
	/*공지사항 삭제*/
	@RequestMapping("/noticeDelete.do")
	public ModelAndView noticeDelete(Notice notice) throws Exception
	{
		notice.setNoticeDelete(new Timestamp(System.currentTimeMillis()));
		 ModelAndView mv=new ModelAndView();
		int result=service.noticeDelete(notice);
		if(result>0)
		{
			String msg="삭제 완료 하였습니다.";
			String loc="/noticeMain.do";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
			
		}
		else
		{
			String msg="삭제 실패 하였습니다.";
			String loc="/noticeMain.do";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
			
		}
		
		return mv;
	}
	
	/*공지사항 수정 화면으로 전환*/
	@RequestMapping("/noticeUpdate.do")
	public ModelAndView noticeUpdate(int noticeNo)
	{
		
		ModelAndView mv=new ModelAndView();
		Notice nt=service.noticeView(noticeNo);
		mv.addObject("nt",nt);
		mv.setViewName("notice/noticeUpdate");
		return mv;
		
	}
	
	/*1대1게시판 수정*/
	@RequestMapping("/noticeUpdateEnd.do")
	public ModelAndView askBoardUpdateEnd(Notice notice,int noticeNo)
	{
		notice.setNoticeEdit(new Timestamp(System.currentTimeMillis()));
		ModelAndView mv=new ModelAndView();
		int result=service.noticeUpdate(notice);
		if(result>0)
		{
			Notice nt=service.noticeView(noticeNo);
			String msg="수정 성공하였습니다";
			String loc="/noticeView.do?noticeNo="+noticeNo;
			mv.addObject("nt",nt);
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		else
		{
			Notice nt=service.noticeView(noticeNo);
			String msg="수정 실패하였습니다.";
			String loc="/noticeView.do?noticeNo="+noticeNo;
			mv.addObject("nt",nt);
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");
		}
		return mv;
		
	
	}
	
	
}
