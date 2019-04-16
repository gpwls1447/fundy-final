package com.kh.fundy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Category;
import com.kh.fundy.service.CategoryService;
import com.kh.fundy.service.MainService;

@Controller
public class MainConroller {
	private ModelAndView mv;

	@Autowired
	private CategoryService cService;
	@Autowired
	private MainService service;
	
	
	@RequestMapping("/main.do")
	public ModelAndView mainTest(@RequestParam(value = "majorCode", required = false, defaultValue = "A01") String majorCode, @RequestParam(value = "midCategory", required = false, defaultValue = "B01") String midCategory, Model model) {
		mv = new ModelAndView();
		Map<String, String> ctgMap = new HashMap<String, String>();
		ctgMap.put("majorCode", majorCode);
		ctgMap.put("midCategory", midCategory);
		
		List<Map<String, Object>> editorProjectList = service.selectEditorProjectList(ctgMap);	//에디터추천 프로젝트조회
		List<Map<String, Object>> newProjectList = service.selectNewSoonProjectList("all", "new", majorCode);
		List<Map<String, Object>> soonProjectList = service.selectNewSoonProjectList("all", "soon", majorCode);
		
		List<Category> midCList = cService.selectAllMid();
		
		model.addAttribute("majorCode", majorCode);
		model.addAttribute("midCList", midCList);
		model.addAttribute("editorProjectList", editorProjectList);	//에디터추천프로젝트
		model.addAttribute("newProjectList", newProjectList);		//새 프로젝트
		model.addAttribute("soonProjectList", soonProjectList);		//마감임박 프로젝트
		
		mv.setViewName("mainViews/mainView");
		return mv;
	}
	
	@RequestMapping("/main/changePopCtg.do")
	public ModelAndView changePopCtg(@RequestParam(value = "majorCategory", required = false, defaultValue = "A01") String majorCategory, String midCode, Model model) {
		mv = new ModelAndView();
		
		Map<String, String> ctgMap = new HashMap<String, String>();
		ctgMap.put("majorCode", majorCategory);
		ctgMap.put("midCategory", midCode);
		
		List<Map<String, Object>> projectListCtg = service.selectProjectList(ctgMap);
		model.addAttribute("projectListCtg", projectListCtg);
		
		mv.setViewName("mainViews/popFrame");
		
		return mv;
	}
	
	@RequestMapping("/main/changePaging.do")
	public ModelAndView changePaging(int cPage, String choice, String condition, String majorCode) {
		mv = new ModelAndView();
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("cPage", String.valueOf(cPage));
		paraMap.put("choice", choice);
		paraMap.put("condition", condition);
		paraMap.put("majorCode", majorCode);
		
		if(condition.equals("next")) {
			cPage = cPage + 1;
		}
		else {
			cPage = cPage - 1;
		}
		
		int totalCount = service.selectTotalCount(paraMap.get("majorCode"));	//majorCode만 이용
		int numPerPage = 4;
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		int startNo = (cPage-1)*numPerPage + 1;
		int endNo = cPage * numPerPage;
		paraMap.put("startNo", String.valueOf(startNo));
		paraMap.put("endNo", String.valueOf(endNo));
		System.out.println(startNo);
		System.out.println(endNo);
		
		String pageBtn = "<ul class='pagination pagination-sm justify-content-end'>";
		//이전버튼 만들기
		if(cPage == 1) {
			pageBtn = pageBtn + "<li class=\"page-item disabled\"><a class=\"page-link paging\" onclick=\"fn_paging('previous')\">&laquo;</a></li>"; 
		}
		else {
			pageBtn = pageBtn + "<li class=\"page-item\"><a class=\"page-link paging\" onclick=\"fn_paging('previous')\">&laquo;</a></li>"; 
		}
		
		//다음버튼만들기
		if(cPage == totalPage) {
			pageBtn = pageBtn + "<li class=\"page-item disabled\"><a class=\"page-link paging\" onclick=\"fn_paging('next')\">&raquo;</a></li></ul>";
		}
		else {
			pageBtn = pageBtn + "<li class=\"page-item\"><a class=\"page-link paging\" onclick=\"fn_paging('next')\">&raquo;</a></li></ul>";
		}
		
		List<Map<String, String>> projList = service.selectPagingList(paraMap);
		
		mv.addObject("cho", choice);
		mv.addObject("pageBtn", pageBtn);
		mv.addObject("list", projList);
		mv.addObject("cPage", cPage);

		mv.setViewName("mainViews/frame");
		return mv;
	}
	
}
