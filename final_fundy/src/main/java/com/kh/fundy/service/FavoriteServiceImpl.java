package com.kh.fundy.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.FavoriteDao;
import com.kh.fundy.dao.ProjectListDao;
import com.kh.fundy.model.vo.Favorite;
import com.kh.fundy.model.vo.Project;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	
	@Autowired
	private FavoriteDao dao;
	
	@Autowired
	private ProjectListDao pDao;
	
	@Override
	public List<Project> favoriteList(String sessionMemberEmail, int cPage, int numPerPage) {
		
		List<Favorite> flist = dao.favoriteList(sessionMemberEmail, cPage, numPerPage);
		List<Project> pList = new ArrayList<Project>(); 
		for(Favorite f : flist)
		{
			Map<String, Integer> map = new HashMap<>();
			map.put("projectNo", f.getProjectNo());
			pList.add(pDao.selectOne(map));
		}
		
		return pList;
	}

	@Override
	public int selectCount(String sessionMemberEmail) {
		return dao.selectCount(sessionMemberEmail);
	}

	@Override
	public int insertFavorite(Favorite f) {
		return dao.insertFavorite(f);
	}

	@Override
	public int deleteFavorite(Favorite f) {
		return dao.deleteFavorite(f);
	}
	
	
	
	

}
