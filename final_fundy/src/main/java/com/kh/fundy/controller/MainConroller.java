package com.kh.fundy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainConroller {

	@RequestMapping("/main.do")
	public String mainView()
	{
		return "main";
	}
	
}
