package com.kh.fundy.controller;

import static com.kh.fundy.common.PageBarTemplate.getPageBar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Category;
import com.kh.fundy.model.vo.Comment;
import com.kh.fundy.model.vo.FundingLog;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.service.CategoryService;
import com.kh.fundy.service.CommentService;
import com.kh.fundy.service.ProjectListService;

@Controller
public class ProjectListController {

	@Autowired
	private ProjectListService pService;
	@Autowired
	private CommentService cService;
	@Autowired
	private CategoryService categService;
	
	@RequestMapping("/projectList/projectList.do")
	public ModelAndView projectList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, String majorCode, String midCode, String keyword, @RequestParam(value = "projectStatCode", required = false, defaultValue = "PS03") String projectStatCode, String orderby, HttpSession session, String memberEmail)
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("majorCode", majorCode);
		map.put("midCode", midCode);
		map.put("keyword", keyword);
		map.put("projectStatCode", projectStatCode);
		map.put("orderby", orderby);
		map.put("memberEmail", memberEmail);
		
		int numPerPage = 10;
		int totalCount = pService.selectCount(map);
		List<Project> list = pService.selectList(cPage, numPerPage, map);
		List<Category> midCList = categService.selectAllMid();
		String pageBar = getPageBar(totalCount, cPage, numPerPage);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pageBar", pageBar);
		mv.addObject("list", list);
		mv.addObject("projectStatCode", projectStatCode);
		mv.addObject("majorCode", majorCode);
		mv.addObject("midCode", midCode);
		mv.addObject("keyword", keyword);
		mv.addObject("orderby", orderby);
		mv.addObject("midCList", midCList);
		mv.setViewName("projectList/projectList");
		return mv;
	}
	
	@RequestMapping("/projectList/projectListDetail.do")
	public ModelAndView projectListDetail(int projectNo, HttpSession session)
	{
		Map map = new HashMap();
		map.put("projectNo", projectNo);
		Member m = (Member)session.getAttribute("loggedMember");
		if(m != null) {map.put("memberEmail", m.getMemberEmail());}
		
		Project p = pService.selectOne(map);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("project", p);
		mv.setViewName("projectList/projectListDetail");
		
		return mv;
	}
	
	@RequestMapping("/projectList/detail_community")
	public ModelAndView projectListDetailCommunity(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, int projectNo)
	{
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		int totalCount = cService.selectCommentCount(projectNo);
		
		List<Comment> list = cService.selectCommentList(cPage, numPerPage, projectNo);
		System.out.println(list.size());
		String pageBar = getPageBar(totalCount, cPage, numPerPage);
		
		mv.addObject("list", list);
		mv.addObject("pageBar", pageBar);
		mv.addObject("projectNo", projectNo);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("projectList/projectListDetail_community");
		
		return mv;
	}
	
	@RequestMapping("/projectList/detail_funderList")
	public ModelAndView projectListDetailFunderList(String projectNo)
	{
		ModelAndView mv = new ModelAndView();
		List<FundingLog> flList = pService.selectFunderList(Integer.parseInt(projectNo));
		mv.addObject("flList", flList);
		mv.setViewName("projectList/projectListDetail_funderList");
		return mv;
	}
	
}
