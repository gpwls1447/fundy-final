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

import com.kh.fundy.model.vo.MyDonation;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.service.ProjectListService;

@Controller
public class MyPageController {

	@Autowired
	private ProjectListService pService;
	
	@RequestMapping("/myPage/myProjectList.do")
	public ModelAndView myprojectList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, String memberEmail, String keyword, String projectStatCode, String orderby)
	{
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		
		Map<String, String> map = new HashMap<>();
		map.put("memberEmail", memberEmail);
		map.put("keyword", keyword);
		map.put("projectStatCode", projectStatCode);
		map.put("orderby", orderby);
		
		int totalCount = pService.selectCount(map);
		List<Project> list = pService.selectList(cPage, numPerPage, map);
		String pageBar = getPageBar(totalCount, cPage, numPerPage);
		mv.addObject("map", map);
		mv.addObject("list", list);
		mv.addObject("pageBar", pageBar);
		mv.setViewName("myPage/myProject");
		
		return mv;
	}
	
	@RequestMapping("/myPage/myDonationList.do")
	public ModelAndView myprojectList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, String memberEmail)
	{
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		int totalCount = pService.myDonationCount(memberEmail);
		List<MyDonation> list = pService.myDonationList(memberEmail, cPage, numPerPage);
		
		String pageBar = getPageBar(totalCount, cPage, numPerPage);
		
		mv.addObject("list", list);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.addObject("pageBar", pageBar);
		mv.setViewName("myPage/myDonation");
		return mv;
	}
}
