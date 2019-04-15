package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.Favorite;

public interface FavoriteService {

	List<Favorite> favoriteList(String sessionMemberEmail);

}
