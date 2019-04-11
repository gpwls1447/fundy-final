package com.kh.fundy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.FundingLog;
import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.service.ProjectListService;

@Controller
public class PayController {

	@Autowired
	private ProjectListService pService;
	
	@RequestMapping("/pay/optionSelect.do")
	public ModelAndView optionSelect(int projectNo, int packageIndex)
	{
		ModelAndView mv = new ModelAndView();
		
		Project p = pService.selectOne(projectNo);
		mv.addObject("project", p);
		mv.addObject("packageIndex", packageIndex);
		mv.setViewName("pay/payOption");
		return mv;
	}
	
	@RequestMapping("/pay/payFinal.do")
	public ModelAndView payFinal(FundingOption fo, String projectTitle, int packageIndex, int extraMoney, int packageAmount)
	{
		ModelAndView mv = new ModelAndView();
		fo = pService.selectFundingOptionList(fo.getProjectNo()).get(packageIndex);
		mv.addObject("projectTitle", projectTitle);
		mv.addObject("extraMoney", extraMoney);
		mv.addObject("fundingOption", fo);
		mv.setViewName("pay/payFinal");
		return mv;
	}
	
	@RequestMapping("/pay/settle.do")
	public ModelAndView settled(FundingLog fl)
	{
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
}
