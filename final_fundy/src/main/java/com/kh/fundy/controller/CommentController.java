package com.kh.fundy.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Comment;
import com.kh.fundy.model.vo.CommentReply;
import com.kh.fundy.service.CommentService;

@Controller
public class CommentController {

	@Autowired
	private CommentService service;
	
	@RequestMapping("/comment/commentUpdate.do")
	public ModelAndView updateComment(Comment c)
	{
		ModelAndView mv = new ModelAndView();
		c.setCommentMod(new Timestamp(System.currentTimeMillis()));
		service.updateComment(c);
		mv.setViewName("jasonView");
		return mv;
	}
	
	@RequestMapping("/comment/commentDelete.do")
	public ModelAndView deleteComment(Comment c)
	{
		ModelAndView mv = new ModelAndView();
		c.setCommentDelete(new Timestamp(System.currentTimeMillis()));
		service.deleteComment(c);
		mv.setViewName("jasonView");
		return mv;
	}
	
	@RequestMapping("/comment/commentReplyUpdate.do")
	public ModelAndView updateCommentReply(CommentReply cr)
	{
		ModelAndView mv = new ModelAndView();
		cr.setCommentReplyMod(new Timestamp(System.currentTimeMillis()));
		service.updateCommentReply(cr);
		mv.setViewName("jasonView");
		return mv;
	}
	@RequestMapping("/comment/commentReplyDelete.do")
	public ModelAndView deleteCommentReply(CommentReply cr)
	{
		ModelAndView mv = new ModelAndView();
		cr.setCommentReplyDelete(new Timestamp(System.currentTimeMillis()));
		service.deleteCommentReply(cr);
		mv.setViewName("jasonView");
		return mv;
	}
}
