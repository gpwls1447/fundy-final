package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.Favorite;
import com.kh.fundy.model.vo.Project;

public interface FavoriteService {

	List<Project> favoriteList(String sessionMemberEmail, int cPage, int numPerPage);

	int selectCount(String sessionMemberEmail);

	int insertFavorite(Favorite f);

	int deleteFavorite(Favorite f);

}
