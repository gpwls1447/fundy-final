package com.kh.fundy.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Favorite;
import com.kh.fundy.model.vo.Project;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Favorite> favoriteList(String sessionMemberEmail) {
		return session.selectList("favorite.favoriteList", sessionMemberEmail);
	}
	
	
	

}
