package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

import com.kh.fundy.model.vo.Category;
import com.kh.fundy.model.vo.Member;

public interface ProjectWriteService {
	List<Category> selectMidCategorys(String majorCategory);
	List<Category> selectMinorCategorys(String majorCategory);
	Member selectMember(Member m);
	void insertProject(String memberEmail);
	int selectProjectNo();
	int updateProjectThumnail(Map<String, String> map);
	int insertProjectImageSrc(Map<String, String> map);
	String selectProfileImage(String memberEmail);
	String selectThumnail(String projectNo);
	void updateProfileImage(Map<String, String> map);
	int updateTempSaveProject(Map<String, Object> project);
	int updateEntryProject(int pNo);
	int tempSaveProjectAccount(Map<String, Object> project);
	int deleteProjectAccount(Map<String, Object> project);
	int saveFundingOption(Map<String, Object> reward);
	void deleteRewards(Map<String, Object> reward);
	int insertOptionDetail (Map<String,Object> option);
	int projectWritedCnt(String memberEmail);
	int selectSavedProjectNo(String memberEmail);
}
