package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.ProjectWriteDao;
import com.kh.fundy.model.vo.Category;
import com.kh.fundy.model.vo.Member;

@Service
public class ProjectWriteServiceImpl implements ProjectWriteService {
	@Autowired
	private ProjectWriteDao dao;
	
	@Override
	public List<Category> selectMidCategorys(String majorCategory) {
		return dao.selectMidCategorys(majorCategory);
	}
	
	@Override
	public List<Category> selectMinorCategorys(String majorCategory) {
		// TODO Auto-generated method stub
		return dao.selectMinorCategorys(majorCategory);
	}
	
	@Override
	public Member selectMember(Member m) {
		return dao.selectMember(m);
	}
	
	@Override
	public void insertProject(String memberEmail) {
		dao.insertProject(memberEmail);
	}
	
	@Override
	public int selectProjectNo() {
		return dao.selectProjectNo();
	}
	
	@Override
	public int updateProjectThumnail(Map<String, String> map) {
		return dao.updateProjectThumnail(map);
	}
	
	@Override
	public int insertProjectImageSrc(Map<String, String> map) {
		return dao.insertProjectImageSrc(map);
	}
	
	@Override
	public String selectProfileImage(String memberEmail) {
		return dao.selectProfileImage(memberEmail);
	}
	
	@Override
	public void updateProfileImage(Map<String, String> map) {
		dao.updateProfileImage(map);
	}
	
	@Override
	public String selectThumnail(String projectNo) {
		return dao.selectThumnail(projectNo);
	}
	
	@Override
	public int updateTempSaveProject(Map<String, Object> project) {
		return dao.updateTempSaveProject(project);
	}
	
	@Override
	public int updateEntryProject(int pNo) {
		return dao.updateEntryProject(pNo);
	}
	
	@Override
	public int tempSaveProjectAccount(Map<String, Object> project) {
		int result = dao.tempSaveProjectAccount(project);
		if(result <= 0) {
			dao.tempSaveProjectAccountUpdate(project);
		}
		return result;
	}
	
	@Override
	public int deleteProjectAccount(Map<String, Object> project) {
		return dao.deleteProjectAccount(project);
	}
	
	@Override
	public int saveFundingOption(Map<String, Object> reward) {
		return dao.saveFundingOption(reward);
	}
	
	@Override
	public void deleteRewards(Map<String, Object> reward) {
		dao.deleteRewards(reward);
	}
	
	@Override
	public int insertOptionDetail(Map<String,Object> option) {
		return dao.insertOptionDetail(option);
	}
	
	@Override
	public int projectWritedCnt(String memberEmail) {
		return dao.projectWritedCnt(memberEmail);
	}
	
	@Override
	public int selectSavedProjectNo(String memberEmail) {
		return dao.selectSavedProjectNo(memberEmail);
	}
}
