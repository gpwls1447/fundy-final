package com.kh.fundy.controller;

import static com.kh.fundy.common.PageBarTemplate.getPageBar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;


	private Logger logger=LoggerFactory.getLogger(AdminController.class);

	/*//adminPage로 전환
	@RequestMapping("/admin/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}*/

	//memberList 보여주기
	@RequestMapping("/admin/adminPage.do")
	public ModelAndView memberList(Member m, Project p, @RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage=10;
		int totalCount = service.selectCount();

		Map<String, Object> map= new HashMap<>();
		List<Project> list = service.selectList(cPage, numPerPage);
		String pageBar = getPageBar(totalCount, cPage, numPerPage);
		
		map.put("list", list);
		map.put("count", list.size());
		map.put("pageBar", pageBar);
		
		System.out.println("list : "+list);
		System.out.println("map : "+map);
		
		mv.addObject("map", map);
		mv.setViewName("admin/adminPage");
		return mv;
	}





}
