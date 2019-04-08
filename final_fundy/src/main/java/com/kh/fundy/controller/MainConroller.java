package com.kh.fundy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.fundy.model.vo.Category;
import com.kh.fundy.service.CategoryService;

@Controller
public class MainConroller {

	@Autowired
	private CategoryService service;
	
	
	@RequestMapping("/main.do")
	public String mainView(@RequestParam(value = "majorCategory", required = false, defaultValue = "A01") String majorCategory, Model model)
	{
		List<Category> midCList = service.selectAllMid();
		
		model.addAttribute("majorCategory", majorCategory);
		model.addAttribute("midCList", midCList);
		return "main";
	}
	
}
