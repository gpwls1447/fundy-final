package com.kh.fundy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Project;
import com.kh.fundy.service.ProjectListService;

@Controller
public class PayController {

	@Autowired
	private ProjectListService pService;
	
	@RequestMapping("/pay/optionSelect.do")
	public ModelAndView optionSelect(int projectNo)
	{
		ModelAndView mv = new ModelAndView();
		
		Project p = pService.selectOne(projectNo);
		mv.addObject("project", p);
		mv.setViewName("pay/payOption");
		return mv;
	}
	
}
