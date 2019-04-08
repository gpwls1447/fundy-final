package com.kh.fundy.controller;

import static com.kh.fundy.common.PageBarTemplate.getPageBar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.FundingLog;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.service.ProjectListService;

@Controller
public class ProjectListController {

	@Autowired
	private ProjectListService service;
	
	@RequestMapping("/projectList/projectList.do")
	public ModelAndView projectList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, String majorCode, String midCode, String keyword, @RequestParam(value = "projectStatCode", required = false, defaultValue = "PS03") String projectStatCode, String orderby)
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("majorCode", majorCode);
		map.put("midCode", midCode);
		map.put("keyword", keyword);
		map.put("projectStatCode", projectStatCode);
		map.put("orderby", orderby);
		
		int numPerPage = 10;
		int totalCount = service.selectCount(map);
		List<Project> list = service.selectList(cPage, numPerPage, map);
		String pageBar = getPageBar(totalCount, cPage, numPerPage, "/projectList/projectList.do");
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("projectStatCode", projectStatCode);
		mv.addObject("pageBar", pageBar);
		mv.addObject("list", list);
		mv.addObject("majorCode", majorCode);
		mv.addObject("midCode", midCode);
		mv.addObject("keyword", keyword);
		mv.addObject("orderby", orderby);
		mv.setViewName("projectList/projectList");
		return mv;
	}
	
	@RequestMapping("/projectList/projectListDetail.do")
	public ModelAndView projectListDetail(int projectNo)
	{
		System.out.println(projectNo);
		Project p = service.selectOne(projectNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("project", p);
		mv.setViewName("projectList/projectListDetail");
		return mv;
	}
	
	@RequestMapping("/projectList/detail_community")
	public String projectListDetailCommunity()
	{
		return "projectList/projectListDetail_community";
	}
	
	@RequestMapping("/projectList/detail_funderList")
	public ModelAndView projectListDetailFunderList(String projectNo)
	{
		System.out.println("호롤롤롤" + projectNo);
		ModelAndView mv = new ModelAndView();
		List<FundingLog> flList = service.selectFunderList(Integer.parseInt(projectNo));
		mv.addObject("flList", flList);
		mv.setViewName("projectList/projectListDetail_funderList");
		return mv;
	}
	
}
