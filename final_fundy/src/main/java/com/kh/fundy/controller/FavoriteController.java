package com.kh.fundy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Favorite;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.service.FavoriteService;
import com.kh.fundy.service.ProjectListService;

@SessionAttributes(value= {"loggedMember"})
@Controller
public class FavoriteController {
	
	private Logger logger = Logger.getLogger(FavoriteController.class);
	
	@Autowired
	private FavoriteService fService;
	
	@Autowired
	private ProjectListService pService;
	
	//찜바구니 리스트 보여주기
	@RequestMapping("/favorite/favoriteList.do")
	public ModelAndView favoriteList(Favorite f, HttpSession session){
		ModelAndView mv = new ModelAndView();
		
		String sessionMemberEmail = (String)session.getAttribute("memberEmail");
		int numPerPage = 10;

		Map<String, Object> map = new HashMap<>();
		List<Favorite> list = fService.favoriteList(sessionMemberEmail);
		
		map.put("list", list);
		map.put("count", list.size());
	
		mv.addObject("map", map);
		mv.setViewName("favorite/favoriteList.do");
		
		return mv;
	}
}
