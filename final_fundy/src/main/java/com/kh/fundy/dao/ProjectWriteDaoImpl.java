package com.kh.fundy.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Category;
import com.kh.fundy.model.vo.Member;

@Repository
public class ProjectWriteDaoImpl implements ProjectWriteDao {
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Category> selectMidCategorys(String majorCategory) {
		return session.selectList("projectWrite.selectMidCategorys", majorCategory);
	}
	
	@Override
	public List<Category> selectMinorCategorys(String majorCategory) {
		// TODO Auto-generated method stub
		return session.selectList("projectWrite.selectMinorCategorys", majorCategory);
	}
	
	@Override
	public Member selectMember(Member m) {
		return session.selectOne("projectWrite.selectMember", m.getMemberEmail());
	}
	
	@Override
	public void insertProject(String memberEmail) {
		session.insert("projectWrite.insertProject", memberEmail);
	}
	
	@Override
	public int selectProjectNo() {
		return session.selectOne("projectWrite.selectProjectNo");
	}
	
	@Override
	public int updateProjectThumnail(Map<String, String> map) {
		return session.update("projectWrite.updateThumnail", map);
	}
	
	@Override
	public int insertProjectImageSrc(Map<String, String> map) {
		return session.update("projectWrite.insertProjectImageSrc", map);
	}
	
	@Override
	public String selectProfileImage(String memberEmail) {
		return session.selectOne("projectWrite.selectProfileImage", memberEmail);
	}
	
	@Override
	public void updateProfileImage(Map<String, String> map) {
		session.update("projectWrite.updateProfileImage", map);
	}
	
	@Override
	public String selectThumnail(String projectNo) {
		return session.selectOne("projectWrite.selectThumnail", projectNo);
	}
	
	@Override
	public int updateTempSaveProject(Map<String, Object> project) {
		return session.update("projectWrite.updateTempSaveProject", project);
	}
	
	@Override
	public int updateEntryProject(int pNo) {
		return session.update("projectWrite.updateEntryProject", pNo);
	}
	
	@Override
	public int tempSaveProjectAccount(Map<String, Object> project) {
		return session.insert("projectWrite.insertProjectAccount", project);
	}
	
	@Override
	public int tempSaveProjectAccountUpdate(Map<String, Object> project) {
		return session.update("projectWrite.updateProjectAccount", project);
	}
	
	@Override
	public int deleteProjectAccount(Map<String, Object> project) {
		return session.delete("projectWrite.deleteProjectAccount", project);
	}
	
	@Override
	public void deleteRewards(Map<String, Object> reward) {
		session.delete("projectWrite.deleteOptionDetail", reward);
		session.delete("projectWrite.deleteOption", reward);
	}
	
	@Override
	public int saveFundingOption(Map<String, Object> reward) {
		return session.insert("projectWrite.insertReward", reward);
	}
	
	@Override
	public int insertOptionDetail(Map<String, Object> option) {
		return session.insert("projectWrite.insertOptionDetail", option);
	}
	
	@Override
	public int projectWritedCnt(String memberEmail) {
		return session.selectOne("projectWrite.projectWritedCnt", memberEmail);
	}
	
	@Override
	public int selectSavedProjectNo(String memberEmail) {
		return session.selectOne("projectWrite.selectSavedProjectNo", memberEmail);
	}
}
