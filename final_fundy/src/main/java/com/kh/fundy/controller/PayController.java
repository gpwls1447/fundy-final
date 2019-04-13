package com.kh.fundy.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.FundingLog;
import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.model.vo.ShippingAddr;
import com.kh.fundy.service.MemberUpdateService;
import com.kh.fundy.service.PayService;
import com.kh.fundy.service.ProjectListService;

@Controller
public class PayController {

	@Autowired
	private ProjectListService projService;
	@Autowired
	private PayService payService;
	@Autowired
	private MemberUpdateService muService;
	
	@RequestMapping("/pay/optionSelect.do")
	public ModelAndView optionSelect(int projectNo, @RequestParam(value="packageIndex", required=false, defaultValue = "-1") int packageIndex)
	{
		ModelAndView mv = new ModelAndView();
		
		Project p = projService.selectOne(projectNo);
		mv.addObject("project", p);
		mv.addObject("packageIndex", packageIndex);
		mv.setViewName("pay/payOption");
		return mv;
	}
	
	@RequestMapping("/pay/payFinal.do")
	public ModelAndView payFinal(FundingOption fo, FundingLog fl, String projectTitle, int packageIndex)
	{
		ModelAndView mv = new ModelAndView();
		List<ShippingAddr> saList = muService.selectAddrList(fl.getMemberEmail());
		fo = projService.selectFundingOptionList(fo.getProjectNo()).get(packageIndex);
		mv.addObject("projectTitle", projectTitle);
		mv.addObject("FundingLog", fl);
		mv.addObject("fundingOption", fo);
		mv.addObject("saList", saList);
		mv.setViewName("pay/payFinal");
		return mv;
	}
	
	@RequestMapping("/pay/settle.do")
	public ModelAndView settled(FundingLog fl)
	{
		ModelAndView mv = new ModelAndView();
		fl.setDeliveryStatCode("DS01");
		fl.setFunderDate(new Timestamp(System.currentTimeMillis()));
		int result = payService.insertFundingLog(fl);
		
		String msg;
		if(result > 0){msg = "후원이 완료되었습니다.";}
		else{msg = "후원중 오류가 발생하였습니다.";}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/project/projetListDetail?projectNo="+fl.getProjectNo());
		mv.setViewName("common/msg");
		return mv;
	}
	
}
