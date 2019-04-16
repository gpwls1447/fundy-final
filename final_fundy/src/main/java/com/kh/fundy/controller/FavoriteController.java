package com.kh.fundy.controller;

import static com.kh.fundy.common.PageBarTemplate.getPageBar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Favorite;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.service.FavoriteService;

@SessionAttributes(value= {"loggedMember"})
@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteService service;
	
	//찜바구니 리스트 보여주기
	@RequestMapping("/favorite/favoriteList.do")
	public ModelAndView favoriteList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, String memberEmail)
	{
		ModelAndView mv = new ModelAndView();

		int numPerPage = 10;
		int totalCount = service.selectCount(memberEmail);
		
		Map<String, Object> map = new HashMap<>();
		List<Project> list = service.favoriteList(memberEmail, cPage, numPerPage);
		String pageBar = getPageBar(totalCount, cPage, numPerPage);
		
		map.put("list", list);
		map.put("count", list.size());
		map.put("pageBar", pageBar);
	
		mv.addObject("map", map);
		mv.setViewName("favorite/favoriteList");
		
		return mv;
	}
	
	//찜바구니 추가
	@RequestMapping("/projectList/insert_favorite")
	public ModelAndView insertFavorite(Favorite f) {
		ModelAndView mv = new ModelAndView();
	
		int result = service.insertFavorite(f);
		mv.addObject("result", result);
		mv.setViewName("jsonView"); 
		return mv;
	}
	
	//찜바구니 삭제
	@RequestMapping("/projectList/delete_favorite")
	public ModelAndView deleteFavorite(Favorite f) {
		ModelAndView mv = new ModelAndView();
		
		int result = service.deleteFavorite(f);
		
		mv.addObject("result", result);
		mv.setViewName("jsonView");
		return mv;
	}
	
	//찜바구니에서 X버튼 눌러서 제거하기
	@RequestMapping("/favorite/deleteFavoriteList.do")
	public ModelAndView deleteFavoriteList(Favorite f, Model model) {
		
		ModelAndView mv = new ModelAndView();
		int result = service.deleteFavoriteList(f);
		
		mv.addObject("result", result);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
}
