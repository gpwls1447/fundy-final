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

import com.kh.fundy.model.vo.Project;
import com.kh.fundy.service.ProjectListService;

@Controller
public class MyprojectController {

	@Autowired
	private ProjectListService pService;
	
	@RequestMapping("/myproject/myprojectList.do")
	public ModelAndView myprojectList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, String memberEmail)
	{
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		
		Map map = new HashMap();
		map.put("memberEmail", memberEmail);
		
		int totalCount = pService.selectCount(map);
		List<Project> list = pService.selectList(cPage, numPerPage, map);
		String pageBar = getPageBar(totalCount, cPage, numPerPage);
		mv.addObject("list", list);
		mv.addObject("pageBar", pageBar);
		mv.setViewName("myproject/myproject");
		
		return mv;
	}
}
