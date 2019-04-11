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
	
	@RequestMapping("/comment/insertComment.do")
	public ModelAndView insertComment(Comment c)
	{
		ModelAndView mv = new ModelAndView();
		c.setCommentDate(new Timestamp(System.currentTimeMillis()));
		service.insertComment(c);
		mv.setViewName("projectList/commentForm");
		mv.addObject("comment", c);
		return mv;
	}
	
	@RequestMapping("/comment/insertCommentReply.do")
	public ModelAndView insertCommentReply(CommentReply cr)
	{
		ModelAndView mv = new ModelAndView();
		cr.setCommentReplyDate(new Timestamp(System.currentTimeMillis()));
		service.insertCommentReply(cr);
		mv.addObject("commentReply", cr);
		mv.setViewName("projectList/replyForm");
		return mv;
	}
	
	@RequestMapping("/comment/commentUpdate.do")
	public ModelAndView updateComment(Comment c, int commentNo)
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
		int result;
		ModelAndView mv = new ModelAndView();
		c.setCommentDelete(new Timestamp(System.currentTimeMillis()));	
		result = service.deleteComment(c);
		mv.addObject("result", result);
		mv.setViewName("jasonView");
		return mv;
	}
	
	@RequestMapping("/comment/commentReplyUpdate.do")
	public ModelAndView updateCommentReply(CommentReply cr)
	{
		ModelAndView mv = new ModelAndView();
		cr.setCommentReplyMod(new Timestamp(System.currentTimeMillis()));
		System.out.println(cr.getCommentReplyNo());
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
