package com.kh.fundy.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.service.ProjectModifyService;

@Controller
public class ProjectModifyController {
	@Autowired
	private ProjectModifyService service;
	
	private ModelAndView mv;
	//테스트용으로 108번 사용할것
	@RequestMapping("/project/projectModify.do")
	public ModelAndView testModify(int projectNo) {
		mv = new ModelAndView();
		
		Map<String, String> projectMap = new HashMap<String, String>();
		
		mv.addObject("project", projectMap);
		mv.setViewName("projectModify/modifyMain");
		return mv;
	}
}
