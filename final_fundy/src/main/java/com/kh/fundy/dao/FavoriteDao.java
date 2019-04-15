package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.Favorite;

public interface FavoriteDao {

	List<Favorite> favoriteList(String sessionMemberEmail);

}
