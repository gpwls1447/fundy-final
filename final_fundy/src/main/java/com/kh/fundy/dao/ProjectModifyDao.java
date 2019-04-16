package com.kh.fundy.dao;

import java.util.List;
import java.util.Map;

public interface ProjectModifyDao {
	Map<String, Object> selectProject(int projectNo);
	List<Map<String, Object>> selectFundingOption(int projectNo);
	List<Map<String, Object>> selectOptionDetail(Object packageNo);
	String selectMajorCode(String minorCode);
}
