package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.Favorite;

public interface FavoriteDao {

	List<Favorite> favoriteList(String sessionMemberEmail, int cPage, int numPerPage);

	int selectCount(String sessionMemberEmail);

	int insertFavorite(Favorite f);

	int deleteFavorite(Favorite f);

	int deleteFavoriteList(Favorite f);

}
