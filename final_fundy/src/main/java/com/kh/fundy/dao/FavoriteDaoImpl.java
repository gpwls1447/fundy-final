package com.kh.fundy.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Favorite;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Favorite> favoriteList(String sessionMemberEmail, int cPage, int numPerPage) {
		return session.selectList("favorite.favoriteList", sessionMemberEmail, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectCount(String sessionMemberEmail) {
		return session.selectOne("favorite.selectCount", sessionMemberEmail);
	}

	@Override
	public int insertFavorite(Favorite f) {
		return session.insert("favorite.insertFavorite", f);
	}

	@Override
	public int deleteFavorite(Favorite f) {
		return session.delete("favorite.deleteFavorite", f);
	}

	@Override
	public int deleteFavoriteList(Favorite f) {
		return session.delete("favorite.deleteFavoriteList", f);
	}
	
	
	
	
	
	
	
	
	

}
