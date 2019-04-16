package com.kh.fundy.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Category;
import com.kh.fundy.service.ProjectModifyService;
import com.kh.fundy.service.ProjectWriteService;

@Controller
public class ProjectModifyController {
	@Autowired
	private ProjectModifyService service;
	@Autowired
	private ProjectWriteService pwService;
	
	private ModelAndView mv;
	//테스트용으로 108번 사용할것
	@RequestMapping("/project/projectModify.do")
	public ModelAndView testModify(int projectNo) {
		mv = new ModelAndView();
		
		Map<String, Object> projectMap = service.selectProject(projectNo);
		List<Map<String, Object>> list = service.selectFundingOption(projectNo);
		for(int i=0; i<list.size(); i++) {
			List<Map<String, Object>> optionDetailList = service.selectOptionDetail(list.get(i).get("PACKAGENO"));
			list.get(i).put("OPTIONDETAILLIST", optionDetailList);
		}
		projectMap.put("rewards", list);
		
		String majorCode = service.selectMajorCode((String)projectMap.get("MINORCODE"));
		
		List<Category> midList = pwService.selectMidCategorys(majorCode);
    	List<Category> minorList = pwService.selectMinorCategorys(majorCode);
    	
    	List<String> bankList = new ArrayList<String>();
    	bankList.add("국민은행");
    	bankList.add("NH농협은행");
    	bankList.add("우리은행");
    	bankList.add("신한은행");
    	bankList.add("KEB하나은행");
    	bankList.add("카카오뱅크");
    	
    	mv.addObject("bankList", bankList);
		mv.addObject("midList", midList);
		mv.addObject("minorList", minorList);
		mv.addObject("projectNo", projectNo);
		mv.addObject("project", projectMap);
		mv.setViewName("projectModify/modifyMain");
		return mv;
	}
}
