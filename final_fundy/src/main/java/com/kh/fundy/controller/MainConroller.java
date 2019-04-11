package com.kh.fundy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Category;
import com.kh.fundy.service.CategoryService;

@Controller
public class MainConroller {
	private ModelAndView mv;

	@Autowired
	private CategoryService service;
	
	
	@RequestMapping("/main.do")
	public String mainView(@RequestParam(value = "majorCode", required = false, defaultValue = "A01") String majorCategory, Model model)
	{
		List<Category> midCList = service.selectAllMid();
		
		model.addAttribute("majorCode", majorCategory);
		model.addAttribute("midCList", midCList);
		return "main";
	}
	
	@RequestMapping("/test/mainTest.do")
	public ModelAndView mainTest(@RequestParam(value = "majorCategory", required = false, defaultValue = "A01") String majorCategory,@RequestParam(value = "majorCategory", required = false, defaultValue = "B01") String midCategory, Model model) {
		mv = new ModelAndView();
		Map<String, String> ctgMap = new HashMap<String, String>();
		ctgMap.put("majorCategory", majorCategory);
		ctgMap.put("midCategory", midCategory);
		
		List<Map<String, Object>> projectListCtg = service.selectProjectList(ctgMap);	//모든목록이나 중분류카테고리별 조회
		List<Map<String, Object>> editorProjectList = service.selectEditorProjectList(ctgMap);	//에디터추천 프로젝트조회
		List<Map<String, Object>> newProjectList = service.selectNewSoonProjectList("all", "new");
		List<Map<String, Object>> soonProjectList = service.selectNewSoonProjectList("all", "soon");
		
		List<Category> midCList = service.selectAllMid();
		
		model.addAttribute("majorCategory", majorCategory);
		model.addAttribute("midCList", midCList);
		model.addAttribute("projectListCtg", projectListCtg);		//카테고리별인기프로젝트
		model.addAttribute("editorProjectList", editorProjectList);	//에디터추천프로젝트
		model.addAttribute("newProjectList", newProjectList);		//새 프로젝트
		model.addAttribute("soonProjectList", soonProjectList);		//마감임박 프로젝트
		
		mv.setViewName("mainViews/mainTest");
		return mv;
	}
	
	@RequestMapping("/main/changePopCtg.do")
	public ModelAndView changePopCtg(@RequestParam(value = "majorCategory", required = false, defaultValue = "A01") String majorCategory, String midCode, Model model) {
		mv = new ModelAndView();
		
		Map<String, String> ctgMap = new HashMap<String, String>();
		ctgMap.put("majorCategory", majorCategory);
		ctgMap.put("midCategory", midCode);
		
		List<Map<String, Object>> projectListCtg = service.selectProjectList(ctgMap);
		model.addAttribute("projectListCtg", projectListCtg);
		
		mv.setViewName("mainViews/projMainFrame");
		
		return mv;
	}
	
}
