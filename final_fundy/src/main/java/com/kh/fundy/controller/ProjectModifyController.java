package com.kh.fundy.controller;

import java.util.List;
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
		
		Map<String, Object> projectMap = service.selectProject(projectNo);
		List<Map<String, Object>> list = service.selectFundingOption(projectNo);
		for(int i=0; i<list.size(); i++) {
			List<Map<String, Object>> optionDetailList = service.selectOptionDetail(projectNo);
			list.get(i).put("OPTIONDETAILLIST", optionDetailList);
		}
		
		mv.addObject("project", projectMap);
		mv.setViewName("projectModify/modifyMain");
		return mv;
	}
}
