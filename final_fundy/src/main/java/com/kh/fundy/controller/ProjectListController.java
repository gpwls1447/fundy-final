package com.kh.fundy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Project;
import com.kh.fundy.service.ProjectListService;

@Controller
public class ProjectListController {

	@Autowired
	private ProjectListService service;
	
	@RequestMapping("/projectList.do")
	public ModelAndView projectList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage)
	{
		int numPerPage = 10;
		int totalCount = service.selectCount();
		List<Project> list = service.selectList(cPage, numPerPage);
		int pageBarSize = 5;
		
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
}
