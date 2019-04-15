package com.kh.fundy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.FavoriteDao;
import com.kh.fundy.model.vo.Favorite;
import com.kh.fundy.model.vo.Project;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	
	@Autowired
	private FavoriteDao dao;

	@Override
	public List<Favorite> favoriteList(String sessionMemberEmail) {
		return dao.favoriteList(sessionMemberEmail);
	}

}
